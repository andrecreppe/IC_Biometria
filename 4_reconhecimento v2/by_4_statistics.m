%Setup
    clear all
    close all
    
    
%Prepare the Database
    %run processed/lbp_fullface;

    
%Database read
    imagefiles = dir('processed/*.jpg');      
    num_files = length(imagefiles);

    images{1, num_files} = [];

    for i=1 : num_files
       nome = imagefiles(i).name;
       pic = imread(strcat('processed/',nome));

       images{i} = pic;
    end

    clear imagefiles; clear num_files;
    clear name; clear nome;
    clear i;
    clear pic;


%Histogram Formation
    [~, qtd] = size(images);

    hist{qtd, 1} = zeros();

    for a=1 : qtd
        %Image spliter
        pic_buff = images{1,a};
        
        [pic_alt, pic_larg] = size(pic_buff);
        
        p1 = pic_buff(1:pic_alt/2, 1:pic_larg);
        p2 = pic_buff(1:pic_alt/2, pic_larg/2:pic_larg);
        p3 = pic_buff(pic_alt/2:pic_alt, 1:pic_larg);
        p4 = pic_buff(pic_alt/2:pic_alt, pic_larg/2:pic_larg);

        hist_buff = zeros(1,256);
        hist_f = zeros(1,256);

        %p1
        for i=1: pic_alt/2
            for j=1 : pic_larg/2
                hist_f(p1(i,j) + 1) = hist_f(p1(i,j)+1) + 1;
            end
        end
        hist_f = double(hist_f) / double(pic_larg/2 * pic_alt/2);
        
        %p2
        for i=1: pic_alt/2
            for j=1 : pic_larg/2
                hist_buff(p2(i,j) + 1) = hist_buff(p2(i,j)+1) + 1;
            end
        end
        hist_buff = double(hist_buff) / double(pic_larg/2 * pic_alt/2);
        
        %p1 + p2
        hist_f = cat(2, hist_f, hist_buff);
        
        %p3
        for i=1: pic_alt/2
            for j=1 : pic_larg/2
                hist_buff(p3(i,j) + 1) = hist_buff(p3(i,j)+1) + 1;
            end
        end
        hist_buff = double(hist_buff) / double(pic_larg/2 * pic_alt/2);
        
        %p1,p2 + p3
        hist_f = cat(2, hist_f, hist_buff);
        
        %p4
        for i=1: pic_alt/2
            for j=1 : pic_larg/2
                hist_buff(p4(i,j) + 1) = hist_buff(p4(i,j)+1) + 1;
            end
        end
        hist_buff = double(hist_buff) / double(pic_larg/2 * pic_alt/2);
        
        %p1,p2,p3 + p4
        hist_f = cat(2, hist_f, hist_buff);
       
        hist{a,1} = hist_f;
    end
        
    clear a; clear i; clear j;
    clear hist_buff; clear pic_buff; clear hist_f;
    clear pic_alt; clear pic_larg;
    clear p1; clear p2; clear p3; clear p4;


%Guesser
    cont = 0;
    
    for x=1 : qtd
        %Setup
        comparison = hist{x};

        %Pic 1 is the base
        the_one = 1;
        buff = pdist2(hist{1}, comparison);

        %Similarity finder
        for i=2 : qtd %2 => the one is already above
            if i~=x
                d = pdist2(hist{i}, comparison);
                if d < buff
                    buff = d;
                    the_one = i;
                end
            end
        end

        %Comparator
        div1 = floor((x-1)/10);
        div2 = floor((the_one-1)/10);

        if div1 == div2
            cont = cont + 1;
        end
    end
    
    
%Results
    result = (cont/qtd) * 100

%Delete the Database
    %run processed/clean;