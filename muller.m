function [x,tbl] = muller(f, x0, x1, x2, es)
    ea = 100;
    i = 1;
    while ea > es && i < 200
        h0 = x1 - x0;
        h1 = x2 - x1;
        d0 = (f(x1) - f(x0)) / h0;
        d1 = (f(x2) - f(x1)) / h1;
        c1 = (d1 - d0) / (h1 + h0);
        c2 = c1 * h1 + d1;
        c3 = f(x2);
        sign_factor = 1; % select root (-1 / 1)
        x = x2 + -2 * c3 / (c2 + sign_factor * sqrt(c2^2 - 4*c1*c3));
        
        if i > 1
            ea = abs((x - x2) / x) * 100;
            tbl(i,:) = array2table([i, x, f(x), ea]);
        else
            tbl = array2table([i, x, f(x), ea]);
        end

        x0 = x1;
        x1 = x2;
        x2 = x;
        i = i + 1;
    end
    tbl.Properties.VariableNames=["iteration", "x", "f(x)", "ea"];    
end