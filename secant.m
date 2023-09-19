function [x,tbl] = secant(func, a, b, es)
    ea = 100;
    i = 1;
    x0 = a;
    x = b;
    while (i < 5 || ea > es) && i < 200
        prevx = x;
        fval = func(x);
        df = (func(x) - func(x0)) / (x - x0);
        x = x - func(x) / df;
        if i > 1
            ea = abs((x - prevx) / x)*100;
            tbl(i,:) = array2table([i, fval, df, x, ea]);
        else
            tbl = array2table([i, fval, df, x, ea]);
        end
        x0 = prevx;
        i = i + 1;
    end
    tbl.Properties.VariableNames=["iteration", "f(x)", "~df(x)/dx", "x", "ea"];    
end