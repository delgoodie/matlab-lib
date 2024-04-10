function [r,v] = simRVdT(r0, v0, u, dt)
   a = 2/norm(r0)-norm(v0)^2/u;
   x = fzero(@(c)dot(r0,v0)/sqrt(u)*c^2*stuCos(a*c^2) + (1-a*norm(r0))*c^3*stuSin(a*c^2)+norm(r0)*c-sqrt(u)*dt, 1);
   f = 1-x^2/norm(r0)*stuCos(a*x^2);
   g = dt - 1/sqrt(u)*x^3*stuSin(a*x^2);
   r = f * r0 + g * v0;
   fd = sqrt(u)/(norm(r0)*norm(r))*(a*x^3*stuSin(a*x^2)-x);
   gd = 1 - x^2/norm(r) * stuCos(a*x^2);
   v = fd * r0 + gd * v0;
end
