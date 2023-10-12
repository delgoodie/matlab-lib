function x = gausseidel(A, b, l, es)
    i = 0;
    ea = 100;
    x = zeros(length(A), 1);
    while i < 200 && ea > es
        ea = 0;
        for j = 1:length(A)
            sum=0;
            for k=1:length(A(j,:))
                sum = sum + A(j,k) * x(k);
            end
            sum = sum - A(j,j) * x(j);
            x_new = (b(j) - sum) / A(j,j);
            x_prev = x(j);
            x(j) = l * x_new + (1 - l) * x_prev;
            eaj = abs((x(j) - x_prev) / x(j)) * 100;
            if eaj > ea
                ea = eaj;
            end
        end
        i = i + 1;
    end
    fprintf('Iterations: %i\nea: %.4f', i, ea)
end