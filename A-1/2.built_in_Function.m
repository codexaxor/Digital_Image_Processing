clc;
clearvars;
close all;

A = imread('256.jpg');

C = A;

B = flip(C,2);

F = cat(2,A,B);

%output image
figure;
imshow(F);
saveas('output.jpg');





