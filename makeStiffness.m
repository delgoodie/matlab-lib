function K = makeStiffness(node)
%             | 1000# 
%             V
%     2000#->  o (1)
%            / \
%       (2) o---o  (3)
%          / \ / \
%     (4) o---o---o  (6)
%        / \ / \ / \ 
%   (7) o---o---o---o  (10)  
%       ^           O  
    
    nnode = 10;
    K = zeros(nnode * 2);
    
    AE = 2.0e5;  % 1060 Aluminum rod which is 0.5" in diameter = 2.0e6
    nele = 18;   % Number of elements (#links = 18)
    % Define link connections.  Connections are: (from node, to node)
    link = [1 2;1 3;2 3;2 4;2 5;3 5;3 6;4 5;5 6;4 7;4 8;5 8];
    link = [link;5 9;6 9;6 10;7 8;8 9;9 10];
    L = zeros(1,nele);    % Direction cosine (angle from x-axis)
    M = zeros(1,nele);    % Direction cosine (angle from y-axis)
    % Define global force vector.  Set unknown forces to zero.
    % 20 forces = 10 nodes *2 forces (x,y)/node
    % Odd values are x forces, even values are y forces.
    % 1 is at top, (13,14) are lower left, (19,20) are lower right
    
    % Initialize vectors.  
    % y...20 = 2*nodes (x and y displ)
    Len(1:nele) = 0;   % Array for length of each link
    
    %__________Part 2: Form the Total K matrix____________________________
    % Based upon node positions, determine direction cosines of elements
    for R=1:nele  % R = row...cycle through all elements
        fn = link(R,1);  % From node
        tn = link(R,2);  % To node
        xf = node(fn,1); % x value of "from node"
        yf = node(fn,2); % y value of "from node"
        xt = node(tn,1); % x value of "to node"
        yt = node(tn,2); % y value of "to node"
        Len(R) = sqrt((xt-xf)^2+(yt-yf)^2); % length of element
    
        % Get direction cosines:
        % The following has signs.  Mistake in textbook.
            % Check the following....%
        L(R) = (xt-xf)/Len(R);
        M(R) = (yt-yf)/Len(R);
    %       The following, from textbook, does not incorporate any sign
    %     L(R) = cos(atan((yt-yf)/(xt-xf)));
%   cos(atan((xt-xf)/(yt-yf)));
        if DEBUG 
           fprintf('RLM %d %8.5f %8.5f \n',R,L(R),M(R)); % Used for debug
        end
    
        % Find K matrix for element.
        kax = AE/Len(R);  % spring rate along bar; local coordinates
        T = kax*[L(R)^2 L(R)*M(R); L(R)*M(R) M(R)^2]; % Global coordinates
        i = 2*fn-1;  % adjust "from" index
        j = 2*tn-1;  % adjust "to" index
        % Add each element to the total K matrix
        K(i:i+1,i:i+1) = K(i:i+1,i:i+1) + T(1:2,1:2);  % Quadrant 1:1
        K(j:j+1,j:j+1) = K(j:j+1,j:j+1) + T(1:2,1:2);  % Quadrant 2:2
        K(i:i+1,j:j+1) = K(i:i+1,j:j+1) - T(1:2,1:2);  % Quadrant 1:2
        K(j:j+1,i:i+1) = K(j:j+1,i:i+1) - T(1:2,1:2);  % Quadrant 2:1
    end
end