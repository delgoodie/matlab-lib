function v = multiproj(S, u)
    B = orthobasis(S);
    v= B(:,1) - B(:,1);
    for i = 1:size(B,2)
        v = v + proj(B(:,i), u);
    end
