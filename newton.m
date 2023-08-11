function [A]=newton(x,y,A)
tic
l=length(x);
s=min(x);
e=max(x);
ix=s:0.01:e;
L=length(ix);
A=zeros(l);
A(:,1)=y';
for i=2:l
    for j=i:l
        A(j,i)=(A(j,i-1)-A(j-1,i-1))./(x(j)-x(j-i+1));
    end
end
for i1=1:l
    for j1=1:l
        A(i1,j1)=round(A(i1,j1),4);
    end
end
for k=1:L
    X=ix;
    a=0;
    for i1=1:l
        b=1;
        for i2=1:i1-1
            b=b*(X(k)-x(i2));
        end
        a=a+A(i1,i1)*b;
    end
    c(k)=a;
end
Y=c;
figure('Name','newton')
plot(ix,Y,x,y,'o');
disp('Newton method uses time:');
toc
end