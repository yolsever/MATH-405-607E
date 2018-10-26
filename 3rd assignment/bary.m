function beta_k = bary(x_k,x)

[~,c] = size(x_k);

if ismember(x,x_k)
beta_k = zeros(size(x_k));
k = x==x_k;
beta_k(k) = 1;

else
    B = ones(size(x_k));
    for k = 1:c
        for i = x_k
            if (i ~= x_k(k))
                B(k) = (x_k(k) - i) * B(k);
            end
        end
    end
    
    w_k = 1 ./ B;
    
    beta_k = ones(size(x_k));
    
    for k = 1: c
        beta_k(k) = (w_k(k) / (x - x_k(k))) / sum(w_k ./ (x - x_k));
    end
    
end
end