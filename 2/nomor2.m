function [f,g] = nomor2(x)
    r = x(1);
    t = x(2);
    l = x(3);
    
    f = 2* pi * r * (r + t) + l*(pi * r^2 * t - 400);
    dr = 4 * pi * r + 2 * pi * t  + 2 * pi * l * r * t; 
    dt = 2 * pi * r + l * pi * r^2;
    dl = pi * r^2 * t - 400;
    g = [dr dt dl]';
end