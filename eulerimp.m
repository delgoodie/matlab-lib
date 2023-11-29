function [y,tbl] = eulerimp(x0, y0, f, h, n)
    y = y0;
    x = x0;
    for i=1:n
        df = f(x, y);
        y = y + df*h;
        x = x + h;
        if i==1
            tbl = array2table([x0, y0, f(x0,y0)]);
        end
        tbl(i+1,:) = array2table([x, y, f(x,y)]);
    end
    tbl.Properties.VariableNames=["x", "f(x)", "df/dx"];  
end