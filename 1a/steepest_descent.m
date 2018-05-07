function [X, iter] = steepest_descent(fun, X0, maxiter, tol)
	X = X0;
	n = length(X);
	iter = 0;
	while iter < maxiter
		grad = find_grad(fun, X);
		if (abs(norm(find_grad(fun, X), 2)) < tol)
			iter
			break;
		end
		p = -find_grad(fun, X);
		a = armijo_line_search(fun, p, X, maxiter/100);
		for i=1:n
			X(i) = X(i) + a*p(i);
		end
		iter += 1;
	end
end