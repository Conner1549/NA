function [b1,b2,a,b]=norm1(x,y)
l = length(x);
b1=zeros(1,2);
b1(1) = 1;
b2=1;
A=zeros(1,l);
B=zeros(1,l);
J=Inf;
k=1;
w=0;
for i=1:l
    if J>abs(y(i)-b1(1,1)-b2*x(i))
        J=abs(y(i)-b1(1,1)-b2*x(i));
        j=i;
    end
end
k=k+1;
for i=1:l
    A(1,i)=(1-x(i)/x(j));
end
S=sum(A);
for i= 1:l
    if w<S
        w=w+A(i);
    else
        i1=i;
        break
    end
end
b1(2)=b1(1);
b1(1)=(y(i1)-y(j)*x(i1)/x(j))/(1-x(i1)/x(j));
if abs(b1(1,1)-b1(1,2))<0.001
    if k<=2
        k=k+1;
        w=0;
        for i=1:l
            A(1,i)=(1-x(i)/x(j));
        end
        S=sum(A);
        for i= 1:l
            if w<S
                w=w+A(i);
            else
                i1=i;
                break
            end
        end
        b1(2)=b1(1);
        b1(1)=(y(i1)-y(j)*x(i1)/x(j))/(1-x(i1)/x(j));
    else
        b1=b1(1,1);
        b2=y(j)/x(j)-b1/x(j);
    end
end
while abs(b1(1,1)-b1(1,2))>=0.001
    k=k+1;
    j=i1;
    w=0;
        for i=1:l
            A(1,i)=(1-x(i)/x(j));
        end
        S=sum(A);
        for i= 1:l
            if w<S
                w=w+A(i);
            else
                i1=i;
                break
            end
        end
        b1(2)=b1(1);
        b1(1)=(y(i1)-y(j)*x(i1)/x(j))/(1-x(i1)/x(j));
end
a=min(x);
b=max(x);
end