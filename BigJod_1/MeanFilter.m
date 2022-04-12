girl=imread('lena_horiz_lines.bmp');  %读取原始图像
subplot(1,2,1);imshow(girl);title('原始图像'); 
girl_fft = fft(girl, [], 2);        %原始图像进行离散FFT变换
subplot(1,2,2);imshow(girl_fft);title('原始图像频谱图');   %显示原始频谱图
Find_Line=abs((girl_fft(:,2)-min(min(girl_fft)))/(max(max(girl_fft))-min(min(girl_fft)))); %定位干扰条纹所在的行
for i = 1 : 512
    if Find_Line(i)==0    %若是干扰条纹所在行数则进行处理
        for j = 1 : 512
           if i==1          %若是第一行用后两行预测出                girl_fft(i,j)=girl_fft(i+1,j)+girl_fft(i+1,j)-girl_fft(i+2,j); 
           elseif i==512    %若是最后一行用前两行预测出           girl_fft(i,j)=girl_fft(i-1,j)+girl_fft(i-1,j)-girl_fft(i-2,j);;            
           else               %其余的用邻近值预测出
                girl_fft(i,j)=(girl_fft(i+1,j)+girl_fft(i-1,j))/2;
           end
        end
    end
end  
figure;imshow(girl_fft);title('处理后的频谱图');     %显示处理后的频谱图
girl_fix=ifft(girl_fft,[],2);                          %进行FFT反变换 
figure;imshow(girl_fix,[0,255]);title('处理后的图像');   %显示处理后的图像
