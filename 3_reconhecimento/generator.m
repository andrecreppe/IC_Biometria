%Setup
    clear all;
    
    %"Custom" gray pallete
    cz = [0:1/255:1 ; 0:1/255:1 ; 0:1/255:1]';
    
    %Reference Matrix
    ref = [1 2 4 ; 128 0 8; 64 32 16];
    
    %Image Setup
    pic = double(imread('../IMAGES/D74.gif'));
    [pic_alt, pic_larg] = size(pic);
    
    %Generated-files Setup
    name = 'g';

    
%New image matrix
    pic_new = zeros(pic_alt, pic_larg);
    

%LBP
    for i=2 : pic_alt-2
        for j=2 : pic_larg-2
            patch = pic(i-1:i+1, j-1:j+1);
            patch_bin = patch > patch(2,2);
            patch_ref = patch_bin .* ref;
            
            dec = sum(sum(patch_ref));
            
            pic_new(i,j) = dec ;
        end
    end
    
    %Cleaning
        clear patch;
        clear patch_bin;
        clear patch_ref; clear ref
        clear dec;
        clear i; clear j;
    
    
%Slicing
    %Reajusting
    if rem(pic_alt, 2) == 0
        alt = pic_alt - 1;
        larg = pic_alt - 1;
    else
        alt = pic_alt;
        larg = pic_alt;
    end
    clear pic_alt; clear pic_larg;
    
    %The 4 quadrants
    p1 = pic_new(0:alt/2, 0:larg/2);
    p2 = pic_new(0:alt/2, alt/2:alt);
    p3 = pic_new(alt/2:alt, 0:larg/2);
    p4 = pic_new(alt/2:alt, larg/2:larg);
    

%Saving
    buff = strcat(name, '1.gif');
    imwrite(p1, buff);
    buff = strcat(name, '2.gif');
    imwrite(p2, buff);
    buff = strcat(name, '3.gif');
    imwrite(p3, buff);
    buff = strcat(name, '4.gif');
    imwrite(p4, buff);
    

%Exit
    clear all;