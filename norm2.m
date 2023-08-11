function [b1,b2,a,b]=norm2(x,y)
l = length(x);
sxy=0;
sxx=0;
for i=1:l
    sxy=sxy+x(i)*y(i);
end
sxy=sxy-sum(x)*sum(y)/l;
for j=1:l
    sxx=sxx+x(j)*x(j);
end
sxx=sxx-sum(x)*sum(x)/l;
b2=sxy/sxx;
b1=(sum(y)/l)-b2*sum(x)/l;
a=min(x);
b=max(x);
end
