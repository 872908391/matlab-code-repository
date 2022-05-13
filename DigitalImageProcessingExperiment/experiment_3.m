close all; 
image = imread('3.jpg');
% figure,imhist(image,256); % 显示其直方图

image1 = imadjust(image,[0 1],[1 0]); % 灰度转换，实现明暗转换(负片图像)
% figure,imshow(image1);

% 将 0.5 到 0.75 的灰度级扩展到范围[0 1]
image2 = imadjust(image,[0.5 0.75],[0 1]);
% figure,imshow(image2);

image3 = rgb2gray(image);
h = log(1+double(image3)); % 对输入图像对数映射变换
h1 = mat2gray(h); % 将矩阵 h 转换为灰度图片
h2 = im2uint8(h1); % 将灰度图转换为 8 位图
figure,imshow(h2);