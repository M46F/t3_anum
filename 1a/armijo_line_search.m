function [alfa] = armijo_line_search(fun, p, X0)
	t = 0.5;
	b = 0.1;
	alfa = 1;
	iter = 0;
	X = X0;
	grad = find_grad(fun, X0);
	while (fun(X + alfa*p) <= fun(X) + (alfa*b)*grad'*p)
		alfa = t * alfa;
		iter += 1;
	end;
end
