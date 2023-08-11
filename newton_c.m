function [A]=newton_c(x,y,A)
lx=length(x);
[n,m]=size(A);
A1=zeros(lx);
s=min(x);
e=max(x);
ix=s:0.01:e;
L=length(ix);
for i1=1:lx-1
    for i2=i1+1:lx
        if x(i1)==x(i2)
            error('different xi have the same value is illegal')
        end
    end
end
for i=1:n
    for j=1:m
        A1(i,j)=A(i,j);
    end
end
A1=zeros(lx-n,lx);
A1(:,1)=y(n+1:lx)';
A2=zeros(n,lx-m);
A3=[A,A2];
A1=[A3;A1];
for i=2:lx
    for j=i:lx
        if j>n
            A1(j,i)=(A1(j,i-1)-A1(j-1,i-1))./(x(j)-x(j-i+1));
        end
    end
end
for i1=1:lx
    for j1=1:lx
        A1(i1,j1)=round(A1(i1,j1),4);
    end
end
tic
for k=1:L
    a=0;
    X=ix;
    for i1=1:lx
        b=1;
        for i2=1:i1-1
            b=b*(X(k)-x(i2));
        end
        a=a+A1(i1,i1)*b;
    end
    c(k)=a;
end
Y=c;
figure('Name','newton_add')
plot(ix,Y,x,y,'o');
disp('For additive points, Newton method uses time:')
toc
end