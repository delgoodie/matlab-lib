u_sun =	132712440018;
u_venus = 324859;
u_earth = 398600;
R_earth = 6378;
R_venus = 6052;
r_earth = 149.6e6;
r_venus = 108.2e6;
r_park = R_earth + 200;
v_earth = sqrt(u_sun / r_earth);
v_venus = sqrt(u_sun / r_venus);
v_park = sqrt(u_earth / r_park);

ra_solar = r_earth;
rp_solar = r_venus;
a_solar = (ra_solar + rp_solar) / 2;
Energy_solar = -1/2 * u_sun / a_solar;
va_solar = sqrt(2*Energy_solar + 2*u_sun / ra_solar);
vp_solar = sqrt(2*Energy_solar + 2*u_sun / rp_solar);

v_escape = va_solar - v_earth;
Energy_escape = v_escape^2 / 2;
rp_escape = r_park;
vp_escape = sqrt(2*Energy_escape + 2*u_earth / rp_escape);
DeltaV1 = vp_escape - v_park;
fprintf("4.\n\tDelta V from earth: %.4f km/s\n", DeltaV1);

v0_venus = vp_solar - v_venus;
fprintf("5.\n\tIncoming Velocity to Venus: %.4f km/s\n", v0_venus);


