function [alfa] = armijo_line_search(fun, p, X0, maxiter)
	t = 0.1;
	b = 0.1;
	alfa = 1;
	iter = 0;
	X = X0;
	fX = fun(X);
	grad = find_grad(fun, X0);
	while iter < maxiter
		if(fun(X + alfa*p) <= ((grad'*p)*alfa*b + fX))
			break;
		end
		alfa = t * alfa;
		iter += 1;
	end;
end