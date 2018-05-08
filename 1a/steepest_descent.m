function [X, iter] = steepest_descent(fun, X0, maxiter, tol)
	X = X0;
	n = length(X);
	iter = 0;
	grad = find_grad(fun, X);
	direction = -grad;
	while iter < maxiter
		if (abs(norm(grad, 2)) < tol)
			disp(iter);
			break;
		end
		grad = find_grad(fun, X);
		direction = -grad;
		alfa = armijo_line_search(fun, X, direction, grad, maxiter/100);
		for i=1:n
			X(i) = X(i) + alfa*direction(i);
		end
		iter += 1;
	end
end