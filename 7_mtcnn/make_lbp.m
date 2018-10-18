mtcnn = strcmp(progress, 'Loading MTCNN');

progress = 'making LBP'

%s1
for a=1 : s1
    %Divide the image in 4
    if mtcnn
        [pic_alt, pic_larg] = size(images_s1{a});

        pic_new = images_s1{a};
    else
        [pic_alt, pic_larg] = size(resized_pic_s1{a});

        pic_new = resized_pic_s1{a};
    end

    hist = [];
    
    %LBP Each Part
    for b=1 : 4
        
        %Select Quadrant
        if b == 1
            I = pic_new(1:floor(pic_alt/2), 1:floor(pic_larg/2));
        elseif b == 2
            I = pic_new(1:floor(pic_alt/2), floor(pic_larg/2):pic_larg);
        elseif b == 3
            I = pic_new(floor(pic_alt/2):pic_alt, 1:floor(pic_larg/2));
        else
            I = pic_new(floor(pic_alt/2):pic_alt, floor(pic_larg/2):pic_larg);
        end

        %Extract Features
        hist = [hist extractLBPFeatures(I)];

    end

    %Save it
    if(a == 1)
        LBPDatabase_s1 = hist;
    else
        buff = LBPDatabase_s1;
        LBPDatabase_s1 = [buff; hist];
    end
end

%s2
for a=1 : s2
    %Divide the image in 4
    if mtcnn
        [pic_alt, pic_larg] = size(images_s2{a});

        pic_new = images_s2{a};
    else
        [pic_alt, pic_larg] = size(resized_pic_s2{a});

        pic_new = resized_pic_s2{a};
    end

    %LBP Each Part
    for b=1 : 4
        %Select Quadrant
        if b == 1
            I = pic_new(1:floor(pic_alt/2), 1:floor(pic_larg/2));
        elseif b == 2
            I = pic_new(1:floor(pic_alt/2), floor(pic_larg/2):pic_larg);
        elseif b == 3
            I = pic_new(floor(pic_alt/2):pic_alt, 1:floor(pic_larg/2));
        else
            I = pic_new(floor(pic_alt/2):pic_alt, floor(pic_larg/2):pic_larg);
        end

        %Extract Features
        lbpFeatures = extractLBPFeatures(I);

        numNeighbors = 8;
        numBins = numNeighbors*(numNeighbors-1)+3;
        lbpCellHists = reshape(lbpFeatures,numBins,[]);

        lbpFeatures = reshape(lbpCellHists,1,[]);

        %Create/concatene a histogram
        if b == 1
            hist = lbpFeatures;
        else
            hist = cat(2, hist, lbpFeatures);
        end
    end

    %Save it
    if(a == 1)
        LBPDatabase_s2 = hist;
    else
        buff = LBPDatabase_s2;
        LBPDatabase_s2 = [buff; hist];
    end
end

%Clear to save
clear a; clear b;
clear pic_alt; clear pic_larg;

clear I; clear lbpFeatures; clear numNeighbors;
clear numBins; clear lbpCellHists; clear pCellHists;
clear lbpFeatures;

clear buff; clear pic_new; clear quadrant;
clear hist;

%clear resized_pic_s1; clear resized_pic_s2;