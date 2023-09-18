function V = HW2(x, n)
    V = 0;
    for i= (0:n)
        V = V + (-1)^i*x^(2*i+1) / fac(2*i+1);
    end
end
    