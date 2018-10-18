%Initialization
    clear all;
    close all;

    
%Database read
    imagefiles = dir('*.gif');      
    num_files = length(imagefiles);
    images{1, num_files} = [];
    

    for i=1 : num_files
       name = imagefiles(i).name;
       pic = imread(name);

       images{i} = pic;
    end

    clear imagefiles;
    clear name;
    clear num_files;
    clear pic;

    
%Plot generation
    [~, qtd] = size(images);

    hist{qtd, 1} = zeros();

    for a=1 : qtd
        pic_buff = images{1,a};
        [pic_alt, pic_larg] = size(pic_buff);

        hist_buff = zeros(1,256) ;

        for i=1: pic_alt
            for j=1 : pic_larg
                hist_buff(pic_buff(i,j) + 1) = hist_buff(pic_buff(i,j)+1) + 1;
            end
        end
        hist_buff = double(hist_buff) / double(pic_larg * pic_alt);

        hist{a,1} = hist_buff;
    end

    clear a; clear i; clear j;
    clear hist_buff; clear pic_buff;
    clear pic_alt; clear pic_larg;

    
%Guesser
    %Setup
    num_rand = randi([1, qtd], 1,1);

    comparison = hist{num_rand};

    the_one = 1;
    buff = pdist2(hist{1}, comparison);

    figure('Name', 'Similarity checker');
    subplot(1,2,1); imshow(images{num_rand});

    %Similarity finder
    for i=2 : qtd
        if i~=num_rand
            d = pdist2(hist{i}, comparison);
            if d < buff
                buff = d;
                the_one = i;
            end
        end
        subplot(1,2,2); imshow(images{i});  
        pause(0.0001)
    end
    
    
%Results
    imshow(images{the_one});
    pause
    close all