%{
    Experiment 2:
    
    - Test S2 Histograms in S1 Histograms
        - Only images 1-4
    - Check the probability
    - Invert and test again
        - A in B? // B in A?
%}

%Setup
    clear all
    close all

%Number of files
    num_img = 13; %1-13
    num_pessoas = 20; %1-136

%Load the Histograms
    run load_MTCNN   %Load the Database
    run make_lbp;    %Make the LBP

progress = 'Guessing'

%Evaluate  
    cont = 0;
    for a=1 : s1
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
            
        %Mesmo Grupo
        if floor((a-1)/num_img) == floor((the_one-1)/num_img)
            cont = cont + 1;
            
        end
        
        %Depict
        %{
            if a == 1
                figure('Name', 'Test Two');
            end
            subplot(1,2,1); imshow(resized_pic_s1{a});  title(a, 'Color', 'r');
            subplot(1,2,2); imshow(resized_pic_s2{the_one}); title(the_one, 'Color', 'r');
            
            pause();
        %}
    end
    
    %Results
    res_s1s2 = (cont*100) / s1
    
    %---------------------------------
    
    cont = 0;
    for a=1 : s2
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
        
        %Mesmo Grupo
        if floor((a-1)/num_img) == floor((the_one-1)/num_img)
            cont = cont + 1;
            
        end
        
        %Depict
        %{
            if a == 1
                figure('Name', 'Test Two');
            end
            subplot(1,2,1); imshow(images_s1{a});  title('Sorted', 'Color', 'r');
            subplot(1,2,2); imshow(images_s2{the_one}); title('Guessed', 'Color', 'g');
            
            pause;
        %}
    end
 
    %Results
    res_s2s1 = (cont*100) / s2
    
    %------------------------------------
    
progress = 'DONE'

close all

clear a; clear buff; clear comparison;
clear d; clear i; clear s1; clear s2
clear the_one; clear cont;
clear num_img; clear num_pessoas;