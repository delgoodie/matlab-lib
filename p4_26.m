mu = 398600;
r1 = [-2429.1 4555.1 4577];
v1 = [-4.7689 -5.6113 3.0535];
dt = 72*3600;
h = cross(r1,v1);
hmag = norm(h);
i = acosd(h(3)/hmag);
K = [0 0 1];
N = cross(K,h);
if N(2) >= 0
    omega_cap = acosd(N(1)/norm(N));
else
    omega_cap = 360 - acosd(N(1)/norm(N));
end
evec = 1/mu*cross(v1,h) - (r1/norm(r1));
e = norm(evec);
if evec(3) >= 0
    omega = acosd(dot(N,evec)/norm(N)/e);
else
    omega = 360 - acosd(dot(N,evec)/norm(N)/e);
end
theta1 = 0;
a = norm(h)^2/mu/(1-e^2);
T = 2*pi()/sqrt(mu)*a^(3/2);
t1 = 0;
t2 = t1 + dt;
M2 = 2*pi()*mod(t2,T)/T;
fun = @(E2) M2-E2+(e*sin(E2));
E2 = fzero(fun,0);
theta2 = 2*atand(tan(E2/2)*sqrt((1+e)/(1-e))) + 360;
r1_pq = norm(h)^2/mu/(1+e*cosd(theta2))*[cosd(theta2) sind(theta2) 0]
v1_pq = mu/norm(h)*[-sind(theta2) e*cosd(theta2) 0];
J2e = 1.08263e-3;

Re = 6378;
const = -3/2*sqrt(mu)*J2e*Re^2/((1-e^2)^2*a^(7/2))
omega_cap_dot = const*cosd(i) * (180/pi());
omega_dot = const*(5/2*(sind(i))^2 - 2) * (180/pi());
omega_cap2 = omega_cap + omega_cap_dot*dt;
omega2 = omega + omega_dot*dt;

R31 = [cosd(omega_cap2) sind(omega_cap2) 0 ; -sind(omega_cap2) cosd(omega_cap2) 0 ; 0 0 1];
R1 = [1 0 0 ; 0 cosd(i) sind(i) ; 0 -sind(i) cosd(i)];
R32 = [cosd(omega2) sind(omega2) 0 ; -sind(omega2) cosd(omega2) 0 ; 0 0 1];
Q = (R32*R1*R31)';
r2_geo = Q*r1_pq'
v2_geo = Q*v1_pq'