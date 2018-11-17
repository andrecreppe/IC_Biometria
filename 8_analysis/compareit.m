progess = 'Comparating images'

total = num_pessoas * num_img;

comparison = zeros(1, total);

for i=1 : total
    base = LBPDatabase(i, :);
    d = 0;
    
    for j=1 : total
       d = d + pdist2(base, LBPDatabase(j, :));
    end
    
    comparison(1, i) = d;
end

clear d; clear i; clear j;
clear total; clear base;