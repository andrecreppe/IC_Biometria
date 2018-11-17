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
    run load_data_mono;
        %run extra/show_images_mono;
    run lbp;
    run compareit;
    
%FAR Graph
