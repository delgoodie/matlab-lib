function [r, v, Q] = OEtoRV(e, a, i, O, w, t, u)
    H = sqrt(a*u*(1-e^2));
    R = H^2/u * 1/(1+e*cosd(t));
    rp = [ R*cosd(t) ; R*sind(t) ; 0 ];
    v_perp = u/H * (1 + e*cosd(t));
    v_rad = u/H * e * sind(t);
    vp = [ -v_rad*cosd(t)-v_perp*sind(t) ; v_rad*sind(t)+v_perp*cosd(t) ; 0 ];

    Q = [-sind(O)*cosd(i)*sind(w)+cosd(O)*cosd(w), -sind(O)*cosd(i)*cosd(w)-cosd(O)*sind(w), sind(O)*sind(i)
         cosd(O)*cosd(i)*sind(w)+sind(O)*cosd(w), cosd(O)*cosd(i)*cosd(w)-sind(O)*sind(w), -cosd(O)*sind(i)
         sind(i)*sind(w), sind(i)*cosd(w), cosd(i)];
    r = Q * rp;
    v = Q * vp;
end