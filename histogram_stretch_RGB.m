clc
clear all


% read image in RGB
% add your image path here
img = imread("your path");

% separated R, G and B channel
img_R = img(:, : ,1);
img_G = img(:, : ,2);
img_B = img(:, : ,3);

% to get length and height of image in each channel
[len_R, high_R] = size(img_R);
[len_G, high_G] = size(img_G);
[len_B, high_B] = size(img_B);

% to get max and min intensity of image in each channel
max_intensity_R = max(max(img_R));
min_intensity_R = min(min(img_R));

max_intensity_G = max(max(img_G));
min_intensity_G = min(min(img_G));

max_intensity_B = max(max(img_B));
min_intensity_B = min(min(img_B));

% create zeros matrix for each channel
stretch_img_R = zeros(len_R, high_R);
stretch_img_G = zeros(len_G, high_G);
stretch_img_B = zeros(len_B, high_B);


% apply algorithm for each channel
% histogram stretching 
% for each channel:
% g(x,y) = ((f(x,y)-min_intensity)/(max_intensity-min_intensity))* z + MIN
% z =(MAX - MIN) 
% where MIN -> minimum value of needed dynamic range 
% MAX -> maximum value of needed dynamic range 
for i = 1:len_R
    for j = 1:high_R
      stretch_img_R(i,j)=(double(img_R(i,j)-min_intensity_R)/double(max_intensity_R-min_intensity_R))*255; 
    end
end

for i = 1:len_R
    for j = 1:high_R
      stretch_img_G(i,j)=(double(img_G(i,j)-min_intensity_G)/double(max_intensity_G-min_intensity_G))*255; 
    end
end

for i = 1:len_R
    for j = 1:high_R
      stretch_img_B(i,j)=(double(img_B(i,j)-min_intensity_B)/double(max_intensity_B-min_intensity_B))*255; 
    end
end


% convert output matrix from double to uint8
stretch_img_R = uint8(stretch_img_R);
stretch_img_G = uint8(stretch_img_G);
stretch_img_B = uint8(stretch_img_B);


% it combine R , G and B matrix to create RGB image
img_output = cat(3,stretch_img_R, stretch_img_G, stretch_img_B);

% show input and output image
imwrite(img_output,"your path");


% save output
% add your path to save output here
imshow(img), figure, imshow(img_output);
