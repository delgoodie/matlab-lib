clc ; clear all ; format long ;
global mu
mu = 398600;
Re = 6378;
ta0 = 0;
Ra = Re + 200;
tb0 = pi/2;
Rb = Re + 4000;
t1 = 680;

safetimes= [];
ra0 = Ra * [ cos(ta0) sin(ta0) 0 ];
va0 = [ 0 sqrt(mu/Ra) 0 ] ;
rb0 = Rb * [ cos(tb0) sin(tb0) 0 ];
vb0 = [ -sqrt(mu/Rb) 0 0 ];

for t2 = 2400:1:8000
   rb1 = rv_from_r0v0(rb0 , vb0 , t2) ;
   ra1 = rv_from_r0v0( ra0 , va0 , t1 ) ;  % getting radius vectors
   rA = norm(ra1);
   rB = norm(rb1);
   dt = t2 - t1 ; % have to subtract off undocking time
   [ vc1 , vc2 ] = lambert(ra1 , rb1 , dt , "pro");
   vA = norm(vc1) ;
   VRA = dot(ra1,vc1)/rA ;
   VRB = dot(rb1,vc2)/rB ;
   ev = 1/mu*(((vA^2 - mu/rA)*ra1) - (rA*VRA*vc1)) ;
   ecc = norm(ev) ;
   hv = cross(ra1,vc1) ;  % calculate the state
   hs = norm(hv) ;
   periapsis = (hs^2/mu)*(1/(1+ecc)) ;


   w1 = sqrt(mu/Ra^3);
   w2 = sqrt(mu/Rb^3);
   deltaTheta = pi/2 + w2 * t2 - w1 * t1;
   r1 = [Ra ; 0 ; 0];
   r2 = [Rb*cos(deltaTheta) ; Rb*sin(deltaTheta) ; 0];
   [v1,v2] = lambert(r1, r2, dt, "pro");
   coe1 = coe_from_sv(r1, v1, mu);
   a = coe1(7);
   e = coe1(2);
   rp = a*(1-e);

   if abs(periapsis - rp) > 1e-1
       disp("error")

   end
    % calculating anomaly at time one based on the sign of the radial
   % component of the velocity at time one
   if VRA >= 0
       thetaone = acosd(dot((ev/ecc),(ra1/norm(ra1)))) ; %degrees
   else
       thetaone = 360 - acosd(dot((ev/ecc),(ra1/norm(ra1)))) ; %degrees
   end
   % calculating anomaly at time two based on the sign of the radial
   % component of the velocity at time two
   if VRB >= 0
       thetatwo = acosd(dot((ev/ecc),(rb1/norm(rb1)))) ; %degrees
   else
       thetatwo = 360 - acosd(dot((ev/ecc),(rb1/norm(rb1)))) ;  % degrees
   end
   % if periapsis is greater than the earth radius and the the true
   % anomaly at time two is greater than at time one then no crash will
   % occur
   if periapsis > 6378 || thetatwo > thetaone
       safetimes = [ safetimes t2 ] ;
   end


    if t2 == 5016
        disp(periapsis)
    end
end
% OUTPUT ORGANIZATION
disp(['The values of time2 that the transfer orbit will be safe are between [', num2str(safetimes(1)), ',' , num2str(safetimes(end)) , '] seconds. '])
