function cubic_interpolation
prompt="please input the value of x:";
x=input(prompt);
prompt="please input the value of y:";
y=input(prompt);
lx=length(x);
s=zeros(1,lx-1);
ls=length(s);
prompt="please input the value of y'(x0):";
ss=input(prompt);
prompt="please input the value of y'(xn):";
se=input(prompt);
for i=1:lx-1
    s(i)=x(i+1)-x(i);
end
A=zeros(lx,lx);
for i1=1:ls-1
    A(i1+1,i1)=s(1,i1);
    A(i1+1,i1+2)=s(1,i1+1);
end
for i2=2:lx-1
    A(i2,i2)=2*(A(i2,i2-1)+A(i2,i2+1));
end
if ss==0
A(1,1)=1;
else
    A(1,1)=2*s(1);
    A(1,2)=s(1);
end
if se==0
A(lx,lx)=1;
else
    A(lx,lx)=2*s(1,lx-1);
    A(lx,lx-1)=s(1,lx-1);
end
B=zeros(lx,1);
for j=2:lx-1
    B(j,1)=6*((y(j+1)-y(j))/s(j)-(y(j)-y(j-1))/s(j-1));
end
C=A\B;
S=zeros(lx-1,4);
for i1=1:lx-1
    S(i1,1)=y(i1);
    S(i1,2)=(y(i1+1)-y(i1))/s(i1)-(s(i1)*C(i1,1))/2-(s(i1)*(C(i1+1,1)-C(i1,1)))/6;
    S(i1,3)=C(i1)/2;
    S(i1,4)=(C(i1+1)-C(i1))/(6*s(i1));
end
for i=1:lx-1
    fplot(@(t) S(i,1)+S(i,2)*(t-x(i))+S(i,3)*(t-x(i))^2+S(i,4)*(t-x(i))^3,[x(i) x(i+1)]);
    hold on;
end
