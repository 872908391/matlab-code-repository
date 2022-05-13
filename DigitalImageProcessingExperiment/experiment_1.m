close all;
image  =  imread('1.tif');
whos image
imshow(image);
info = imfinfo('1.tif');
whos info
imwrite(image, '1.jpg', 'quality', 20);
imwrite(image, '1.bmp');
image1 = imread('peacock.jpg');
figure,imshow(image1);
image2 = imread('pears.jpg');
figure,imshow(image2);
imageGray = rgb2gray(image2);
BW = im2bw(imageGray,0.5);
figure,imshow(imageGray);
figure,imshow(BW);