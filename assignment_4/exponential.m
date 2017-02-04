function [ rv ] = exponential( x,lambda,n )
rv = zeros(1,n);
i = 1;
while(i<=n)
    rv(1,i) = log(1-x(1,i))*(-lambda);
    i=i+1;  
end
end

