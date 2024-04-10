function M2 = downstreamMach(M1, B)
    g = 1.4;
    K = sqrt((g+1)/(g-1));

    M_ref = 1;
    v_ref = 0;
    C = v_ref - K * atan(1/K*sqrt(M_ref^2 - 1)) - asin(1/M_ref);


    v1 = K * atan(1/K * sqrt(M1^2 - 1)) + asin(1/M1) + C
    v2 = v1 + B;
    root = @(x)-C+v2-K*atan(1/K*sqrt(x^2 - 1))-asin(1/x);
    % plot(0:.01:4, arrayfun(root, 0:.01:4));
    M2 = fzero(root, [1.0001, 10], optimset('TolX',1e-20));
end