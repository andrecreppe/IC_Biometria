function resp = recognition( img1, img2 )
%Recognition img1 (matrix) and img2 (matrix)
%   Compare two images and return how much they are equal
%   Using LBP/4 method

%---------- LBP ------------
    [pic_alt, pic_larg] = size(img1);
    pic_new = img1;
    hist = [];

    %LBP Each Part
    for b=1 : 4
        if b == 1
            I = pic_new(1:floor(pic_alt/2), 1:floor(pic_larg/2));
        elseif b == 2
            I = pic_new(1:floor(pic_alt/2), floor(pic_larg/2):pic_larg);
        elseif b == 3
            I = pic_new(floor(pic_alt/2):pic_alt, 1:floor(pic_larg/2));
        else
            I = pic_new(floor(pic_alt/2):pic_alt, floor(pic_larg/2):pic_larg);
        end
        
        hist = [hist extractLBPFeatures(I)];
    end
    
    LBP_img1 = hist;
    
    [pic_alt, pic_larg] = size(img2);
    pic_new = img2;
    hist = [];

    %LBP Each Part
    for b=1 : 4
        if b == 1
            I = pic_new(1:floor(pic_alt/2), 1:floor(pic_larg/2));
        elseif b == 2
            I = pic_new(1:floor(pic_alt/2), floor(pic_larg/2):pic_larg);
        elseif b == 3
            I = pic_new(floor(pic_alt/2):pic_alt, 1:floor(pic_larg/2));
        else
            I = pic_new(floor(pic_alt/2):pic_alt, floor(pic_larg/2):pic_larg);
        end
        
        hist = [hist extractLBPFeatures(I)];
    end
    
    LBP_img2 = hist;
    
%---------- COMPARISON ------------

    pdist2(LBP_img1(:), LBPDatabase_l(cont, :), 'cityblock');
    
    
end

