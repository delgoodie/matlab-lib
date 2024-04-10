function [e,a,i,O,w,t] = RVtoOE(r, v, u)
    h = cross(r, v);
    uh = h / norm(h);
    R = norm(r);
    p = 1/u * cross(v, h) - r/R;
    %p = 1/u*((norm(v)^2 - u/R)*r - R*dot(v, r/R)*v);
    e = norm(p);
    p = p / e;
    un = cross([0;0;1], uh) / norm(cross([0;0;1], uh));
    w = acos(dot(p, un));
    if dot(p, [0;0;1]) < 0
        w = 2 * pi - w;
    end
    O = atan2d(un(2), un(1));
    i = acos(uh(3));
    E = norm(v)^2 / 2- u / R;
    a = -u / (2 * E);
    vr = dot(r/R, v);
    t = asin(norm(h)*vr / (u * e));
    if R > norm(h)^2/u
        t = pi - t;
    end

    t = t * 180/pi;
    i = i * 180/pi;
    w = w * 180/pi;
end