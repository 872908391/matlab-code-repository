close all;
% %加
image1 = imread('2.1.jpg');
image2 = imread('2.2.jpg');
image_1  = imresize(image1,[512,512]);
image_2  = imresize(image2,[512,512]);
% Add = imadd(image_1,image_2);
% figure,imshow(Add);
% imageAdd = imadd(image1,100);
% % figure,imshow(image1);
% figure,imshow(imageAdd);

% %减
% Sub = imsubtract(image_1,image_2);
% figure,imshow(Sub);
% imageSub = imsubtract(image_1,100);
% figure,imshow(imageSub);

% %乘
% M = immultiply(uint16(image_1),uint16(image_2));
% figure,imshow(M);
% imageM = immultiply(image_1,3);
% figure,imshow(imageM);

% %除
div = imdivide(double(image_1),double(image_2));
figure,imshow(div);
imageDiv  = imdivide(image_1,10);
figure,imshow(imageDiv);
