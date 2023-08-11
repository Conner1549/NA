function undetermined_coefficient(x,y)
tic
l=length(x);
s=min(x);
e=max(x);
ix=s:0.01:e;
L=length(ix);
A=zeros(l,l);
Y=zeros(1,L);
for i=1:l
    for j=1:l
        A(i,j)=x(i)^(j-1);
    end
end
X=A\y';
for k=1:L
    for i1=1:l
        Y(k)=Y(k)+ix(k)^(i1-1)*X(i1);
    end
end
figure('Name','undetermined_coefficient')
plot(ix,Y,x,y,'o');
disp('Undetermined coefficient method uses time:');
toc
end