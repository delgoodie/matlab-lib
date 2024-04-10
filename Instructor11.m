[t, Y] = ode45(@rates, [0,6e5], [6748 .0107],odeset('RelTol', 1e-13));
%plot(t,Y(:,1));
plot(t, Y(:,2));
da = Y(end,1) - Y(1,1)
de = Y(end,2) - Y(1,2)

function dydt = rates(t, y)
    u = 398600;
    R = 6378;
    a = y(1);
    e = y(2);
    T = 2*pi()/sqrt(u)*a^(3/2);
    M = 2*pi*t/T;
    E = M + e*sin(M) + 1/2*e^2*sin(2*M);
    theta = 2*atan(sqrt((1+e)/(1-e))*tan(E/2));
    z = a*(1-e*cos(E)) - R;
    p = 1e-2*exp(-.011767*(z-298));
    F = -1/2*p*(1e-8)*u/a;
    dadt = 2*a^(3/2)/sqrt(u*(1-e^2))*(1+e*cos(theta))*F;
    dedt = sqrt(a*(1-e^2)/u)*(cos(theta)+cos(E))*F;
    dydt = [dadt ; dedt];
end