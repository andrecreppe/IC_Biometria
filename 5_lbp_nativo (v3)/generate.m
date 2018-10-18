%Program called when there's a need to regenerate the database%

%Image Setup
    imagefiles = dir('../PICTURES/Full_Face/*.pgm');      
    num_files = length(imagefiles);

    images{1, num_files} = [];

    for i=1 : num_files
       nome = imagefiles(i).name;
       pic_new = imread(strcat('../PICTURES/Full_Face/',nome));

       images{i} = pic_new;
    end

    clear imagefiles;
    clear name; clear nome;
    clear i;
    clear pic; clear pic_new;

    
%Image matrix parameters
    [pic_alt, pic_larg] = size(images{1});
    
%Generator
for a=1 : num_files
    %Divide the image in 4
    pic_new = images{a};
    
    %LBP Each Part
    for b=1 : 4
        %Select Quadrant
        if b == 1
            I = pic_new(1:pic_alt/2, 1:pic_larg/2);
        elseif b == 2
            I = pic_new(1:pic_alt/2, pic_larg/2:pic_larg);
        elseif b == 3
            I = pic_new(pic_alt/2:pic_alt, 1:pic_larg/2);
        else
            I = pic_new(pic_alt/2:pic_alt, pic_larg/2:pic_larg);
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
        LBPDatabase = hist;
    else
        buff = LBPDatabase;
        LBPDatabase = [buff; hist];
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


%Saving
    save('database');
    
clear all;