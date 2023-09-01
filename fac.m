function V = fac(n)
    if n == 0
        V = 1;
        return
    end
    if n == 1
        V = 1;
        return
    end
    V = n * fac(n - 1);
end