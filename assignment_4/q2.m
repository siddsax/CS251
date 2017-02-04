function [value] = q2(n,m,d)
if (nargin == 1)
    m = 2;
    d = 4;
end
if (nargin == 2)
    d = 4;
end   
if (isnumeric(n) == 0)
    display('N is not a number');
    return;
end
if (isnumeric(m) == 0)
    display('m is not a number');
    return;
end
if (isnumeric(d) == 0)
    display('d is not a number');
    return;
end
precision = 1;
x = 0;
while((x+1)^m<n)
    x = x+1;
end    
while(precision <=d)
    i = 0;
    j = 10^(-precision);
    while ((x+(i+1)*j)^m < n)
        i = i+1; 
    end    
    x=x+i*j;
    precision = precision+1;
end    
value = x;
disp(value);
end