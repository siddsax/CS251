i = 1;
lambda = 2.0;
while (i<7)
    n=10^i;
    vector = zeros(1,n);
    j = 0;
    sum = 0;
    sum_sq = 0;
    
    x = rand(1,n);
    vector_out = exponential(x,lambda,n);
    mean_vec = mean(vector_out);
    meansq_vec = meansq(vector_out);
    variance = meansq_vec- (mean_vec)^2;
    diff = mean_vec - 1/lambda;
    out = sprintf('For %d data points, variance = %f, mean of input = %f, parameter lambda = %d, difference between imperical and real mean = %f',n,variance,mean_vec,lambda,diff);
    disp(out)
    i = i + 1;
end    