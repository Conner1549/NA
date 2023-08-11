function [v,x]=maxv(p,a,b)
X=a:0.1:b;
y=abs(gf(X)-polyval(p,X));
v=max(y);
i=find(y==v);
x=X(i);
end
