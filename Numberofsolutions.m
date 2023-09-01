function f=Numberofsolutions()
    f=0;
end

function p = proj(u, v)
    p=dot(u,v)/dot(u,u)*u;
end
