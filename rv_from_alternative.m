% Final Exam 2024
% Problem 8 Code
%
% Determine position and velocity vector in Geocentric
%  equatorial reference frame (I-J-K) from alternative state 
%  description:
%    xp, yp, zp   - coordinates of periapsis in I-J-K frame
%     n1 = (h^2/mu) xn - component of node vector
%     n2 = (h^2/mu) yn - component of node vector
%     E - eccentric anomaly
function [rgeo,vgeo]=rv_from_alternative(state)


mu=398600;
% Unpack alternative state description

xp=state(1);
yp=state(2);
zp=state(3);
n1=state(4);
n2=state(5);
E=state(6);

rp=[xp yp zp];
radiusp=norm(rp);
unitp=rp/radiusp;

semilatus=norm([n1 n2 0]);
unitnode=[n1 n2 0]/semilatus;

% find semimajor axis and eccentricity
ecc=semilatus/radiusp -1;
a=semilatus/(1-ecc^2);
h=sqrt(semilatus*mu);


% Find orbit plane orientation
% First determine direction of angular momentum vector 
% This depends on whether perigee is in the northern or southern 
%   hemisphere

if unitp(3)>0             % Northern hemisphere             
    c=cross(unitnode,unitp);  % FIX c=cross(unitp,unitnode);                      
    unith=c/norm(c);
else
    if unitp(3)<0         % Southern hemisphere
        c=cross(unitp,unitnode); % FIX c=cross(unitnode,unitp); 
        unith=c/norm(c);
    else                  % on Equator
        disp('Error: periapsis at ascending node')
        disp('No conversion possible in this case')
    end
end

% Now find unit vector in orbital plane at 90 degree true anomaly

unitq=cross(unith,unitp);

% Make rotation matrix Cpergeo from unit vectors                 
Cpergeo = [unitp ; unitq ; unith]; % Cpergeo = [unitp'  unitq' unith']; 

% Find position and velocity in perifocal frame
% First find true anomaly from eccentric anomaly
theta=2*atan(sqrt((1+ecc)/(1-ecc))*tan(E/2)); % FIX theta=2*atan(sqrt((1-ecc)/(1+ecc))*tan(E/2));
if theta<0
    theta=theta+2*pi;
end    
% and now components in perifocal coordinate system
radius=(semilatus/(1+ecc*cos(theta)));
rper=radius*[cos(theta); sin(theta); 0];
vper=[-mu*sin(theta)/h; (mu*ecc/h+mu*cos(theta)/h); 0];

% Transform components from perifocal to I-J-K frame

rgeo=Cpergeo'*rper;
vgeo=Cpergeo'*vper;



