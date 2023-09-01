function [V, et, ea] = series(func, T, x, n)
    V = 0;
    et = 0;
    ea = 0;
    for i =(0:n-1)
        t = func(x, i);
        Prev = V;
        V = V + t;
        et = (V - T) / T * 100;
        ea = abs(V - Prev) / V * 100;
    end
end
