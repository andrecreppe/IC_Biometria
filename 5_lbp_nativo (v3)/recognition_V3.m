%Setup
    clear all;
    close all;

%Try to load the databse 
    try %-> have one
        load('database');

        %Setup
        num_rand = randi(num_files);
            %Characteristics of the chosen one
        comparison = LBPDatabase(num_rand, :);

        the_one = 1;
        buff = pdist2(LBPDatabase(1, :), comparison);

        %Similarity finder
        for i=2 : num_files
            if i ~= num_rand
                d = pdist2(LBPDatabase(i, :), comparison);
                if d < buff
                    buff = d;
                    the_one = i;
                end
            end
        end

        figure('Name', 'Similarity checker');
        subplot(1,2,1); imshow(images{num_rand}); title(strcat('Sorted:.', num2str(num_rand)));
        subplot(1,2,2); imshow(images{the_one}); title(strcat('Guessed:.', num2str(the_one)));
    
    catch %-> don't have one
        %Generate the database
        run generate
        run recognition_V3
    end