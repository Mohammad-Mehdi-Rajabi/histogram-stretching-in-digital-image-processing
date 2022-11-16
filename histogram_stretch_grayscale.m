clc
clear all


% read image in gray scale
% add your image path here
img = rgb2gray(imread("input path"));

% to get length and height of image
[len, high] = size(img);

% to get max and min intensity of image
max_intensity = max(max(img));
min_intensity = min(min(img));

% create zeros matrix
stretch_img = zeros(len, high);

% histogram stretching 
% g(x,y) = ((f(x,y)-min_intensity)/(max_intensity-min_intensity))* z + MIN
% z =(MAX - MIN) 
% where MIN -> minimum value of needed dynamic range -> here is 0
% MAX -> maximum value of needed dynamic range -> here is 255
for i = 1:len
    for j = 1:high
      stretch_img(i,j)=(double(img(i,j)-min_intensity)/double(max_intensity-min_intensity))*255; 
    end
end

% convert output matrix from double to uint8
stretch_img = uint8(stretch_img);

% show input and output image
imshow(img), figure,imshow(stretch_img);

%save output
% add your path to save output here
imwrite(stretch_img, "output path")
