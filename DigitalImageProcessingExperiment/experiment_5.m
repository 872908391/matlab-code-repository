close all;
i = imread('5.jpg'); % 读入原图像
I = rgb2gray(i);
% J = imnoise(I,'gauss',0.02); % 添加高斯噪声
J = imnoise(I,'salt & pepper',0.02); % 添加椒盐噪声 (注意空格)
ave1 = fspecial('average',3); % 产生 3×3 的均值模版
ave2 = fspecial('average',5); % 产生 5×5 的均值模版
K = filter2(ave1,J)/255; % 均值滤波 3×3
L = filter2(ave2,J)/255; % 均值滤波 5×5
M = medfilt2(J,[3 3]); % 中值滤波 3×3 模板
N = medfilt2(J,[4 4]); % 中值滤波 4×4 模板
figure(1),imshow(I);title('原图像');
figure(2),imshow(J);title('椒盐噪声');
figure(3),imshow(K);title('均值滤波 3×3');
figure(4),imshow(L);title('均值滤波 5×5');
figure(5),imshow(M);title('中值滤波 3×3 模板');
figure(6),imshow(N);title('中值滤波 5×5 模板');