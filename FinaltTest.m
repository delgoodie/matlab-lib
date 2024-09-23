R = rand(1,3)*1000;
V = rand(1,3)*10;
mu = 398600;
coe = coe_from_sv(R, V, mu);
h = coe(1);
e = coe(2);
RA = coe(3);
incl = coe(4);
w = coe(5);
TA = coe(6)
a = coe(7);

p = sv_from_coe([h, e, RA, incl, w, 0, a], mu);
n = h^2 / mu * [cos(RA), sin(RA)];
E = 2*atan(sqrt((1-e)/(1+e)) * tan(TA/2));

[R2, V2] = rv_from_alternative([p, n, E]);

dif=norm(R - R2') + norm(V - V2')