function [x,y,n]=calc()
prompt="please input the value of x:";
x=input(prompt);
prompt="please input the value of y:";
y=input(prompt);
prompt="please input the norm you want(1-,2- or inf-):";
n=input(prompt);
lx=length(x);
ly=length(y);
if lx ~= ly
    error('x and y require the same length')
end
if lx==1
    error('need more input for x and y')
end
if n == 2
    [b1,b2,a,b]=norm2(x,y);
    fplot(@(x) b1+b2*(x),[a,b]);
    hold on;
    plot(x,y,'.');
end
if n==1
    [b1,b2,a,b]=norm1(x,y);
    fplot(@(x) b1+b2*(x),[a,b]);
    hold on;
    plot(x,y,'.');
end
if n==inf
   [b1,b2,a,b]=norminf(x,y);
   fplot(@(x) b1+b2*(x),[a,b]);
   hold on;
   plot(x,y,'.');
end
end