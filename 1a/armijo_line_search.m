function a = armijo_line_search(fa, p, x0)
	theta = 0.5;
	beta = 0.1;
	alfa = 1;
	iterator = 0;
	x = x0;
	while (f(x + alfa*p) <= f(x) + (alfa*beta)*grad(x)'*p)
		a = theta * a;
		iterator += 1;
	end;
end
