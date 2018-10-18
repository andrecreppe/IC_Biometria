%Setup
    clear all;
    close all;


%Try to load the databse 
    try %-> have one
        load('database');
        
        cont = 0;
    
        for a=1 : num_files
            comparison = LBPDatabase(a, :);

            the_one = 1;
            buff = pdist2(LBPDatabase(1, :), comparison);

            %Similarity finder
            for i=1 : num_files
                if i ~= a
                    d = pdist2(LBPDatabase(i, :), comparison);
                    if d < buff
                        buff = d;
                        the_one = i;
                    end
                end
            end
            
            %Comparator
            div1 = floor((a-1)/10);
            div2 = floor((the_one-1)/10);
            
            if div1 == div2
                cont = cont + 1;
            end
        end
        
        acertos = (cont*100)/400

    catch %-> don't have one
        %Generate the database
        run generate
        run recognition_V3
    end