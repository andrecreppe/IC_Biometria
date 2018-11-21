progress = 'Loading DATABASE'

%Database Gather -> Image name
imagefiles = dir('../../DATABASES/ARFACE_database/*.bmp');
tam = length(imagefiles);

filename{1, tam} = [];
for i=1 : tam
    filename{1, i} = imagefiles(i).name;
end

clear imagefiles; clear i; clear tam;

imagefiles = natsortfiles(filename);


%Image load
if num_files < 0
    num_files = length(imagefiles);
end

images{1, num_files} = [];

for i=1 : num_files
   nome = imagefiles{1, i};
   pic_new = imread(strcat('../PICTURES/ARFACE_database/',nome));

   images{i} = rgb2gray(pic_new);
end

clear imagefiles; clear fazer; clear filename
clear nome; clear fazer; clear i;
clear pic; clear pic_new;

%Separe into s1/s2
fazer = true;
s1 = 0;
s2 = 0;

for i=1 : num_files
    if fazer == true
       s1 = s1 + 1;
    else
       s2 = s2 + 1;
    end

    if rem(i, 13) == 0
        fazer = ~fazer;
    end
end

images_s1{1, s1} = [];
images_s2{1, s2} = [];

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
    
    if rem(i, 13) == 0
        fazer = ~fazer;
    end
end

s1 = s1 - 1;
s2 = s2 - 1;

clear i; clear fazer;
clear images; clear num_files;