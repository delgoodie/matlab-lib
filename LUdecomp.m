function x = LUdecomp(A, b)
    % Decompose into L, U
    U = A;
    L = eye(length(A));
    for i = 1:(length(U(1,:))-1)
        for j = (i+1):length(U)
            f = U(j,i)/U(i,i);
            U(j,:) = U(j,:) - U(i,:) * f;
            L(j,i) = f;
        end
    end

    % Forward Sub to find {d}
    d = zeros(length(b),1);
    for i = 1:length(L)
        sum = 0;
        for j = 1:(i-1)
            sum = sum + L(i,j) * d(j);
        end
        d(i)=b(i)-sum;
    end

    % Backward Sub to find {x}
    x = zeros(length(d), 1);
    for i=flip(1:length(U))
        sum = 0;
        for j = (i+1):length(U(i,:))
            sum = sum + U(i,j) * x(j);
        end
        x(i) = (d(i) - sum) / U(i,i);
    end
end