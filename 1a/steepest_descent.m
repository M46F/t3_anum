function [X, iter, is_converge, norm_grad] = steepest_descent(fun, X0, maxiter, tol)
	X = X0;
	n = length(X);
	iter = 0;
  is_converge = 0;
	grad = find_grad(fun, X);
  norm_grad = norm(grad,2);
	direction = -grad;
	while iter < maxiter
		if (norm_grad < tol)
      is_converge = 1;
			disp(iter);
			break;
		end
		grad = find_grad(fun, X);
    norm_grad = norm(grad,2);
		direction = -grad;
		alfa = armijo_line_search(fun, X, direction, grad);
		for i=1:n
			X(i) = X(i) + alfa*direction(i);
		end
		disp(X);
		iter += 1;
	end
end