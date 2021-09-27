function my_GaussFilter()
    
%% ID = 25 % 4 = 1
    
    N = 5;
    
%     X = [-2 -1 0 1 2; -2 -1 0 1 2; -2 -1 0 1 2; -2 -1 0 1 2; -2 -1 0 1 2];
%     Y = [-2 -2 -2 -2 -2; -1 -1 -1 -1 -1; 0 0 0 0 0; 1 1 1 1 1; 2 2 2 2 2];
    
    ind = -floor(N/2) : floor(N/2);
    [X Y] = meshgrid(ind, ind);
    
    
%% power X, Y
%X = X .* X;
X = power(X,2);
Y = power(Y,2);

%% initialize SIGMA
% s_igma = 0.02;

prompt = 'Enter Value of SIGMA : ';
s_igma = input(prompt);

%% Formula Developing

xp = exp(-(power(X,2)+power(Y,2)) / (2*power(s_igma,2)));
g_kernel = (1/(2*pi*power(s_igma,2))) * xp;

[k_row, k_col] = size(g_kernel);

%% image loading
A = rgb2gray(imread('input_image.jpg'));
% adding NOISE 
A = imnoise(A,'gaussian');
A = im2double(A);
[row,col] = size(A);

subplot(2,1,1);
imshow(A); 
title('Noisy Imgae');

%% initialize PADDING
p_A = zeros(row+2,col+2);
[p_row,p_col] = size(p_A);
p_A = im2double(p_A);

% Insert Target Image into PADDED MATRIX
p_A(2:row+1,2:col+1) = A;

%% Final Image
B = zeros(row,col);
B = im2double(B);
%% Filtering
for i = 1:row - k_row 
    for j = 1:col - k_col
        % temp section 
        T = p_A(i:i+k_row-1, j:j+k_col-1);
        T = g_kernel .* T;
        mx_value = sum(T(:));
        B(i,j) = mx_value;       
    end
end

%% OUTPUT
subplot(2,1,2);
imshow(B); 
title('Smooth Imgae');
imwrite(B, 'output_image.jpg');
end
