%Setup
    clc;
    close all
    clear all
    
%Quantity
    num_img = 4;
    num_pessoas = 20;
        region = 'face';
        %region = 'left';
        %region = 'right';
    
%Load base
    run load_data;
        %run extra/show_images_mono;
    run lbp;
    run compareit;
    run plot_hist;