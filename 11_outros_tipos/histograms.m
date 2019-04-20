progress = 'Making the Histograms'

%--------- SETUP ----------

space = 200;

%--------- HISTOGRAM MAKER ----------

hist_g = zeros(1, space);
hist_i = zeros(1, space);

%Genuine HIST
    genuine = circular_lbp_g;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(genuine(a,b)) ~= 0
                hist_g(floor(genuine(a,b))) = hist_g(floor(genuine(a,b))) + 1;
            end
        end
    end

%Impost HIST
    impost = circular_lbp_i;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(impost(a,b)) ~= 0
                hist_i(floor(impost(a,b))) = hist_i(floor(impost(a,b))) + 1;
            end
        end
    end
    
    hist_circular_g = hist_g;
    hist_circular_i = hist_i;

%--------- PLOTTING ----------

%{
plot(linspace(0,space,space), hist_all_g);
title('Comparisons');

hold on;

plot(linspace(0,space,space), hist_all_i);

hold off;
%}
    
%--------- CLEANUP ----------

clear a; clear b; clear gen; clear space;

clear circular_lbp_g;
clear circular_lbp_f;

clear genuine; clear impost;
clear hist_g; clear hist_i;