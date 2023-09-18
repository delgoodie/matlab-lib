function [x,tbl] = falseposition(func, a, b, es)
    ea = 100;
    xl = a;
    xu = b;
    i=1;
    prev = NaN;
    while ea > es && i < 200
        x = (0 - func(xl)) * (xu - xl) / (func(xu) - func(xl)) + xl;
        if i > 1
            ea = abs((x - prev) / x)*100;
            tbl(i,:) = array2table([i, xl, xu, func(xl), func(xu), x, func(x), func(xl)*func(x), ea]);
        else
            tbl = array2table([i, xl, xu, func(xl), func(xu), x, func(x), func(xl)*func(x), ea]);
        end
        if func(xl) * func(x) > 0
            xl = x;
        else
            xu = x;
        end
        prev = x;
        i = i + 1;
    end
    tbl.Properties.VariableNames=["iteration", "xl", "xu", "f(xl)", "f(xu)", "xr", "f(xr)", "f(xl)*f(xr)", "ea"];
end