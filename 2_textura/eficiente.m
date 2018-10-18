clear all;

cinza = [0:1/255:1 ; 0:1/255:1 ; 0:1/255:1]' ;

pic = imread('pic.gif') ;

pesos = [1 2 4 ; 128 0 8; 64 32 16] ;

[altura largura] = size(pic) ;

pic_new = zeros(altura, largura) ;


for i = 2 : altura - 2
    
    for j = 2 : largura -2 
        patch = pic(i-1:i+1,j-1:j+1) ;
        patch_b = patch > patch(2,2) ;
        patch_p = patch_b .* pesos ;
        dec = sum(sum(patch_p));
        pic_new(i,j) = dec ;
    end
end


%Histogram
    hist = zeros(1,256) ;
    hist2 = zeros(1, 256);
    
    %Not Processed picture
    for i=1: altura
        for j=1 : largura
            hist(pic(i,j) + 1) = hist(pic(i,j)+1) + 1 ;
        end
    end
    hist = double(hist) / double(largura * altura) ;
    
    %Processed picture
    for i=1: altura
        for j=1 : largura
            hist2(pic_new(i,j) + 1) = hist2(pic_new(i,j)+1) + 1 ;
        end
    end
    hist2 = double(hist2) / double(largura * altura) ;

%Printing
    imshow(pic,cinza)
    figure
    plot(1:1:256,hist,'-r') ;
    
    pause
    
    figure 
    imshow(pic_new,cinza)
    figure
    plot(1:1:256,hist2,'-b') ;
    
    pause 
    
    close all
        
        
        
        

