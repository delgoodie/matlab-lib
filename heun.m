function [y,tbl] = heun(y0, y1, a, b, h, f, es, tf)
    yp = y0;
    y = y1;
    i = 2;
    tbl = array2table([a, y0, 0, 0]);
    for x =a:h:(b-h)
        yj = yp + f(x, y)*2*h; % Predictor
        ea = 100;
        yjp = yj;
        j = 0;
        while ea > es
            yj = y + (f(x,y) + f(x+h,yj)) * h/2; % Corrector
            ea = abs((yj-yjp)/yj*100);
            yjp = yj;
            j = j + 1;
        end

        yp = y;
        y = yj;
        tbl(i,:) = array2table([x+h, y, j, abs((tf(x+h)-y)/y*100)]);
        i = i + 1;
    end
    tbl.Properties.VariableNames=["x", "f(x)", "P-Iter", "True Error"];    
end