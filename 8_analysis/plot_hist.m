progress = 'Making the Curve'

%Setup
    hist_g = zeros(1, 100);
    hist_i = zeros(1, 100);

%Count
    %Genuine HIST
        for a=1 : num_pessoas
            for b=1 : gen
                if floor(genuine(a,b)) ~= 0
                    hist_g(floor(genuine(a,b))) = hist_g(floor(genuine(a,b))) + 1;
                end
            end
        end

    %Impost HIST
        for a=1 : num_pessoas
            for b=1 : gen
                if floor(impost(a,b)) ~= 0
                    hist_i(floor(impost(a,b))) = hist_i(floor(impost(a,b))) + 1;
                end
            end
        end

    clear a; clear b; clear gen;
   
%Ploting it
    plot(linspace(0,100,100), hist_g);
    title('Comparisons');

    hold on;
    
    plot(linspace(0,100,100), hist_i);

    hold off;