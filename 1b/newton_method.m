function [X]= newton_method(f,X, max_iter, tol)
  iter = 0;
  while iter < max_iter
    X0 = X;
    [H, grad] = hessiancsd(f, X);
    if abs(grad) <= tol
      break;
    end
    v = H\-grad;
    X = X0 + v'
  end
end