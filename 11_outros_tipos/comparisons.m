progress = 'Comparating LBPs'

%--------- COMPARISONS BASE ----------

total = num_pessoas * num_img;

gen = 0;
for a=1 : num_img-1
    gen = gen + a;
end
genuine = zeros(num_pessoas, gen);

num = (num_pessoas * num_img) - num_img;
impost = zeros(num_pessoas, num);

%--------- COMPARISONS FRONT ----------
    
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

            genuine(base, a) = pdist2(LBPDatabase_f(reset, :), LBPDatabase_f(cont, :), 'cityblock');

            cont = cont + 1;
        end
    end

%Impost
    base = num_img + 1;

    for mmn=1 : num_pessoas
        indx = 1;
        cmp = 1 + ((mmn-1) * num_img);

        for tt=base : total
           impost(mmn, indx) = pdist2(LBPDatabase_f(cmp, :), LBPDatabase_f(tt, :), 'cityblock'); 

           indx = indx + 1;
        end

        base = base + num_img;
    end
    
%Normalize matrix
    %Genuine
        minim = min(min(genuine));
        maxim = max(max(genuine));
        genuine = (genuine - minim) / (maxim - minim);
        genuine_f = genuine * 100;
    
    %Impost
        minim = min(min(impost));
        maxim = max(max(impost));
        impost = (impost - minim) / (maxim - minim);
        impost_f = impost * 100;

%--------- COMPARISONS LEFT ----------

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

            genuine(base, a) = pdist2(LBPDatabase_l(reset, :), LBPDatabase_l(cont, :), 'cityblock');

            cont = cont + 1;
        end
    end

%Impost
    base = num_img + 1;

    for mmn=1 : num_pessoas
        indx = 1;
        cmp = 1 + ((mmn-1) * num_img);

        for tt=base : total
           impost(mmn, indx) = pdist2(LBPDatabase_l(cmp, :), LBPDatabase_l(tt, :), 'cityblock'); 

           indx = indx + 1;
        end

        base = base + num_img;
    end
    
%Normalize matrix
    %Genuine
        minim = min(min(genuine));
        maxim = max(max(genuine));
        genuine = (genuine - minim) / (maxim - minim);
        genuine_l = genuine * 100;
    
    %Impost
        minim = min(min(impost));
        maxim = max(max(impost));
        impost = (impost - minim) / (maxim - minim);
        impost_l = impost * 100;

 %--------- SETTING THE HISTOGRAMS ----------

circular_lbp_g = genuine_f + genuine_l;
circular_lbp_i = impost_f + impost_l;

%------------ CLEARING -------------

clear num; %clear gen; clear impost;

clear a; clear base; clear cont; 
clear reset;

clear base; clear cmp; clear indx;
clear mmn; clear total; clear tt;

clear minim; clear maxim;

        %-- // --%

clear impost; clear genuine;

clear LBPDatabase_f; clear LBPDatabase_l;
clear genuine_f; clear genuine_l;
clear impost_f; clear impost_l;
