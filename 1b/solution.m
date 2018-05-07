disp("yaho")
function s = a(X)
  x = X(1);
  y = X(2);
  s = 0.5*x^2 + 2.5*y^2;
end

function s = b(X)
  r = X(1);
  t = X(2);
  lamb = X(3);
  luas = 2 * pi * r * (r + t);
  g = pi*r^2*t - 400;
  s = luas + lamb*g;
end

function s = c(X)
  n = length(X);
  prod = 1;
  for i = 1:n
    prod = prod * cos(X(i)/sqrt(i));
  end
  s1 = 1 + sum(X.^2 ./4000) - prod
end

tols = [1e-4, 1e-6, 1e-8, 1e-10, 1e-12];
TXes = [-400,-200,200,400,-400,-200,200,400];
n_power = [1, 2, 3, 4, 5];

disp("fungsi a")
S = newton_method(@a, [1,2] ,100, 1e-4)

disp("fungsi b")
S = newton_method(@b, [1,1,-0.5] ,100, 1e-4)
%S
disp("fungsi c")


for i = n_power
    for j= 1:i
    TXes = [TXes TXes];
    if j == 2
      length(TXes);
    end
  end
end
