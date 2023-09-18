function [x,tbl] = bisection(func, a, b, es)
    ea = 100;
    xl = a; 
    xu = b;
    i=1;
    prev = NaN;
    while ea > es && i < 200
        x = (xl+xu)/2;
        if i > 1
            ea = abs((x - prev) / prev)*100;
            tbl(i,:) = array2table([i, xl, xu, x, ea]);
        else
            tbl = array2table([i, xl, xu, x, ea]);
        end
        if func(xl) * func(x) > 0
            xl = x;
        else
            xu = x;
        end
        prev = x;
        i = i + 1;
    end
    tbl.Properties.VariableNames=["iterations", "xl", "xu", "xr", "ea"];
end