progress = 'Comparating images'

total = num_pessoas * num_img;

comparison = zeros(total, total);

%---------

for i=1 : total
    base = LBPDatabase(i, :);
    d = 0;
    
    for j=1 : total
        comparison(i, j) = pdist2(base, LBPDatabase(j, :), 'cityblock');
    end
end

clear i; clear d; clear j;
clear total; clear base;