function [M2, shock_angle, Pt2Pt1, P2P1, T2T1] = obliqueShock(M1, defl_angle)
    gamma = 1.4;
    dRad = deg2rad(defl_angle);
    shocks = deg2rad(0:.1:90);
    defls = arrayfun(@(t)atan(2*cot(t)*((M1*sin(t))^2 - 1) / (M1^2 * (gamma + cos(2*t)) + 2)), shocks);
    t_crit = shocks(defls==max(defls));
    expr = @(theta)-tan(dRad) + 2*cot(theta) * ((M1*sin(theta))^2 - 1) / (M1^2 * (gamma + cos(2*theta)) + 2);
    shock_angle = rad2deg(fzero(expr, [.001, t_crit-.001], optimset('TolX',1e-20)));
    M1n = M1*sind(shock_angle);
    M2n = (M1n^2 + 2/(gamma - 1)) / ((2*gamma / (gamma - 1)) *M1n^2 - 1);
    M2 = M2n / sind(shock_angle - defl_angle);
    P2P1 = (1 + gamma * M1n^2) / (1 + gamma * M2n^2);
    T2T1 = (1 + (gamma - 1)/2 * M1n^2) / (1 + (gamma - 1)/2 * M2n^2);
    Pt2Pt1 = T2T1^(-gamma / (gamma - 1)) * P2P1;
end