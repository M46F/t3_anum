function [X, iter, is_converge, norm_grad] = newton_method(fun, X, max_iter, tol)
  iter = 0;
  is_converge = 0;
  norm_grad = 9999999;
  while iter < max_iter + 1
    iter += 1;
    X0 = X;
    [H, grad] = hessian(fun, X);
    norm_grad = norm(grad);
    if norm_grad <= tol
      is_converge = 1;
      break;
    end
    v = H\-grad;
    X = X0 + v';
  end
end
