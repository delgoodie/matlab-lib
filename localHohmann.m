function [dv, a, e] = localHohmann(R1, R2, u)
    Vi = sqrt(u/R1);
    e = abs(R2 - R1) / (R2 + R1);
    a = (R1 + R2) / 2;
    h = sqrt(a*u*(1-e^2));
    Vhi = u/h*(e+1);
    Vhf = u/h*abs(e-1);
    Vf = sqrt(u/R2);
    dv = (Vhi - Vi) + (Vf - Vhf);
end