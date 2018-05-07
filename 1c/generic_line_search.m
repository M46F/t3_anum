# Kode ini diambil dari https://github.com/yyc9268/Numerical_optimization/blob/49639aa66b0f1dd47803110ae47b1083e4217b51/matlab/multivariate_smooth/find_step_length.m# Kode telah dimodifikasi sesuai dengan kebutuhan soal dan agar lebih generic# Copyright (C) 2017 Young-Chul Yoon# All rights reserved.function [alpha]=generic_line_search(f, X, p, mode)    if mode == 1    # Exact line search     n = length(X);    pkg load symbolic;    syms x;    for k=1:n      val = X(k) + x*p(k);      if k == 1      X_temp = [val];      else        X_temp(end+1,:) = [val];      end     end     s = function_handle(diff(f(X_temp)));     alpha = fzero(s, 0);        else if mode == 0     # Direct line search     alpha = 10;     rho = 0.5;     iter = 0;     while iter < 100       left = f(X + alpha*p);       right = f(X);       if left < right;         break       else        alpha = alpha*rho;       end       iter += 1;     end   else       # Direct line search variation     alpha = 0.33;     dir = -0.33;     iter = 0;     while iter < 100       f_update = f(X+alpha*p);       alpha = alpha + alpha*dir;       if norm(f_update, 2) > 10^-4         break       end     end        endend