a = fzero(@root, [6378,20000], optimset('TolX',1e-20))
%e = calc_e(a);
%plot(arrayfun(@root, 6378:20000));



T_earth = 24*3600;
N = 8;
T = T_earth / N;
u = 398600;
J2 = 0.00108263;
R = 6378;
i = deg2rad(45);

K = -3/2 * J2 * sqrt(u) * R^2 * cosd(116.565);
f = K/1.991e-7

function Y = root(a)
    T_earth = 24*3600;
    N = 8;
    T = T_earth / N;
    u = 398600;
    J2 = 0.00108263;
    R = 6378;
    i = deg2rad(45);
    factor = 3/2*J2*R^2*sqrt(u);
    e = calc_e(a);
    e = 0;
    w_avg = 3.12803e7 / ((1-e^2)^2 * a^(7/2));

    dS = 2*pi*R/N;
    w_earth = 2*pi/T_earth;
    Y = dS - T * R * (w_earth + factor / ((1-e^2)*a^(7/2))*cos(i));

    Y = 10800 - 2*pi / ( 2*pi / (2*pi/sqrt(u)*a^(3/2)) + w_avg);

end


function e = calc_e(a)
    T_earth = 24*3600;
    N = 8;
    T = T_earth / N;
    u = 398600;
    J2 = 0.00108263;
    R = 6378;
    i = deg2rad(45);
    factor = 3/2*J2*R^2*sqrt(u);
    e = sqrt(1 - sqrt(factor * (5/2*sin(i)^2-2) / (a^(7/2) * (2*pi/T - sqrt(u/a^3)))));
    if ~isreal(e)
        e = 0;
    end
end