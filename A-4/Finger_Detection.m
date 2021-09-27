% Step 0: Go through All the Images 


imagefiles = dir('/files/*.png');
nfiles = length(imagefiles);
output_count = 1;

for ii=1:nfiles
    
    currentfilename = imagefiles(ii).name;
    currentimage = imread(currentfilename);
    origin_img = currentimage;
    
    subplot(5,6,output_count);imshow(origin_img);title('Orginal');
    output_count = output_count + 1;
    
    %Step 1: Convert the Image to Grayscale
    gray_img = rgb2gray(origin_img);
    
    %Step 2: Convert the Grayscale to BinaryImage
    binary_img = imbinarize(gray_img,graythresh(gray_img));
    subplot(5,6,output_count);imshow(binary_img);title('Binary Image');
    output_count = output_count + 1;
    
    
    %     Opening
    
    %Step 3: Erosion Process [Shrinking]
    se_er = strel('disk',39);  % power of 3
    eroted_img = imerode(binary_img,se_er);
    
    
    %Step 4: Dialation Process [Expanding]
    se_di = strel('disk',48);
    dialated_img = imdilate(eroted_img,se_di);
    
    
    
    subplot(5,6,output_count);imshow(dialated_img);title('Palm');
    output_count = output_count + 1;
    
    
    %Step 5: Substract Dialated Image from Binary Image
    F_img = binary_img - dialated_img;
    subplot(5,6,output_count);imshow(F_img);title('Raw Output');
    output_count = output_count + 1;
    
    
    %Step 6: Tuning the Image
    R_img = bwareaopen(F_img,5000);
    Tuned_img = imfill(R_img,'holes');
    
    subplot(5,6,output_count);imshow(Tuned_img);title('Tuned Output');
    output_count = output_count + 1;
    
    
    %Step 7: Output Show
    [L,num] = bwlabel(Tuned_img);
    o_img = num2str(num);
    
    subplot(5,6,output_count);text(0.5,0.5,o_img); axis off;title('Fingers');
    output_count = output_count + 1;
    
    clearvars origin_img gray_img binary_img F_img Tuned_img
    
    
end

