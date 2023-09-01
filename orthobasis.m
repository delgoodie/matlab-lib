function B = orthobasis(A)
    [ref, pc] = rref(A);
    B=[];
    for i = 1:length(pc)
        B = [B, A(:,pc(i))];
    end

    for i=1:size(B,2)
        for j=1:i-1
            B(:,i) = B(:,i) - proj(B(:,j),B(:,i));        
        end
        B(:,i) = B(:,i) / sqrt(dot(B(:,i),B(:,i)));
    end