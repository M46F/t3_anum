f1 = @(x,y) 0.5*x^2 + 2.5*y^2;
f2 = @(r,t,l) 2*pi^2 * r * (r + t) + l*(pi*r^2*t - 400);
function s = f3(X)
  n = length(X);
  prod = 1;
  for i = 1:n
    prod = prod * cos(X(i)/sqrt(i));
  end
  s1 = 1 + sum(X.^2 ./4000) - prod
end
