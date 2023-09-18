x = [];v0 = [];v1 = [];v2 = [];v3 = [];vtrue=[];
for i = (0:16)
    x_v = i / pi;
    x = [x, x_v];
    v0 = [v0, HW2(x_v, 0)];
    v1 = [v1, HW2(x_v, 1)];
    v2 = [v2, HW2(x_v, 2)];
    v3 = [v3, HW2(x_v, 3)];
    vtrue = [vtrue, sin(x_v)];
end

plot(x, [v0; v1; v2; v3; vtrue]);
legend({'1st order', '3rd order', '5th order', '7th order', 'sin'}, 'location', 'southwest')
xticks([0, pi/4, pi/2, 3*pi/4, pi])
xlim([0, pi])