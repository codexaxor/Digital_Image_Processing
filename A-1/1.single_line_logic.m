clc;
clearvars;
close all;

a=imread('input.jpg');

[r,c]=size(a);

b = a(:,end:-1:1,:);

subplot(1,2,1), imshow(a)
subplot(1,2,2), imshow(b)