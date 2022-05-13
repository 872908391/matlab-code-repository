close all;
i = imread('4.jpg'); % 读入原图像
I = rgb2gray(i);
J = histeq(I); % 对原图像进行直方图均衡化处理
figure()
imshow(I); % 显示原图像
title('原图像'); % 给原图像加标题名

figure()
imshow(J); %显示直方图均衡化后的图像
title('直方图均衡化后的图像'); % 给直方图均衡化后的图像加标题名

figure()
subplot(1,2,1);
imhist(I,64); % 将原图像直方图显示为 64 级灰度
title('原图像直方图'); % 给原图像直方图加标题名
subplot(1,2,2); % 作第 2 幅子图
imhist(J,64); % 将均衡化后图像的直方图显示为 64 级灰度
title('均衡变换后的直方图'); % 给均衡化后图像直方图加标题名