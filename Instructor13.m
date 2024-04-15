%a
case1 = find_sunsync(1);
fprintf('valid N (M=1): %s\n', sprintf('%d ', case1(1,:)))
%b
fprintf('spacing: %s km\n', sprintf('%d ', case1(3,:)))
fprintf('min spacing: %d km\n', min(case1(3,:)))

%c
case2 = find_sunsync(2);
fprintf('valid N (M=2): %s\n', sprintf('%d ', case2(1,:)))

fprintf('a        (M=1): %s km\n', sprintf('%d ', case1(2,:)))
fprintf('a (even) (M=2): %s km\n', sprintf('%d ', case2(2,1:2:end)))

%d
fprintf('min spacing (M=2): %d km\n', min(case2(3,:)))

%e
case3 = find_sunsync(3);
fprintf('valid N (M=3): %s\n', sprintf('%d ', case3(1,:)))
%b
fprintf('min spacing (M=3): %d km\n', min(case3(3,:)))


function orbits = find_sunsync(M)
    orbits = [];
    Te = 23*3600 + 56*60 + 4.0982;
    u = 398600;
    Re = 6378.1;
    for N=1:100
        T = Te / (N/M);
        a = (T/(2*pi) * sqrt(u)) ^ (2/3);
        h = a - Re;
        if h > 200 && h < 1800
            spacing = (2*pi/Te) *T*Re;
            orbits = [orbits, [N ; a ; spacing]];
        end
    end
end



