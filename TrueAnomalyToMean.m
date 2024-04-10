function M = TrueAnomalyToMean(t, e, bDegrees)
    if (bDegrees)
        t = deg2rad(t);
    end
    E = 2*atan(sqrt((1-e)/(1+e)) * tan(t/2));
    M = E - e*sin(E);
    if (bDegrees)
        M = rad2deg(M);
    end
end