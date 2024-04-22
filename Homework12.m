% 6.3
Re = 6378.1;
R1 = Re + 500;
u = 398600;
t1 = pi;
R2 = Re;
t2 = deg2rad(300);
v1 = sqrt(u/R1);
vhi = sqrt(u * (sec(t1) - sec(t2)) / (R1^2 * (sec(t1)/R1 - sec(t2)/R2)));
dv = vhi - v1;
fprintf("6.3\na)\n\tdv: %.3f km/s\n", dv);

t2 = deg2rad(180);
vhi = sqrt(u * (sec(t1) - sec(t2)) / (R1^2 * (sec(t1)/R1 - sec(t2)/R2)));
dv = vhi - v1;
fprintf("b)\n\tdv: %.3f km/s\n", dv);


% 6.8
R1 = Re + 300;
u = 398600;
R2 = Re + 3000;
[dv, a] = localHohmann(R1, R2, u);
Time = pi/sqrt(u)*a^(3/2);
fprintf("6.8\na)\n\tdv: %.3f km/s\nb)\n\ttime: %.0f m %.2f s\n", dv, floor(Time/60), mod(Time,60));

% 6.10
u_sun = 1.327e11;
R_earth = 1.496e8;
R_mars = 2.279e8;
[dv, a, e] = localHohmann(R_earth, R_mars, u_sun);
Time = pi/sqrt(u_sun)*a^(3/2);
w_mars = sqrt(u_sun / R_mars^3);
Angle = pi - w_mars*Time;
fprintf("6.10\na)\n\tTime: %.0f days\nb)\n\tAngle: %.3f deg\n", round(Time/(3600*24)), rad2deg(Angle));

% 6.11
k = 3;
dvratio = 2*sqrt(2) * ((k+1)^3/(k-1)^2 - (k+1))^(-1/2) + 1/sqrt(k) - 1;
fprintf("6.11\n\tdv = %.3f v1\n", dvratio);


