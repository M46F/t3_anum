function [X, iter, is_converge] = newton_method(f,X, max_iter, tol)
  iter = 1;
  is_converge = 0;
  while iter <= max_iter
    iter += 1;
    X0 = X;
    [H, grad] = hessian(f, X);
    if abs(grad) <= tol
      is_converge = 1;
      break;
    end
    v = H\-grad;
    X = X0 + v';
  end
end
