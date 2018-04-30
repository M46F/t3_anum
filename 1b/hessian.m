function [H,g]=hessiancsd(fun,X)
n=length(X);
H=zeros(n);
g=zeros(n,1);
h=sqrt(eps);
for k=1:n
    x1=X;
    x1(k)=x1(k)+h*i;
    g(k)=imag(fun(x1))/h;
    for l=k:n
        x2=x1;
        x2(l)=x2(l)+h;
        u1=fun(x2);
        x2(l)=x1(l)-h;
        u2=fun(x2);
        H(k,l)=imag(u1-u2)/(h*h)/2;
        H(l,k)=H(k,l);
       end
end
