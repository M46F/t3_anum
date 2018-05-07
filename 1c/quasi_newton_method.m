# acuan https://github.com/yyc9268/Numerical_optimization/blob/49639aa66b0f1dd47803110ae47b1083e4217b51/matlab/multivariate_smooth/quasi_newton.m# acuan paper http://people.math.sfu.ca/~elushi/project_833.pdffunction [X, iter]=quasi_newton_method(f, X, max_iter, tol)  iter = 0;  n = length(X);  B = eye(n);  while iter < max_iter    iter += 1;        g = find_grad(f, X);        # Cek sudah konvergen apa belum    if abs(g) <= tol      break    end        # Berbeda dengan yang di buku    H = inv(B);    p = -H*g;        # Begin line search    alpha = generic_line_search(f, X, p, 0);        # iterasi x    X_old = X;    s = alpha*p;    X = X + s;        # Hitung SR-1    g_new = find_grad(f, X);    y_k = g_new - g;    # d_k = X - X_old;    B_old = B;    divisor = (y_k - B*s)'*s;    B = B + (y_k - B*s)*(y_k - B*s)'./divisor;    # divisor = (d_k-(B_old*y_k))'*y_k;    # B = B_old + ( (d_k-(B_old*y_k))*(d_k-(B_old*y_k))' )/divisor;        # Skip update if divisor is close to zero    if abs(divisor) <= 1e-8 || abs(divisor) < 0.5*norm(s)*norm((y_k - B*s))      B = B_old;    end      end end
