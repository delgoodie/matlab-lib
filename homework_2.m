[time, Y] = ode45(@(t,y)[ y(4:6) ; -398600 / norm(y(1:3))^3 * y(1:3) ], [0, 3600*4], [3207, 5459, 2714, -6.532, .7835, 6.142], odeset('RelTol', 1e-13));
alt = sqrt(dot(Y(:,1:3)', Y(:,1:3)')) - 6371;
fprintf('max alt: %.f km @ %.2f hrs\n', max(alt), time(alt == max(alt)) / 3600);