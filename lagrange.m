function lagrange(x,y)
tic
s=min(x);
e=max(x);
ix=s:0.01:e;
L=length(ix);
l=length(x);
B=ones(1,L);
for k=1:L
    A=ones(1,l);
    X=ix(k);
    for i=1:l
        for j=1:l
            if j~=i
                A(i)=A(i).*(X-x(j))./(x(i)-x(j));
            end
        end
    end
    for i1=1:l
        A(i1)=round(A(i1),4);
    end
    B(k)=y*A';
end
figure('Name','lagrange')
plot(x,y,'o',ix,B);
disp('Lagrange method uses time:');
toc
end