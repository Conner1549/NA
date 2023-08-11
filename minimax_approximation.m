function minimax_approximation
prompt="please input the polynomial degree of n:";
n=input(prompt);
prompt="please input the interval:a=";
a=input(prompt);
prompt="please input the interval:b=";
b=input(prompt);
k=linspace(a,b,n+2);
[p,h]=rcalc(k,n);
[v,x]=maxv(p,a,b);
for i=1:100
    [h,k,p]=remez(h,k,p,a,b,n);
end
X1=a:0.01:b;
Y1=polyval(p,X1);
Y=gf(X1);
plot(X1,Y1,X1,Y);
end