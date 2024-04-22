Re = 6378;
Ra = 200 + Re;
Rb = 4000 + Re;
global mu
mu = 398600;
t1 = 680;
w1 = sqrt(mu/Ra^3);
w2 = sqrt(mu/Rb^3);
valid_t2s = [];
for t2 = 2400:1:8000
    deltaTheta = pi/2 + w2 * t2 - w1 * t1;
    r1 = [Ra ; 0 ; 0];
    r2 = [Rb*cos(deltaTheta) ; Rb*sin(deltaTheta) ; 0];
    [v1,v2] = lambert(r1, r2, t2 - t1, "pro");
    coe1 = coe_from_sv(r1, v1, mu);
    coe2 = coe_from_sv(r2, v2, mu);
    a = coe1(7);
    e = coe1(2);
    rp = a*(1-e);

    theta1 = coe1(6);
    theta2 = coe2(6);
    if rp > Re || theta2 > theta1
        valid_t2s = [valid_t2s, t2];
    end
end

min_valid_t2 = min(valid_t2s)
max_valid_t2 = max(valid_t2s)