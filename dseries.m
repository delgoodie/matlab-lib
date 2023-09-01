function [V, et, ea, n] = dseries(func, T, x, s)
    V = 0;
    et = 1e20;
    ea = 1e20;
    i = 0;
    while et > s
        t = func(x, i);
        Prev = V;
        V = V + t;
        et = abs((V - T) / T) * 100;
        ea = abs(V - Prev) / V * 100;
        i = i + 1;
        n = i;
    end
end