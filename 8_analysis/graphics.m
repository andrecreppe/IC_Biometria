%Setup
    close all
    clear all
    
%Quantity
    num_img = 4;
    num_pessoas = 20;
        region = 'face';
        %region = 'left';
        %region = 'right';
    
%Load base
    %run load_data;
        %run show_images;
    run load_data_mono;
        %run show_images_mono;
    run comparison;
    
%FAR Graph
