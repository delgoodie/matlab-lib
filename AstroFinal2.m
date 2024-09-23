global mu
mu = 398600;
R = 6378;

T_0 = 6*3600;
a_0 = (T_0 * sqrt(mu) / (2*pi))^(2/3);
rp_0 = R + 500;
e_0 = 1 - rp_0 / a_0;
h_0 = (T*mu^2/(2*pi))^(1/3) * sqrt(1 - e_0^2);
t_0 = 0;

[ra0, va0] = sv_from_coe([h_0, e_0, 0, 0, 0, deg2rad(10)], mu);
[rb0, vb0] = sv_from_coe([h_0, e_0, 0, 0, 0, deg2rad(330)], mu);

t_1 = 6000;

[ra1, va1] = rv_from_r0v0(ra0, va0, t_1 - t_0);
[rb1, vb1] = rv_from_r0v0(rb0, vb0, t_1 - t_0);

t_2 = 10800;

[rb2, vb2] = rv_from_r0v0(rb1, vb1, t_2 - t_1);

[va1_trans, va2_trans] = lambert(ra1, rb2, t_2 - t_1);
coe_trans = coe_from_sv(ra1, va1_trans, mu);

DeltaV1 = norm(va1 - va1_trans)
DeltaV2 = norm(vb2 - va2_trans)
a_trans = coe_trans(7)
