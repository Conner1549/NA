function i=iposition(k,x,n)
if x<k(1)
    i=1;
end
if x>=k(n+2)
    i=n+3;
end
for j=1:n+1
    if (x>=k(j) && x<k(j+1))
        i=j+1;
        break;
    end
end
end