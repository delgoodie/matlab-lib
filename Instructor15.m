r_io = 1821.5;
u_io = 5959.9;
R_io = 421800;
u_J = 126686531.9;
r_J = 71492;

r_soi = (u_io / u_J)^(2/5) * R_io;
r_park = r_io + 50;
v_park = sqrt(u_io / r_park);
dv1 = 2.4719;
v_h1 = v_park + dv1;
h_h = v_h1*r_park;
E_h = v_h1^2/2 - u_io / r_park;
v_h2 = sqrt(2*E_h + 2*u_io / r_soi)

v_io = sqrt(u_J / R_io);
V1 = v_h2 + v_io;
R1 = R_io;
e = V1^2 * R1 / u_J - 1;
a = (V1*R1)^2 / u_J * 1 / (1 - e^2);
R2 = 2 * a - R1;

u_Gany = 9887.8;
u_Call = 7179.3;
R_Gany = 1070400;
R_Call = 1182700;
r_soi_Gany = (u_Gany / u_J)^(2/5) * R_Gany;
r_soi_Call = (u_Call / u_J)^(2/5) * R_Call;


fprintf("\n Dist from Gany SOI: %.2f\n Dist from Call SOI: %.2f\n", abs(R2 - R_Gany) - r_soi_Gany, abs(R2 - R_Call) - r_soi_Call);

%a_h = u_io / (2 * E_h);
%e_h = sqrt(h_h^2 / (u_io * a_h) + 1);
%t_h1 = 0;
%t_h2 = acos(h_h^2 / (u_io * r_soi * e_h) - 1/e_h);
