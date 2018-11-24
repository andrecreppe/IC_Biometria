progress = 'Comparating images'

%Base
    total = num_pessoas * num_img;
    
    gen = 0;
    for a=1 : num_img-1
        gen = gen + a;
    end
    genuine = zeros(num_pessoas, gen);
    
    num = (num_pessoas * num_img) - num_img;
    impost = zeros(num_pessoas, num);
    
    clear num;
    
%Vectors
    %Genuine
        for base=1 : num_pessoas
            cont = 1 + ((base-1) * num_img);
            reset = 1 + ((base-1) * num_img);

            for a=1 : gen
                if cont > num_img*base
                    reset = reset + 1;
                    cont = reset;
                end

                if reset == cont
                    cont = cont + 1;
                end

                genuine(base, a) = pdist2(LBPDatabase(reset, :), LBPDatabase(cont, :), 'cityblock');

                cont = cont + 1;
            end
        end
        
        clear a; clear base; clear cont; 
        clear reset;
        
    %Impost
        base = 5;
        
        for mmn=1 : num_pessoas
            indx = 1;
            cmp = 1 + ((mmn-1) * num_img);

            for tt=base : total
               impost(mmn, indx) = pdist2(LBPDatabase(cmp, :), LBPDatabase(tt, :), 'cityblock'); 

               indx = indx + 1;
            end

            base = base + num_img;
        end
        
        clear base; clear cmp; clear indx;
        clear mmn; clear total; clear tt;
    
%Normalize matrix
    %Genuine
        minim = min(min(genuine));
        maxim = max(max(genuine));
        genuine = (genuine - minim) / (maxim - minim);
        genuine = genuine * 100;
    
    %Impost
        minim = min(min(impost));
        maxim = max(max(impost));
        impost = (impost - minim) / (maxim - minim);
        impost = impost * 100;
        
    clear minim; clear maxim;