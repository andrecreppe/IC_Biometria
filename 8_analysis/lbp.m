progress = 'Making the LBP'

for a=1 : s1
   %Make LBP
       [pic_alt, pic_larg] = size(images_s1{a});
        pic_new = images_s1{a};
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
            LBPDatabase = hist;
        else
            buff = LBPDatabase;
            LBPDatabase = [buff; hist];
        end
        
     %
end

%Clear to save
clear a; clear b; clear buff;
clear pic_alt; clear pic_larg; clear pic_new;
clear I; clear lbpFeatures; clear numNeighbors;
clear numBins; clear lbpCellHists; clear pCellHists;
clear lbpFeatures; clear quadrant; clear hist;