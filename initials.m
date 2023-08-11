function initials
prompt="please input the value of x:";
x=input(prompt);
prompt="please input the value of y:";
y=input(prompt);
prompt="please input the interpolation method you want(1(Newton),2(lagrange) or 3(undetermined coefficient)):";
n=input(prompt);
l=length(x);
A=zeros(l,l);
lx=length(x);
ly=length(y);
if lx ~= ly
    error('x and y require the same length')
end
if x==1
    error('need more input for x and y')
end
if n==2
    lagrange(x,y);
end
if n==1
    [A]=newton(x,y,A);
end
if n==3
    undetermined_coefficient(x,y);
end
prompt="number of times of new points you want to add:";
n=input(prompt);
    [A]=newton(x,y,A);
    lagrange(x,y);
for i=1:n
    prompt="please input the neew value of x:";
    x1=input(prompt);
    prompt="please input the new value of y:";
    y1=input(prompt);
    x=[x,x1];
    y=[y,y1];
    lagrange(x,y);
    [A]=newton_c(x,y,A);
end