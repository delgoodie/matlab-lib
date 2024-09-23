global mu
mu = 398600;
r1 = 15000;
r2 = 9000;
dTheta = deg2rad(120);
c = sqrt(r1^2 + r2^2 - 2*r1*r2*cos(dTheta));
S = 1/2 * (r1 + r2 + c);
Bm = -2*asin(sqrt((S-c)/S));
dtmin = sqrt(S^3 / (8*mu)) * (pi - Bm + sin(Bm));

R1 = [r1*cosd(110), r1*sind(110), 0];
R2 = [r2*cosd(-10), r2*sind(-10), 0];

V1 = lambert(R2, R1, dtmin);
coe = coe_from_sv(R2, V1, mu);
TA2 = rad2deg(coe(6));
PerigeeAngle = -10 - TA1;