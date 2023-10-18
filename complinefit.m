function [a, v] = complinefit(x, y, ex)
    brack = zeros(length(x));
    brack(1,:) = y;
    for i=2:length(brack)
        for j=1:(length(brack)-i + 1)
            brack(i,j) = (brack(i-1,j+1) - brack(i-1,j)) / (x(j+i-1)-x(j));
        end
    end
    a = brack(:,1)';
    v = 0;
    for i=1:length(a)
        t = a(i);
        for j=1:(i-1)
            t = t* (ex-x(j));
        end
        v = v + t;
    end
end