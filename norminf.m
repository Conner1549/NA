function [b1,b2,a,b]=norminf(x,y)
l = length(x);
a=min(x);
b=max(x);
a1=ones(l,3);
for i=1:l
    a1(i,1)=x(i);
    a1(i,3)=-1;
end
a2=-1.*a1;
for j=1:l
    a2(j,3)=-1;
end
A=[a1;a2];
f=[0 0 1];
Y=[y -y];
X=linprog(f,A,Y);
b2=X(1);
b1=X(2);
end
