progress = 'Showing images mono'

time = 0.2;

for a=1 : s1
    num = floor((a-1)/4) + 1;
    
    stringe = strcat('1- Grupo: ', num2str(num));
    
    imshow(images_s1{a});  title(stringe, 'Color', 'r');
    
    pause(time);
end

clear stringe; clear stringee;
close all; clear time; clear num;