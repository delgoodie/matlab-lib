function [a,e,w,t] = localLambert(R1, R2, dt, dT, u)
    r1 = [R1; 0; 0];
    r2 = [R2*cos(dt); R2*sin(dt); 0];
    v1 = lambert(r1, r2, dT, "pro");
    coe = coe_from_sv(r1, v1, u); % [h e RA incl w TA a]
    a = coe(7);
    e = coe(2);
    w = coe(5);
    t = coe(6);
end