g = 1.4;
b = deg2rad(29);
t = deg2rad(12.5);

M_inf = (1/2*(g+1)*sin(b)^2*(tan(b-t)/tan(b) - (g-1)/(g+1)))^(-1/2);

tU = t - deg2rad(3.5);
tL = t + deg2rad(3.5);
bU = rad2deg(fzero(@(x)(1/2*(g+1)*sin(x)^2*(tan(x-tU)/tan(x) - (g-1)/(g+1)))^(-1/2)-M_inf, b));
bL = rad2deg(fzero(@(x)(1/2*(g+1)*sin(x)^2*(tan(x-tL)/tan(x) - (g-1)/(g+1)))^(-1/2)-M_inf, b));

% M_inf = 3.1051
% bU = 25.7638
% bL = 32.5384