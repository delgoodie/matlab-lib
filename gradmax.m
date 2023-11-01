function p = gradmax(p0, f, step, dpmin)
    p = p0;
    phist = p;
    syms x y h;
    r = [x;y];
    df = [diff(f,x);diff(f,y)];
    dp = dpmin*2;
    it = 0;
    while dp > dpmin && it < 20
        di = vpa(subs(df,r,p));
        gn = p + di*h;
        h_opt = -step;
        if step < 0
            g=subs(f,r,gn);
            poly = sym2poly(diff(g));
            h_opt = -poly(2)/poly(1);
            if length(poly) > 2
                h_opt = bairstow(flip(), 0, 0, .1);
                h_opt = h_opt(h_opt==real(h_opt));
            end
        end
        pprev=p;
        p = p + di*h_opt;
        phist = [phist, p];
        dp = norm(pprev-p);
        it = it + 1;
    end
    p = vpa(p);
    plot(phist(1,:),phist(2,:), 'ko-')
    hold on
    cx = -1:.1:5;
    cy = (-3:.1:3)';
    cz = zeros(length(cx));
    for i=1:length(cx)
        for j=1:length(cy)
            cz(j,i)=subs(f,[x,y],[cx(i),cy(j)]);
        end
    end
    contour(cx,cy,cz);
    hold off
    xlim([-1,5])
    ylim([-3,2])
    it
end