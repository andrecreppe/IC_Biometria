%{
    Experiment 1:
    
    - Test S2 Histograms in S1 Histograms
        - All of them
    - Check the probability
    - Invert and test again
        - A in B? // B in A?
%}

%Setup
    clear all
    close all

%Number of files
    num_files = 260;
    %num_files = -1 -> All the database (+3200 pics)

%Load the Histograms
    run ../load_ARFACE;     %Pic
    run ../tres_por_quatro; %Cut
    run ../make_lbp;     %LBP

progress = 'Guessing'

%Evaluate  
    cont = 0;
    for a=1 : s1
        %for i=1 : num_files/2
        comparison = LBPDatabase_s1(a, :);
        
        for i=1 : s2
            d = pdist2(LBPDatabase_s2(i, :), comparison, 'cityblock');
            if i == 1
                buff = d;
                the_one = i;
            elseif d < buff
                buff = d;
                the_one = i;
            end

        end
        
        %if the_one == a
        if floor((a-1)/13) == floor((the_one-1)/13)
            cont = cont + 1;
        end
        
        %Depict
        %{
            if a == 1
                figure('Name', 'Test One');
            end
            subplot(1,2,1); imshow(images_s1{a});  title('Sorted', 'Color', 'r');
            subplot(1,2,2); imshow(images_s2{the_one}); title('Guessed', 'Color', 'g');
            
            pause(0.5);
        %}
    end
    
    percentage_s1s2 = (cont*100) / s1
    
    cont = 0;
    for a=1 : s2
        %for i=1 : num_files/2
        comparison = LBPDatabase_s2(a, :);
        
        for i=1 : s2
            d = pdist2(LBPDatabase_s1(i, :), comparison, 'cityblock');
            if i == 1
                buff = d;
                the_one = i;
            elseif d < buff
                buff = d;
                the_one = i;
            end

        end
        
        %if the_one == a
        if floor((a-1)/13) == floor((the_one-1)/13)
            cont = cont + 1;
        end
        
        %Depict
        %{
            if a == 1
                figure('Name', 'Test One');
            end
            subplot(1,2,1); imshow(images_s1{a});  title('Sorted', 'Color', 'r');
            subplot(1,2,2); imshow(images_s2{the_one}); title('Guessed', 'Color', 'g');
            
            pause(0.5);
        %}
    end
    
    percentage_s2s1 = (cont*100) / s2
    
progress = 'DONE'

close all

clear a; clear buff; clear comparison;
clear d; clear i; clear s1; clear s2
clear the_one; clear cont;
    