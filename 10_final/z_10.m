%Setup
    clc;
    close all
    clear all
    
%Quantity
    num_img = 4;
    num_pessoas = 20;
    
%Load base
    run load_all;
    run lbp;
    %run comparisons;
    %run plot_hist;
    %run threshold;
    %run ROC;