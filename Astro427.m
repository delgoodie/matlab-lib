u = 398600;
J2 = 0.00108263;
R = 6371;
a = R+180;

dO = -3*pi*J2*(R/a)^2 * cosd(30);
dw = 3*pi/2*J2*(R/a)^2 * (4-5*sind(30)^2);

T = 2*pi/sqrt(u) * a^(3/2);
Tearth = 24*3600;%86164.0905;

ground_track = (dO+dw + T/Tearth * 2*pi * cosd(30)) * R


G = 6.67e-11 / 1e3^3;
r = 6558.1;
R_eq = 6378.1;
M = 5.97e24;
w_earth = 7.292115e-5;
T_nodal = 2*pi/(sqrt(G*M/r^3)-3/2*J2*(R_eq/r)^2*sqrt(G*M/r^3)*cosd(30)) / 60
S = 2*pi*R_eq*cosd(30)* (1 - (T_nodal*w_earth)/(2*pi))
