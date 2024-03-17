[t, V] = ode45(@rates, [0, 2*pi], [0; .1; .05; .01], odeset('RelTol', 1e-13));


plot(t,V(:,3:4))
title('Space Tether Dynamics')
xlabel('θ (rad)') 
ylabel('γ,α (rad)') 
legend({'α', 'γ'},'Location','southwest')
xlim([0,2*pi])


function dy = rates(t, v)
    dadt = v(1);
    dydt = v(2);
    a = v(3);
    y = v(4);
    e = .1;
    F = 2*e*sin(t) / (1 + e*cos(t));
    G = 1/(1 + e*cos(t));
  
    dy = [
        (2 * dydt * tan(y) + F) * (dadt + 1) - 3*G*sin(a)*cos(a)
        F*dydt - ((dadt + 1)^2 + 3*G*cos(a)^2)*sin(y)*cos(y)
        dadt
        dydt
    ];
end