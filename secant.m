function [x,tbl] = secant(func, a, b, es)
    ea = 100;
    i = 1;
    x0 = a;
    x = b;
    while ea > es && i < 200
        prevx = x;
        fval = func(x);
        dfval = (func(x) - func(x0)) / (x - x0);
        x = x - func(x) * (x - x0) / (func(x) - func(x0));
        if i > 1
            ea = abs((x - prevx) / x)*100;
            tbl(i,:) = array2table([i, fval, dfval, x, ea]);
        else
            tbl = array2table([i, fval, dfval, x, ea]);
        end
        x0 = prevx;
        i = i + 1;
    end
    tbl.Properties.VariableNames=["iteration", "f(x)", "~df(x)/dx", "x", "ea"];    
end