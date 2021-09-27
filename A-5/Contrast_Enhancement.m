clc;
clearvars;
close all;

%% step - 1
original_img = imread('img.jpeg');
% original_img = im2gray(original_img);
subplot(2,4,1);imshow(original_img);title('a');

%% step - 2
laplacian_mask = [0,1,0;0,-4,0;0,1,0];
laplacian_img = conv2(double(original_img),double(laplacian_mask),'same');
subplot(2,4,2);imshow(laplacian_img,[]);title('b');

%% step - 3
EnhancedImage = double(original_img) - laplacian_img;
subplot(2,4,3);imshow(EnhancedImage, []);title('c');

%% step - 4
% https://www.mathworks.com/help/images/ref/imgradient.html#d123e145173
[sobel_img, ~] = imgradient(original_img, 'Sobel');
subplot(2, 4, 4);imshow(sobel_img, []);title('d');

%% step - 5
avg_filter = ones(5,5)/25;
avg_img = conv2(double(sobel_img),avg_filter,'same');
% avg_img = imfilter(double(sobel_img),avg_filter);
subplot(2, 4, 5);imshow(avg_img, []);title('e');

%% step - 6
% https://www.mathworks.com/help/images/ref/immultiply.html
% prod_img = immultiply(EnhancedImage,avg_img);
prod_img = EnhancedImage .* avg_img;
subplot(2, 4, 6);imshow(prod_img,[]);title('f');

%% step - 7
a_img = imadd(uint16(original_img),uint16(prod_img));
subplot(2, 4, 7);imshow(a_img,[]);title('g');

%% step - 8
c=1;
gamma = 0.5;
x_img = im2double(a_img);
gamma_transform = c*(x_img.^gamma);
subplot(2, 4, 8);imshow(real(gamma_transform),[]);title('h');