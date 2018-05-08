function [alfa] = armijo_line_search(fun, X, direction, grad, maxiter)
	tau = 0.9;
	beta = 0.75;
	alfa = 1;
	fX = fun(X);
	iter = 0;
	while maxiter > iter
		if(fun(X + alfa*direction) <= fX + (alfa* beta*grad' * direction))
			break;
		end;
		alfa = tau * alfa;
		iter += 1;
	end;
end