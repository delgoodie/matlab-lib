R_A = 200  +6738;
R_B = 4000 + 6738;
DTheta = deg2rad(90);
global mu
mu = 398600;

t1 = 680;
t2min = 2400;
t2max = 8000;

t2s = t2min:1:t2max;
w1 = sqrt(mu/R_A^3);
w2 = sqrt(mu/R_B^3);

valid_t2s = [];

for t2 = t2s
    deltaTime = t2 - t1;
    deltaTheta = DTheta + w2 * t2 - w1 * t1;
    r1 = [R_A ; 0 ; 0];
    r2 = [R_B*cos(deltaTheta) ; -R_B*sin(deltaTheta) ; 0];
    [v1,v2] = lambert(r1, r2, deltaTime, "pro");
    coe1 = coe_from_sv(r1, v1, mu);
    coe2 = coe_from_sv(r2, v2, mu);
    a = coe1(7);
    e = coe1(2);
    rp = a*(1-e);
    theta1 = coe1(6);
    theta2 = coe2(6);
    if rp > 6738 || theta2 > theta1
        valid_t2s = [valid_t2s, t2];
    end
end

min_valid_t2 = min(valid_t2s)
max_valid_t2 = max(valid_t2s)