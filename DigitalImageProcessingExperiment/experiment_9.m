close all;
i = imread('6.jpg'); % 读入原图像
f = rgb2gray(i);
f = imnoise(f,'gauss',0.02); % 添加高斯噪声
figure(3),imshow(f)
[gv,t1] = edge(f,'sobel','vertical'); % 使用 edge 函数对图像 f 提取垂直的边缘
figure(1),imshow(gv); %prewitt roberts sobel LoG
[gb,t2] = edge(f,'sobel','horizontal'); % 使用 edge 函数对图像 f 提取垂直的边缘
figure(2),imshow(gb)
% w45 = [-2 -1 0;-1 0 1;0 1 2]; % 指定模版使用 imfilter 计算 45 度方向的边缘
% g45 = imfilter(double(f),w45,'replicate');
% T = 0.3*max(abs(g45(:))); % 设定阈值
% g45 = g45 >= T; % 进行阈值处理
% figure(3),imshow(g45);