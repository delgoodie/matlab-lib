u = 398600;
J2 = 0.00108263;
R = 6378;
r = 180 + R;
a = r;
e = 0;
i = 30;
K = -3/2*sqrt(u)*J2*R^2/((1-e^2)^2*a^(7/2));
dOdT = K*cosd(i);
dwdT = K*(5/2*(sind(i))^2 - 2);
T_ideal = 2*pi/sqrt(u)*a^(3/2);
T = 2*pi/(2*pi/T_ideal - dwdT); % account for perigee movement
dt = (2*pi/86164.0905- dOdT) * T;
spacing = dt * R