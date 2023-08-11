function [h,k,p,p1]=remez(h,k,p,a,b,n)
[v,x]=maxv(p,a,b);
i=iposition(k,x,n);
t=(gf(k(i-1))-polyval(p,k(i-1)))*(gf(x)-polyval(p,x));
if i>1 && i<=n+2
    if (gf(k(i-1))-polyval(p,k(i-1)))*(gf(x)-polyval(p,x))>=0
        k(i-1)=x;
    else
        k(i)=x;
    end
end
if i==1
    if (gf(k(i))-polyval(p,k(i)))*(gf(x)-polyval(p,x))>=0
        k(i)=x;
    else
        k=k(:,1:n+1);
        k=[x,k];
    end
end
if i==n+3
    if (gf(k(i-1))-polyval(p,k(i-1)))*(gf(x)-polyval(p,x))>=0
        k(i-1)=x;
    else
        k=k(:,2:n+2);
        k=[k,x];
    end
end
[p,h]=rcalc(k,n);
end