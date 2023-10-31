function v = simpson38(f, a, b, n)
    h = (b - a)/n;
    int = f(a) + f(b);
    for i=2:2:n
        int = int + 4*f(a+(i-1)*h);
    end
    for i=3:2:n-1
        int = int + 2*f(a+(i-1)*h);
    end
    v = int / 12 * (b-a);
end