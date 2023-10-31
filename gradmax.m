function p = gradmax(p0, f, dpmin)
    p = p0;
    phist = p;
    syms x y h;
    r = [x;y];
    df = [diff(f,x);diff(f,y)];
    dp = dpmin*2;
    while dp > dpmin
        di = subs(df,r,p);
        gn = p + di*h;
        g=subs(f,r,gn);
        dg = diff(g);
        cdg = sym2poly(dg);
        h_opt = -cdg(2)/cdg(1);
        pprev=p;
        p = p + di*h_opt;
        phist = [phist, p];
        dp = norm(pprev-p);
    end
    p = vpa(p);
    plot(phist(1,:),phist(2,:), 'ko-')
    xlim([-3,3])
    ylim([-1,3])
end