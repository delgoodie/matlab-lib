function Fmax = calcMaxForce(node, K)

    nnode = 10;    
    AE = 2.0e5;  % 1060 Aluminum rod which is 0.5" in diameter = 2.0e6
    nele = 18;   % Number of elements (#links = 18)

    D(1:2*nnode) = 0;  % Displacement array
    Len = zeros(nele, 1);
    Force = zeros(nele, 1);

    F = zeros(20,1);
    F(1) = 2000;  % 2000 pounds in the x direction on node 1.
    F(2) = -1000; % -1000 pounds in the y direction on node 1.

    % Reduce K...remove rows/cols 13, 14 and 20 
    % These are the pivots with zero displacement, (can check forces)
    % Always nullify higher rows/cols first to maintain proper numbering
    Kred = K; % reduced K
    Fred = F; % reduced F
    Kred(20,:) = [];      % Nullify row 20
    Kred(:,20) = [];      % Nullify col 20
    Kred(13:14,:) = [];   % Nullify rows 13 and 14
    Kred(:,13:14) = [];   % Nullify cols 13 and 14
    Fred(20) = [];        % Nullify row 20 of the forces
    Fred(13:14) = [];     % Nullify rows 13 and 14 of the forces
    %!!!!!!!!!!!!!Does K need to be transposed?????
    D = inv(Kred)*Fred;  % Find displacements
    D = [D(1:12);0.0;0.0;D(13:17);0.0];  % Add 0 disp to column vector
        
    % Determine change in length for each element (link), and force
    for R=1:nele
        fn = link(R,1);   % From node
        tn = link(R,2);   % To node
        dxf = D(fn*2-1);  % change in x value of "from node"
        dyf = D(fn*2);    % change in y value of "from node"
        dxt = D(tn*2-1);  % change in x value of "to node" 
        dyt = D(tn*2);    % change in y value of "to node"
    
        xf = node(fn,1);  % x value of "from node"
        yf = node(fn,2);  % y value of "from node"
        xt = node(tn,1);  % x value of "to node"
        yt = node(tn,2);  % y value of "to node"
         
        % Added 12/8/2022 to fix errors. Answers checked and are good.
        theta = atan2(yt-yf,xt-xf);
        Ct = cos(theta); St = sin(theta);
        
        % Determine the change in overall length
        dLen = Ct*(dxt-dxf)+St*(dyt-dyf);   % New and improved
        dL(R) = dLen*100;   % Store change in length in hundredths of inch
            % Check the following....%
        Force(R) = AE*dLen/Len(R);  % Force in each link, F=A(E*strain)
    end
    Fmax = max(abs(Force));
end