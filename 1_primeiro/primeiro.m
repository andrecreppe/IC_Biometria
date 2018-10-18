clear all ;

img = imread('pout.tif') ;

maxv = max(max(img)) ;
minv = min(min(img)) ;

[altura largura] = size(img);

%img_t = img;

imshow(img) ; 


histo = zeros(1,256) ;

for i = 1: altura
    for j = 1 : largura
        histo(img(i,j) + 1) = histo(img(i,j)+1) + 1 ;
    end
end

histo = double(histo) / double(largura * altura) ;

pause
plot(1:1:256,histo,'-r') ;

        


pause

for i = 1 : altura
    for j = 1 : largura
        x = img(i,j) ;
        y = (255.0*double(x-minv)) / double(maxv-minv) ;
        img_t(i,j) = round(y) ;
    end
end;


histo_t = zeros(1,256) ;

for i = 1: altura
    for j = 1 : largura
        histo_t(img_t(i,j) + 1) = histo_t(img_t(i,j)+1) + 1 ;
    end
end

histo_t = double(histo_t) / double(largura * altura) ;

pause
plot(1:1:256,histo_t,'-r') ;

pause

close all;