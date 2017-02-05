function [ rv ] = exponential( x,lambda,n )
rv = zeros(1,n);
i = 1;
while(i<=n)
    rv(1,i) = log(x(1,i))*(-1/lambda);
    i=i+1;  
end
end

