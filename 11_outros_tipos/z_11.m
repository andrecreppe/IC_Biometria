%--------- SETUP ----------

clc;
close all;
clear all;

%------- QUANTITY ----------

num_img = 4;
num_pessoas = 20;

raio = 1;

%------ THE CODE ----------

run load_images; %Using best option: face + 1 eye
run clbp; %Circular LBP
run comparisons;
run histograms;
run eficiency;
run curves;