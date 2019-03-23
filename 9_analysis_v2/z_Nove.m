%Setup
    clc;
    close all
    clear all
    
%Quantity
    num_img = 4;
    num_pessoas = 20;
        
    %region = face + left
    
%Load base
    run load_data; %- e=10.7143 // t=78.1429
        %run load_data_v3 %- e=14.5270 // t=89.5676
    run lbp;
    run compareit;
    run plot_hist;
    pause;
    run threshold;
    run ROC;

    clear images_f; clear images_l;