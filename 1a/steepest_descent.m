function [X, iter] = steepest_descent(fun, X0, maxiter, tol)
	X = X0;
	n = length(X);
	iter = 0;
	while (abs(find_grad(fun, X)) > tol && iter < maxiter)
		p = -find_grad(fun, X);
		a = armijo_line_search(fun, p, X);
		for i=1:n
			X(i) = X(i) + a*p(i);
		end
		iter += 1;
		X
		a
		p
	end
end