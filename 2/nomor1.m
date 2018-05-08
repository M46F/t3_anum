function [f,g] = nomor1(x)
    f = 0.5 * x(1)^2 + 2.5 * x(2)^2;
    g = [x(1) 5*x(2)]';
end