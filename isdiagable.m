function a = isdiagable(A)
    [b,c]=eig(A);
    [g,v]=rref(b);
    if length(v)==size(b,2) && isreal(b)
        a=1;
    else
        a=0;
    end
