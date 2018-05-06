function [f] = dif(f)
  pkg load symbolic;
  syms x
  f = diff(f(x));
  f = function_handle(f);
end