%cp = matriz j? normalizada e multiplicada por 100

total = num_img * num_pessoas;

hist_g = zeros(1, 100);

for a=1 : 1
    for b=1 : num_img
        if a ~= b
            hist_g(floor(cp(a,b))) = hist_g(floor(cp(a,b))) + 1;
        end
    end
end