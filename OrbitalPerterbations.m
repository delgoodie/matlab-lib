u = 398600;
J2 = 0.00108263;
R = 6378;
r0 = [ -2429.1 4555.1 4577 ];
v0 = [-4.7689 -5.6113 3.0535 ];
dT = 72*3600;

coe = coe_from_sv(r0, v0, u);
h    = coe(1);
e    = coe(2);
O0   = coe(3);
i   = coe(4);
w0    = coe(5);
t0   = coe(6);
a = h^2/u * 1/(1-e^2);
T = 2*pi/sqrt(u)*a^(3/2);

T0 = 0;
T1 = T0 + dT;
M1 = 2*pi * mod(T1, T) / T;
E1 = fzero(@(x) M1-x+(e*sin(x)),0);
t1 = 2*atan(tan(E1/2)*sqrt((1+e)/(1-e))) + 2*pi;

K = -3/2*sqrt(u)*J2*R^2 / ((1-e^2)^2*a^(7/2));

dOdT = K * cos(i);
dwdT = K * (5/2*sin(i)^2-2);
O1 = O0 + dOdT * dT;
w1 = w0 + dwdT * dT;

coe2 = [ h, e, O1, i, w1, t1 ];
[r1, v1] = sv_from_coe(coe2, u)