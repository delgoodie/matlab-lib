function y = RK2(x0, y0, f, h, n, a2)
    a1 = 1 - a2;
    p1 = (1/2)/a2;
    q11 = (1/2)/a2;
    y = y0;
    x = x0;
    for i=1:n
        k1 = f(x, y);
        k2 = f(x+p1*h, y+q11*k1*h);
        y = y + (a1*k1 + a2*k2)*h;
        x = x + h;
    end
end