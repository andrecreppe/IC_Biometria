progress = 'Comparating images'

%Base
    gen = 0;
    for a=1 : num_img-1
        gen = gen + a;
    end
    genuine = zeros(num_pessoas, gen);
    
    num = (num_pessoas * num_img) - num_img;
    impost = zeros(num_pessoas, num);
    
%Vectors
    %Genuine
        for a=num_img : num_img : s1 %for to All People
            
            rem = 1;
            pos = 1;
                
            for b=1 : num_img - 1 %for to Internal Sorting
                
                for c=rem : num_img %for to Compare
                    
                    inx = a / num_img;
                    tocalc = (c * (a/num_img)) + b;
                    
                    genuine(inx, pos) = pdist2(LBPDatabase(b, :), LBPDatabase(tocalc, :), 'cityblock');
                    
                    pos = rem + 1;
                    
                end

                rem = rem + 1;
                
            end
        end
        
    %Impost
    
%Normalize matrix
    