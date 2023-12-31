function x = bairstow(p, a, b, es)
    x = [];
    ea = 100;
    i = 1;
    r = a;
    s = b;
    bp = [];
    while ea > es && i < 200
        fp = flip(p);
        fbp = zeros(1, length(fp));
        fbp(1) = fp(1);
        fbp(2) = fp(2) + r * fbp(1);
        for j = 3:length(fp)
            fbp(j) = fp(j) + r * fbp(j - 1) + s * fbp(j - 2);
        end

        fcp = zeros(1, length(fbp) - 1);
        fcp(1) = fbp(1);
        fcp(2) = fbp(2) + r * fcp(1);
        for j = 3:(length(fbp) - 1)
            fcp(j) = fbp(j)+r*fcp(j-1)+s*fcp(j-2);
        end

        bp = flip(fbp);
        cp = flip(fcp);
        cp = [cp 0 0 0 0];

        deltas = linsolve([cp(2), cp(3) ; cp(1), cp(2)], [-bp(2) ; -bp(1)]);
        r = r + deltas(1);
        s = s + deltas(2);


        if i > 1
            ea = max(abs(1 - (r - deltas(1)) / r), abs(1 - (s - deltas(2)) / s)) * 100;
            tbl(i,:) = array2table([i, deltas(1), deltas(2), r, s, bp(1), bp(2), ea]);
        else
            tbl = array2table([i, deltas(1), deltas(2), r, s, bp(1), bp(2), ea]);
        end

        i = i + 1;
    end

    tbl.Properties.VariableNames=["iteration", "dr", "ds", "r", "s", "b0", "b1", "ea"];
    tbl;

    bp = bp(3:length(bp));

    x = [(r + sqrt(r^2 + 4*s)) / 2, (r - sqrt(r^2 + 4*s)) / 2];
    if length(bp) == 2
        x = [x, -bp(1) / bp(2)];
    elseif length(bp) == 3
        x = [x, (-bp(2) + sqrt(bp(2)^2 - 4*bp(1)*bp(3))) / (2*bp(3)), (-bp(2) - sqrt(bp(2)^2 - 4*bp(1)*bp(3))) / (2*bp(3))];
    else
        x = [x, bairstow(bp, r, s, es)];
    end 
end