close all;
image = imread('lena_horiz_lines.bmp');%图像写入
subplot(1,4,2); imshow(image);

%%%%%%灰度转换%%%%%%
temp = im2gray(image);%若是彩色图,返回灰度图,否则原样返回
gray = double(temp);
%%%%%%灰度转换%%%%%%

%%%%%%频谱转换%%%%%%
F = fft2(gray);
F1 = fftshift(F);%频谱中心化处理
spectrum = log(1+abs(F1)); %将复数变成实数并压缩数据范围
spectrum1 = uint8(mat2gray(spectrum)*255);%标准化使范围在[0.255]
subplot(1,4,1); imshow(spectrum1);
%%%%%%频谱转换%%%%%%

%%%%%%构建带阻陷波滤波器%%%%%%
[M,N] = size(image);%图像大小
AV = 0; AH = 1;%水平轴和垂直轴设置
SV = 30;SH = 30;%水平轴和垂直轴长度设置
W = 61;%带宽
H = ones(M,N,'single');
UC = floor(M/2)+1;
VC = floor(N/2)+1;
WL = (W-1)/2;%折半
H(UC-WL:UC+WL,1:VC-SH) = AH;%左边X轴
H(UC-WL:UC+WL,VC+SH:N) = AH;%右边X轴
H(1:UC-SV,VC-WL:VC+WL) = AV;%上边Y轴
H(UC+SV:M,VC-WL:VC+WL) = AV;%下边Y轴
subplot(1,4,3);imshow(H);
%%%%%%构建带阻陷波滤波器%%%%%%

%%%%%%滤波%%%%%%
result = ifftshift(H.*F1);
G = ifft2(result);
out=abs(G);
out=out/max(out(:));%归一化[0,1]
subplot(1,4,4);imshow(out);
%%%%%%滤波%%%%%%
imwrite(out,'1.jpg');


