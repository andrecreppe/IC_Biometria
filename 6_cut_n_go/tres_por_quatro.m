progress = 'Resizing the images'

resized_pic_s1{1, s1} = [];
resized_pic_s2{1, s1} = [];

for a=1 : s1
    %Convert to Gray
        img_g = images_s1{a};

    %Pic the sizes
        [alt, larg] = size(img_g);

    %Remove the border
        img_g = img_g(5:alt-5,5:larg-5);
        %imshow(img_g);
        %pause;

    %Resize it
        [~, larg] = size(img_g);

    %Find the face (horizontal axis)
        %soma_v = sum(img_g);
        %plot(1:larg,soma_v,'-r' );
        %pause;

    %Find the edge
        bordas = edge(img_g,'sobel');
        %imshow(bordas);
        soma_v = sum(bordas);
        %plot(1:larg,soma_v,'-r' );
        %pause

    %Cut the image -> Horizontly
        aux = zeros(1,larg-8);
        for i = 7 : larg-5 
            aux(i) = sum(soma_v(i-4:i+4)) ;
        end

        m = max(aux);
        i = 1 ;
        while aux(i) < m/2
            i = i + 1 ; 
        end

        re = i ;

        i = size(aux,2) ;
        while aux(i) < m/2
            i = i - 1 ; 
        end

        rd = i ;
        img_recorte = img_g(:, re:rd) ;

        %imshow(img_recorte) ;

    %Cut the image -> Verticly
        img_g = img_recorte';
        [alt, larg] = size(img_g) ;

        img_g = img_g(5:alt-5,5:larg-5) ;
        [~, larg] = size(img_g) ;
        %imshow(img_g) ;
        %pause

        soma_v = sum(img_g) ;
        %plot(1:larg,soma_v,'-r' );
        %pause

        bordas = edge(img_g,'sobel' );
        %imshow(bordas);
        %pause

        soma_v = sum(bordas) ;
        %plot(1:larg,soma_v,'-r' );
        %pause

        aux = zeros(1,larg-8);
        for i = 7 : larg-5 
            aux(i) = sum(soma_v(i-4:i+4)) ;
        end

        %plot(1:size(aux,2), aux, '-g' ) ;
        m = max(aux) ;
        i = 1 ;
        while aux(i) < m/5
            i = i + 1 ; 
        end

        re = i ;

        rd = larg-re;

        img_recorte = img_g(:, re:rd) ;
        resized_pic_s1{a} = (img_recorte''');
        %imshow(img_recorte''') ;
end
for a=1 : s2
    %Convert to Gray
        img_g = images_s2{a};

    %Pic the sizes
        [alt, larg] = size(img_g);

    %Remove the border
        img_g = img_g(5:alt-5,5:larg-5);
        %imshow(img_g);
        %pause;

    %Resize it
        [~, larg] = size(img_g);

    %Find the face (horizontal axis)
        %soma_v = sum(img_g);
        %plot(1:larg,soma_v,'-r' );
        %pause;

    %Find the edge
        bordas = edge(img_g,'sobel');
        %imshow(bordas);
        soma_v = sum(bordas);
        %plot(1:larg,soma_v,'-r' );
        %pause

    %Cut the image -> Horizontly
        aux = zeros(1,larg-8);
        for i = 7 : larg-5 
            aux(i) = sum(soma_v(i-4:i+4)) ;
        end

        m = max(aux);
        i = 1 ;
        while aux(i) < m/2
            i = i + 1 ; 
        end

        re = i ;

        i = size(aux,2) ;
        while aux(i) < m/2
            i = i - 1 ; 
        end

        rd = i ;
        img_recorte = img_g(:, re:rd) ;

        %imshow(img_recorte) ;

    %Cut the image -> Verticly
        img_g = img_recorte';
        [alt, larg] = size(img_g) ;

        img_g = img_g(5:alt-5,5:larg-5) ;
        [~, larg] = size(img_g) ;
        %imshow(img_g) ;
        %pause

        soma_v = sum(img_g) ;
        %plot(1:larg,soma_v,'-r' );
        %pause

        bordas = edge(img_g,'sobel' );
        %imshow(bordas);
        %pause

        soma_v = sum(bordas) ;
        %plot(1:larg,soma_v,'-r' );
        %pause

        aux = zeros(1,larg-8);
        for i = 7 : larg-5 
            aux(i) = sum(soma_v(i-4:i+4)) ;
        end

        %plot(1:size(aux,2), aux, '-g' ) ;
        m = max(aux) ;
        i = 1 ;
        while aux(i) < m/5
            i = i + 1 ; 
        end

        re = i ;

        rd = larg-re;

        img_recorte = img_g(:, re:rd) ;
        resized_pic_s2{a} = (img_recorte''');
        %imshow(img_recorte''') ;
end

clear alt; clear aux; clear bordas; 
clear i; clear img_g; clear img_recorte;
clear larg; clear m; clear rd; clear re;
clear soma_v; clear a; 