clear all
clc
format shortg
e0 = 0.0107;
a0 = 6748;
tof = linspace(0,6e5,6e5);
[tvals, aevals] = ode45(@diffeq, tof, [a0, e0]);
avals = aevals(:,1);
evals = aevals(:,2);
delta_a = avals(length(avals)) - a0
delta_e = evals(length(evals)) - e0
plot(tvals,avals)
%plot(tvals,evals)

function dydt = diffeq(t, y)
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