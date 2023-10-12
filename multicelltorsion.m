v = .3;
T = 20;
L = 1;
E = 70e9;

A1 = .024*.048;
A2 = .012^2 * pi / 2;

f = (1+v)*L/E;

% input shear flow equations for q1 q2
M = [
0       2*A1                2*A2
-1,     f/A1*( 2*.048/.0015 + .024/.0015 + .024/.0035 ),     f/A1*( -.024/.0035 )
-1,     f/A2*( -.024/.0035 )                    f/A2*( pi*.012/.002 + .024/.0035 )
];
b = [T ; 0 ; 0];
x =linsolve(M, b);
fprintf('Angle: %.4f rad %.2f deg\n', x(1), x(1)*180/pi)
disp(x(2:length(x)))