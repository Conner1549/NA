function norm2approximation
syms x;
digits(3);
prompt="please input the interval:a=";
a=input(prompt);
prompt="please input the interval:b=";
b=input(prompt);
prompt="please input the polynomial degree of n:";
n=input(prompt);
f=gf(x);
A=hilb(n+1);
d=zeros(n+1,1);
for i=0:n
    f_i=f*x^(i);
    d(i+1)=int(f_i,x,a,b);
    d(i+1)=vpa(d(i+1));
end
p=A\d;
p=flip(p);
X1=a:0.1:b;
Y1=polyval(p,X1);
Y=gf(X1);
plot(X1,Y1,X1,Y);
end