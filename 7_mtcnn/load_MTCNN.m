progress = 'Loading MTCNN'
   
%Database Gather -> Image name
imagefiles = dir('../PICTURES/Arface_mtcnn_v2/face/*.bmp');
tam = length(imagefiles);

filename{1, tam} = [];
for i=1 : tam
    filename{1, i} = imagefiles(i).name;
end

clear imagefiles; clear i; clear tam;

imagefiles = natsortfiles(filename);

%Load selective
num_files = num_pessoas * num_img * 2;

images{1, num_files} = [];

%Read selective
cont = 0;
a = 0;
for i=1 : num_files
   a = a + 1;
   
   nome = imagefiles{1, a};
   pic_new = imread(strcat('../PICTURES/Arface_mtcnn_v2/face/',nome));

   images{i} = rgb2gray(pic_new);
   
   cont = cont + 1;
   
   if cont == num_img
       cont = 0;
       a = a + 13 - num_img;
   end
end

clear imagefiles; clear fazer; clear filename
clear nome; clear fazer; clear i; 
clear a; clear cont;
clear pic; clear pic_new; 

images_s1{1, (num_pessoas * num_img)} = [];
images_s2{1, (num_pessoas * num_img)} = [];

fazer = true;
s1 = 1;
s2 = 1;

for i=1 : num_files
    if fazer == true
        images_s1{s1} = images{i};
        s1 = s1 + 1;
    else
        images_s2{s2} = images{i};
        s2 = s2 + 1;
    end
    
    if rem(i, num_img) == 0
        fazer = ~fazer;
    end
end

s1 = s1 - 1;
s2 = s2 - 1;

clear i; clear fazer;
clear images; 
clear num_files;
clear i;