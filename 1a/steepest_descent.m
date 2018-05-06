function [x, iter] = steepest_descent(fun, X0, maxiter, tol)
	p0 = -1*p(x0)
	fa = //Generate Fungsi
	a0 = line_search(fa, 1)
	x = x0
	iter = 0
	while p(x) > tol and iter < maxiter
		x = x + a0*p0
		iter += 1
	end
end