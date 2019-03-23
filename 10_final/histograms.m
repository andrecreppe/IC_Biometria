progress = 'Making the Histograms'

%--------- SETUP ----------

space = 200;

hist_g = zeros(1, space);
hist_i = zeros(1, space);

%--------- COUNTING ----------

%Genuine HIST
    genuine = test2_eyes_g;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(genuine(a,b)) ~= 0
                hist_g(floor(genuine(a,b))) = hist_g(floor(genuine(a,b))) + 1;
            end
        end
    end

%Impost HIST
    impost = test2_eyes_i;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(impost(a,b)) ~= 0
                hist_i(floor(impost(a,b))) = hist_i(floor(impost(a,b))) + 1;
            end
        end
    end

clear a; clear b; %clear gen;
   
%--------- PLOTTING ----------

plot(linspace(0,space,space), hist_g);
title('Comparisons');

hold on;

plot(linspace(0,space,space), hist_i);

hold off;
    
%--------- CLEANUP ----------

 clear genuine; clear impost;