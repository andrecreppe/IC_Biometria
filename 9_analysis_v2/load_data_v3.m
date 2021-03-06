progress = 'Loading MTCNN mono'

%----

direc = '../../DATABASES/Arface_dados_v3/';

num_files = num_pessoas * num_img;

%-----

region = 'face';

    %Database Gather -> Image name
        direc2 = strcat(direc, region);
        direc2 = strcat(direc2, '/');
        direc3 = strcat(direc2, '*.bmp');

        imagefiles = dir(direc3);
        tam = length(imagefiles);

        filename{1, tam} = [];
        for i=1 : tam
            filename{1, i} = imagefiles(i).name;
        end

        imagefiles = natsortfiles(filename);

        
    %Load selective
        images_f{1, num_files} = [];

        cont = 0;
        a = 0;
        for i=1 : num_files
           a = a + 1;

           nome = imagefiles{1, a};
           pic_new = imread(strcat(direc2 ,nome));

           images_f{i} = rgb2gray(pic_new);

           cont = cont + 1;

           if cont == num_img
               cont = 0;
               a = a + 13 - num_img;
           end
        end
        
%-----

region = 'left';

    %Database Gather -> Image name
        direc2 = strcat(direc, region);
        direc2 = strcat(direc2, '/');
        direc3 = strcat(direc2, '*.bmp');

        imagefiles = dir(direc3);
        tam = length(imagefiles);

        filename{1, tam} = [];
        for i=1 : tam
            filename{1, i} = imagefiles(i).name;
        end

        imagefiles = natsortfiles(filename);

        
    %Load selective
        images_l{1, num_files} = [];

        cont = 0;
        a = 0;
        for i=1 : num_files
           a = a + 1;

           nome = imagefiles{1, a};
           pic_new = imread(strcat(direc2 ,nome));

           images_l{i} = rgb2gray(pic_new);

           cont = cont + 1;

           if cont == num_img
               cont = 0;
               a = a + 13 - num_img;
           end
        end
    
%------

%Clearing
    clear imagefiles; clear i; clear tam;
    clear region; clear direc2; clear direc3;

    clear imagefiles; clear fazer; clear filename; clear direc;
    clear nome; clear fazer; clear i; 
    clear a; clear cont; 
    clear pic; clear pic_new; 

    clear i; clear fazer;
    clear images; 
    clear num_files;
    