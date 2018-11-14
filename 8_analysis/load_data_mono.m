progress = 'Loading MTCNN mono'
   
%Database Gather -> Image name
direc = '../../DATABASES/Arface_mtcnn_v2/';
    direc = strcat(direc, region);
    direc = strcat(direc, '/');
    direc2 = strcat(direc, '*.bmp');
imagefiles = dir(direc2);
tam = length(imagefiles);

filename{1, tam} = [];
for i=1 : tam
    filename{1, i} = imagefiles(i).name;
end

clear imagefiles; clear i; clear tam;
clear region; clear direc2;

imagefiles = natsortfiles(filename);

%Load selective
num_files = num_pessoas * num_img;

images{1, num_files} = [];

%Read selective
cont = 0;
a = 0;
for i=1 : num_files
   a = a + 1;
   
   nome = imagefiles{1, a};
   pic_new = imread(strcat(direc ,nome));

   images{i} = rgb2gray(pic_new);
   
   cont = cont + 1;
   
   if cont == num_img
       cont = 0;
       a = a + 13 - num_img;
   end
end

clear imagefiles; clear fazer; clear filename; clear direc;
clear nome; clear fazer; clear i; 
clear a; clear cont; 
clear pic; clear pic_new; 

images_s1{1, (num_pessoas * num_img)} = [];

s1 = 1;

for i=1 : num_files
    images_s1{s1} = images{i};
    s1 = s1 + 1;
end

s1 = s1 - 1;

clear i; clear fazer;
clear images; 
clear num_files;
%clear s1