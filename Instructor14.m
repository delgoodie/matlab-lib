Re = 6738.1;
global mu
mu = 398600;

w_sat = pi/6 / (2*3600);
R = (mu/w_sat^2)^(1/3)

data = [];
for dT = (2*3600):1:(3*3600)
    dtheta = dT * w_sat;
    r1 = [Re ; 0 ; 0];
    r2 = [R*cos(dtheta) ; R*sin(dtheta) ; 0];
    v1 = lambert(r1, r2, dT, "pro");
    coe = coe_from_sv(r1, v1, mu);
    a = coe(7);
    c = norm(r2-r1);
    am = (Re + R + c) / 4;
    S = 2*am;
    tp = sqrt(2)/(3*sqrt(mu)) * (S^(3/2) - sign(sin(dtheta))*(S-c)^(3/2));
    data = [data, [dtheta; a ; am ; dT ; tp]];
end

plot(data(1,:)*180/pi, data(5,:));

xlabel('dTheta (deg)')
%ylabel('a (km)')
%ylabel('am (km)')
%ylabel('t (s)')
ylabel('tp (s)')
