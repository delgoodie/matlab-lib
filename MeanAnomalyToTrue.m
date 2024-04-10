function t = MeanAnomalyToTrue(M, e, bDegrees)
    if (bDegrees)
        M = deg2rad(M);
    end
    E = fzero(@(x)x-e*sin(x)-M, M);
    t = 2*atan(sqrt((1+e)/(1-e))*tan(E/2));
    if (bDegrees)
        t = rad2deg(t);
    end
end