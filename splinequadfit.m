function [a, ev] = splinequadfit(x, y, ex)
    M = zeros((length(x)-1)*3);
    b = zeros((length(x)-1)*3,1);
    a = zeros((length(x)-1)*3,1);

    r = 1;
    M(1,1)=1;
    r=r+1;
    for i=1:((2*(length(x)-1)-2)/2)
        b(r) = y(i+1);
        M(r, i*3-2) = x(i+1)^2;
        M(r, i*3-1) = x(i+1);
        M(r, i*3) = 1;
        r=r+1;
        b(r)=y(i+1);
        M(r, i*3+1) = x(i+1)^2;
        M(r, i*3+2) = x(i+1);
        M(r, i*3+3) = 1;
        r=r+1;
    end

    b(r) = y(1);
    M(r,1) = x(1)^2;
    M(r,2) = x(1);
    M(r,3) = 1;
    r=r+1;
    b(r) = y(length(y));
    M(r,length(M)-2) = x(length(x))^2;
    M(r,length(M)-1) = x(length(x));
    M(r,length(M)) = 1;
    r=r+1;
    
    for i=1:(length(x)-2)
        M(r,i*3-2) = 2*x(i+1);
        M(r,i*3-1) = 1;
        M(r, i*3+1) = -2*x(i+1);
        M(r, i*3+2) = -1;
        b(r)=0;
        r=r+1;
    end
    a=linsolve(M,b);

    for i=1:(length(x)-1)
        if ex > x(i) && ex < x(i+1)
            ev = ex^2 * a(i*3-2) + ex * a(i*3-1) + a(i*3);
        end

    M
    b
    end
