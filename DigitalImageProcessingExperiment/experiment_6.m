close all;
i = imread('6.jpg'); % 读入原图像
I = rgb2gray(i);
figure,imshow(I); % 显示原图像
fftI = fft2(I); % 二维离散傅立叶变换

sfftI = fftshift(fftI); % 直流分量移到频谱中心
RR = real(sfftI); % 取傅立叶变换的实部
II = imag(sfftI); % 取傅立叶变换的虚部
A = sqrt(RR.^2+II.^2); % 计算频谱幅值
A = (A-min(min(A)))/(max(max(A))-min(min(A)))*225; % 归一化
figure,imshow(A); % 显示原图像的频谱

% phase = log(angle(sfftI)); % 转换为度数
phase = atan2(II,RR);
figure,imshow(phase); % 显示原图像的相位


