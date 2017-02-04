function [ x ] = sqRoot(n,k)
if(k>=1000000000) 
    disp('input too large')
end    
unif_vector = n*rand(1,k);
i = 1;
count = 0;
while(i<=k)
    if(unif_vector(1,i)^2<n)
        count = count + 1;
    end    
    i = i+1;
end    
fraction = count/k;
x = fraction*n;
end

