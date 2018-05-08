function [f,g] = nomor3(x)
    x_temp = ones(1, length(x));
    for n = 1:length(x)
       x_temp(n) = cos(x(n)/sqrt(n));
    end
    f = 1 + sum((x.^2)/4000) - prod(x_temp);
    
    g = ones(1, length(x));
    for n = 1:length(x)
        g(n) = x(n)/2000 + tan(x(n)/sqrt(n)) * prod(x_temp) / sqrt(n);
    end
    g = g';
end