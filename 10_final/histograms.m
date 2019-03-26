progress = 'Making the Histograms'

%--------- SETUP ----------

space = 300;

%--------- TEST 1 - ONLY FACE ----------

hist_g = zeros(1, space);
hist_i = zeros(1, space);

%Genuine HIST
    genuine = test1_face_g;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(genuine(a,b)) ~= 0
                hist_g(floor(genuine(a,b))) = hist_g(floor(genuine(a,b))) + 1;
            end
        end
    end

%Impost HIST
    impost = test1_face_i;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(impost(a,b)) ~= 0
                hist_i(floor(impost(a,b))) = hist_i(floor(impost(a,b))) + 1;
            end
        end
    end
    
    hist_face_g = hist_g;
    hist_face_i = hist_i;

%--------- TEST 2 - EYES ONLY ----------

hist_g = zeros(1, space);
hist_i = zeros(1, space);

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
    
    hist_eyes_g = hist_g;
    hist_eyes_i = hist_i;

%--------- TEST 3 - FACE + LEFT ----------

hist_g = zeros(1, space);
hist_i = zeros(1, space);

%Genuine HIST
    genuine = test3_hybrid_g;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(genuine(a,b)) ~= 0
                hist_g(floor(genuine(a,b))) = hist_g(floor(genuine(a,b))) + 1;
            end
        end
    end

%Impost HIST
    impost = test3_hybrid_i;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(impost(a,b)) ~= 0
                hist_i(floor(impost(a,b))) = hist_i(floor(impost(a,b))) + 1;
            end
        end
    end
    
    hist_hybrid_g = hist_g;
    hist_hybrid_i = hist_i;

%--------- TEST 4 - ALL ----------

hist_g = zeros(1, space);
hist_i = zeros(1, space);

%Genuine HIST
    genuine = test4_all_g;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(genuine(a,b)) ~= 0
                hist_g(floor(genuine(a,b))) = hist_g(floor(genuine(a,b))) + 1;
            end
        end
    end

%Impost HIST
    impost = test4_all_i;

    for a=1 : num_pessoas
        for b=1 : gen
            if floor(impost(a,b)) ~= 0
                hist_i(floor(impost(a,b))) = hist_i(floor(impost(a,b))) + 1;
            end
        end
    end
    
    hist_all_g = hist_g;
    hist_all_i = hist_i;
   
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

clear test1_face_g; clear test1_face_i;
clear test2_eyes_g; clear test2_eyes_i;
clear test3_hybrid_g; clear test3_hybrid_i;
clear test4_all_g; clear test4_all_i;

clear genuine; clear impost;
clear hist_g; clear hist_i;