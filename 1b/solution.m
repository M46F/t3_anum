warning('off', 'Octave:possible-matlab-short-circuit-operator');
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
  s = 1 + sum(X.^2 ./4000) - prod;
end

tols = [1e-4, 1e-6, 1e-8, 1e-10, 1e-12];
TXes = [-400,-200,200,400,-400,-200,200,400];

n_power = [1, 2, 3];

Res = [];
sol1 = [];
sol2 = [];
sol3 = [];
sol4 = [];
sol5 = [];
sol6 = [];
sol7 = [];
% fx, jumlah iterasi, tolerance, apakah converge, elapsed time
for tol=tols

  fx = 1
  tic; 
  [sol iter_count, is_converge, norm_grad] = newton_method(@a, [1,2] ,100, tol);
  elapsed_time = toc;
  Res = [Res ; [fx, iter_count, tol, is_converge, elapsed_time, norm_grad] ];
  sol1 = [sol1 ; sol];

  fx = fx + 1 
  tic; 
  [sol iter_count, is_converge, norm_grad] = newton_method(@b, [1,1,-0.5] ,100, tol);
  elapsed_time = toc;
  Res = [Res ; [fx, iter_count, tol, is_converge, elapsed_time, norm_grad] ];
  sol2 = [sol2 ; sol];


  for i = n_power
    temp = [];
    for t = 1:8^(i-1)
      temp = [temp  TXes];
    end

    fx = fx + 1
    tic;
    [sol iter_count, is_converge, norm_grad] = newton_method(@c, temp, 100, tol);
    elapsed_time = toc;
    Res = [Res ; [fx, iter_count, tol, is_converge, elapsed_time, norm_grad] ];
    if (fx == 3)
      sol3 = [sol3 ; sol];
    elseif(fx == 4)
      sol4 = [sol4 ; sol];
    elseif(fx == 5)
      sol5 = [sol5 ; sol];
    elseif(fx == 6)
      sol6 = [sol6 ; sol];
    elseif(fx == 7)
      sol7 = [sol7 ; sol];
    endif

  end


end
csvwrite("result.csv",Res);
csvwrite("sol1.csv",sol1);
csvwrite("sol2.csv",sol2);
csvwrite("sol3.csv",sol3);
csvwrite("sol4.csv",sol4);
csvwrite("sol5.csv",sol5);
csvwrite("sol6.csv",sol6);
csvwrite("sol7.csv",sol7);
