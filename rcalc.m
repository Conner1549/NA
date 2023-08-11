function [p,h]=rcalc(k,n)
f=gf(k);
A=zeros(n+2);
A(:,1)=ones(n+2,1);
for i=1:n+2
    A(i,n+2)=-1^(i-1);
end
for j=2:n+1
    A(:,j)=k.^(j-1);
end
x=(pinv(A)*f')';
p=x(:,1:n+1);
h=x(:,n+2);
p=flip(p);
end