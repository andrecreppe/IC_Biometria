%Initializing
    clear all;
    
    
%Set image parameters
    pic = imread('pic.gif');
    [pic_alt, pic_larg] = size(pic);

    
%New image matrix
    pic_new = uint8(zeros(pic_alt, pic_larg));
    

%LBP
    for lin=1: pic_alt-2
        for col=1: pic_larg-2
            %Local "for"
            bin = zeros(1, 8);

            center = pic(lin+1,col+1);

            cont_bin = 1;

            %1 a 3
            for i=col: col+2 
                if pic(lin, i) > center
                    pic_new(1, cont_bin) = 1;
                else
                    bin(1, cont_bin) = 0;
                end
                cont_bin = cont_bin + 1;
            end
            %6
            if pic(lin+1, col+2) > center
                bin(1, cont_bin) = 1;
            else
                bin(1, cont_bin) = 0;
            end
            cont_bin = cont_bin + 1;
            %9 a 7
            for i=col+2:-1:col
                if pic(lin+2, i) > center
                    bin(1, cont_bin) = 1;
                else
                    bin(1, cont_bin) = 0;
                end
                cont_bin = cont_bin + 1;
            end
            %4
            if pic(lin+1, col) > center
                bin(1, cont_bin) = 1;
            else
                bin(1, cont_bin) = 0;
            end

            %Convert to decimal
                pic_new(lin, col) = bi2de(bin);
        end
    end

%Histogram
    hist = zeros(1,256) ;
    hist2 = zeros(1, 256);
    
    %Not Processed picture
    for i=1: pic_alt
        for j=1 : pic_larg
            hist(pic(i,j) + 1) = hist(pic(i,j)+1) + 1 ;
        end
    end
    hist = double(hist) / double(pic_larg * pic_alt) ;
    
    %Processed picture
    for i=1: pic_alt
        for j=1 : pic_larg
            hist2(pic_new(i,j) + 1) = hist2(pic_new(i,j)+1) + 1 ;
        end
    end
    hist2 = double(hist2) / double(pic_larg * pic_alt) ;

%Printing
    imshow(pic)
    figure
    plot(1:1:256,hist,'-r') ;
    
    pause
    
    figure 
    imshow(pic_new)
    figure
    plot(1:1:256,hist2,'-b') ;
    
    pause
    close all