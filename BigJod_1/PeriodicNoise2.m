close all;
image = imread('lena_corrupt.bmp');%图像写入
subplot(1,4,2); imshow(image);


%%%%%%灰度转换%%%%%%
temp = im2gray(image);%若是彩色图,返回灰度图,否则原样返回
gray = double(temp);%转为double
%%%%%%灰度转换%%%%%%

%%%%%%频谱转换%%%%%%
F = fft2(gray);
F1 = fftshift(F);%频谱中心化处理
spectrum = log(1+abs(F1)); %将复数变成实数并压缩数据范围
spectrum1 = uint8(mat2gray(spectrum)*255);%标准化使范围在[0.255]
subplot(1,4,1); imshow(spectrum1);
%%%%%%频谱转换%%%%%%
%%%%%%构建高斯带阻陷波滤波器%%%%%%
[M,N] = size(image);%图像大小
fbrf=ones(M,N);
W = 39;%带宽
C0 = 170;%带阻中心
for i=1:M
    for j=1:N
        D2 = (i-M/2)^2+(j-N/2)^2;
        D = sqrt((i-M/2)^2+(j-N/2)^2);
        fbrf(i,j)=1-exp(-((D2-C0^2)/(D*W))^2);
    end
end
 H=fbrf;
subplot(1,4,3);imshow(H);
%%%%%%构建高斯带阻陷波滤波器%%%%%%

%%%%%%滤波%%%%%%
result = ifftshift(H.*F1);
G = ifft2(result);
out=abs(G);
out=out/max(out(:));%归一化[0,1]
subplot(1,4,4);imshow(out);
%%%%%%滤波%%%%%%
imwrite(out,'2.jpg');


