function [x,tbl] = fixedpoint(gfunc, a, es)
    x = a;
    ea = 100;
    i=1;
    prev = a;
    while ea > es && i < 200
        prevx = x;
        x = gfunc(x);
        ea = abs((x - prev) / prev)*100;
        if i > 1
            tbl(i+1,:) = array2table([i, prevx, x, ea]);
        else
            tbl = array2table([i, prevx, x, ea]);
        end
        prev = x;
        i = i + 1;
    end
    tbl.Properties.VariableNames=["iteration", "x", "g(x)", "ea"];
end