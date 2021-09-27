clc;

I = imread('pics/cameraman.png');

figure;
imshow(I);

[ROW, COL] = size(I);

no_pixel = ROW * COL;
% no_pixel

counter = 1;
pixel_pos_val = zeros(ROW,1);

mxm_gray_value = 0;
for i = 1:ROW
    for j = 1:COL
        pixel_pos_val(counter) = I(i,j);
        counter = counter + 1;
        if mxm_gray_value < I(i,j)
            mxm_gray_value = I(i,j);
        end
    end
end

mxm_gray_value;
gray_level = 256;
% r_val

freq_count = zeros(ROW,1);

k=1;
for i = 1:ROW
    for j = 1:COL
        k = I(i,j);
        freq_count(k+1) = freq_count(k)+1; 
    end
end

Total_pixel_num = 0;
% Display pixel frequency Values
for i = 1:ROW
    % preFix Sum
    if freq_count(i) ~= 0
        Total_pixel_num = Total_pixel_num + freq_count(i);
    end
end

Total_pixel_num;

% PDF calculation
probability_distribution = zeros(ROW,1);
probability_sum = 0;
for i = 1:ROW
    probability_distribution(i) = freq_count(i)/Total_pixel_num; 
    probability_sum = probability_sum + probability_distribution(i);
end


% CDF calculation 
cumulative_distribution = zeros(ROW,1); 
cumulative_distribution(1) = probability_distribution(1);
for i = 2:ROW
    cumulative_distribution(i) = cumulative_distribution(i-1) + probability_distribution(i);    
end


% multiply with L-1
L = gray_level;
for i = 1:ROW
    cumulative_distribution(i) = cumulative_distribution(i) * (L-1);    
end

% round of values
round_val = zeros(ROW,1);
for i = 1:ROW
    round_val(i) = round(cumulative_distribution(i));
end


% output pixel values
output_pixel = zeros(ROW,1);

for i = 1:ROW
    output_pixel(round_val(i)+1) = output_pixel(round_val(i)+1)+freq_count(i);
end

% for i = 1:ROW
%     fprintf('%d --> %d\n',i-1,output_pixel(i));
% end


% Histogram Equilizer Image
H = uint8(zeros(ROW,COL));
for i = 1:ROW
    for j = 1:COL
            H(i,j) = output_pixel(I(i,j)+1);
    end
end

figure;
histogram(output_pixel);
figure;
imshow(H);










