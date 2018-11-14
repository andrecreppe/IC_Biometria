progress = 'Showing images'

time = 0.2;

for a=1 : s1
    num = floor((a-1)/4) + 1;
    
    stringe = strcat('1- Grupo: ', num2str(num));
    stringee = strcat('2- Grupo: ', num2str(num));
    
    subplot(1,2,1); imshow(images_s1{a});  title(stringe, 'Color', 'r');
    subplot(1,2,2); imshow(images_s2{a}); title(stringee, 'Color', 'r');
    
    pause(time);
end

clear stringe; clear stringee;
close all; clear time; clear num;