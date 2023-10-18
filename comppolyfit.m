function [a, SE, r] = comppolyfit(o, x, y)
    o = o + 1;
    M = zeros(o);
    b = zeros(o,1);
    for i=1:o
        for j=1:o
            M(i,j) = sum(x.^(i+j-2));
        end
        M
        for j=1:length(y)
            b(i) = b(i) + x(j)^(i-1) * y(j);
        end
        b
    end
    a = linsolve(M,b);
    St = 0;
    Sr = 0;
    yavg = sum(y)/length(y)
    for i=1:length(x)
        yi = 0;
        for j=1:o
            yi = yi + a(j)*x(i)^(j-1);
        end
        St = St + (yavg-y(i))^2;
        Sr = Sr + (yi-y(i))^2;
    end
    St
    Sr
    SE = sqrt(Sr/(length(x)-2));
    r = sqrt((St-Sr)/St);
end