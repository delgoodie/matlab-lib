function [y,tbl] = euler(a, b, h, y0, df)
    y = y0;
    i = 2;
    tbl = array2table([a, y0, df(a,y0)]);
    y = y0+df(a,y0)*h;
    for x =(a+h):h:b
        d = df(x,y);
        tbl(i,:) = array2table([x, y, d]);
        y = y + d * h;
        i = i + 1;
    end
    tbl.Properties.VariableNames=["x", "f(x)", "df/dx"];    
end