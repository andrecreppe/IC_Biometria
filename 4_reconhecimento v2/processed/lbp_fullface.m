%Setup
    clear all;
    close all
    
    %Reference Matrix
        pesos = [1 2 4 ; 128 0 8; 64 32 16];
    
    %Gray pallete
        cz = [0:1/255:1 ; 0:1/255:1 ; 0:1/255:1]' ;
    
    %Image Setup
        imagefiles = dir('../../PICTURES/Full_Face/*.pgm');      
        num_files = length(imagefiles);

        images{1, num_files} = [];

        for i=1 : num_files
           nome = imagefiles(i).name;
           pic_new = imread(strcat('../../PICTURES/Full_Face/',nome));

           images{i} = pic_new;
        end

        clear imagefiles;
        clear name; clear nome;
        clear i;
        clear pic;

    %Image matrix parameters
        [pic_alt, pic_larg] = size(images{1});
        
        pic_new = zeros(pic_alt, pic_larg);
        
        
%Generator
    for a=1 : num_files
       %LBP
           pic = images{a};
            for i = 2 : pic_alt - 2
                for j = 2 : pic_larg -2 
                    patch = pic(i-1:i+1, j-1:j+1) ;
                    patch_b = patch > patch(2,2) ;
                    patch_p = patch_b .* pesos ;
                    dec = sum(sum(patch_p));
                    pic_new(i,j) = dec ;
                end
            end

        %Saving -- fix it
            buff = strcat('pic', num2str(a));
            buff = strcat(buff, '.jpg');
            
            imwrite(pic_new, cz, buff, 'jpg');
    end
    
    clear all