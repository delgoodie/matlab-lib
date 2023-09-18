function [x,tbl] = newtonraphson(func, dfunc, a, es)
    ea = 100;
    i=1;
    prev = NaN;
    x = a;
    while ea > es && i < 200
        fval = func(x);
        dfval = dfunc(x);
        x = x - func(x) / dfunc(x);
        if i > 1
            ea = abs((x - prev) / x)*100;
            tbl(i,:) = array2table([i, fval, dfval, x, ea]);
        else
            tbl = array2table([i, fval, dfval, x, ea]);
        end
        prev = x;
        i = i + 1;
    end
    tbl.Properties.VariableNames=["iteration", "f(x)", "df(x)/dx", "x", "ea"];    
end