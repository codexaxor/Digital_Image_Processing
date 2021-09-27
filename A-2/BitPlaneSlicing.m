clc;

I = imread('pics/pc.jpg');

% figure;
% imshow(I);

[row,col,ch] = size(I);

g_Img = uint8(zeros(row,col));

% convert RGB to GrayScale
% formula grayscale image = ( (0.3 * R) + (0.59 * G) + (0.11 * B) ).
g_Img = (0.3 * I(:,:,1)) + (0.59 * I(:,:,2)) + (0.11 * I(:,:,3));
t_Img = (0.3 * I(:,:,1)) + (0.59 * I(:,:,2)) + (0.11 * I(:,:,3));


g_Img = double(g_Img);

01010101
plane_0 = mod(g_Img,2);
plane_1 = mod(bitshift(g_Img,-1),2);
plane_2 = mod(bitshift(g_Img,-2),2);
plane_3 = mod(bitshift(g_Img,-3),2);
plane_4 = mod(bitshift(g_Img,-4),2);
plane_5 = mod(bitshift(g_Img,-5),2);
plane_6 = mod(bitshift(g_Img,-6),2);
plane_7 = mod(bitshift(g_Img,-7),2);


% figure;
subplot(3,3,1);
imshow(t_Img)
title('GrayScale')
subplot(3,3,2);
imshow(plane_0)
title('Bit Plane 0')
subplot(3,3,3);
imshow(plane_1)
title('Bit Plane 1')
subplot(3,3,4);
imshow(plane_2)
title('Bit Plane 2')
subplot(3,3,5);
imshow(plane_3)
title('Bit Plane 3')
subplot(3,3,6);
imshow(plane_4)
title('Bit Plane 4')
subplot(3,3,7);
imshow(plane_5)
title('Bit Plane 5')
subplot(3,3,8);
imshow(plane_6)
title('Bit Plane 6')
subplot(3,3,9);
imshow(plane_7)
title('Bit Plane 7')
