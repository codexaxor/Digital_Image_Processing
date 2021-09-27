clc;
clearvars;
close all;

a=imread('input.jpg');
[r,c,ch]=size(a);
b = a;
% b = e;
for i=1:r
    for j=1:c
        for k=1:ch
            b(i,j,k)=a(i,c-j+1,k);
        end
    end
end
subplot(1,2,1), imshow(a)
subplot(1,2,2), imshow(b)