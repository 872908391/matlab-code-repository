#include<iostream>
#include "opencv2/highgui.hpp" //视频和图像捕获接口
#include "opencv2/imgproc.hpp" //用于线性和非线性的图像处理模块图像滤波、几何图像变换、色彩空间转换等
#include "opencv2/opencv.hpp"
#include<stdio.h>
#include<vector>

using namespace std;
using namespace cv;

int main(int argc, char** argv)
{
    Mat image, image1;//一个基本的图像容器
    image = imread("G:/Storage/Code/Graphics/CoinDetection/1.5.jpg", IMREAD_GRAYSCALE);//2.png 1.jpg
    image1 = imread("G:/Storage/Code/Graphics/CoinDetection/1.5.jpg");
    if (image.empty()) {
        printf("Error,could not read image\n");
        return -1;
    }
    Mat imageBlur;
    GaussianBlur(image, imageBlur, Size(13,13),2);//高斯模糊
    // imwrite("E:/desktop/Blur13_2.png", imageBlur);
    Mat imageCanny;
    Canny(imageBlur, imageCanny, 50,143);//canny边缘检测
    // imwrite("E:/desktop/Canny50_143.png", imageCanny);

    vector<Vec3f> circles;
    HoughCircles(imageCanny, circles, HOUGH_GRADIENT, 1, 1100);//hough变换圆检测

    cout << "单位:pixel" << endl;
    for (size_t i = 0; i < circles.size(); i++)//输出圆心与半径
    {
        cout << "圆心为(" << circles[i][0] << "," << circles[i][1] << ")" << "半径为" << circles[i][2] << endl;//
    }

    Mat display = image1.clone();//画出圆所在的范围
    for (size_t i = 0; i < circles.size(); i++)
    {
        Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
        int radius = cvRound(circles[i][2]);
        // circle center
        circle(display, center, 3, Scalar(0, 255, 0), -1, 8, 0);
        // circle outline
        circle(display, center, radius, Scalar(0, 0, 255), 3, 8, 0);
    }
    // imwrite("E:/desktop/Hough1_1100.png", display);
    Mat dstImage1, dstImage2, dstImage3;
    resize(imageBlur, dstImage1, Size(imageBlur.cols / 5, imageBlur.rows / 5), 0, 0, INTER_LINEAR);
    resize(imageCanny, dstImage2, Size(imageCanny.cols / 5, imageCanny.rows / 5), 0, 0, INTER_LINEAR);
    resize(display, dstImage3, Size(display.cols / 5, display.rows / 5), 0, 0, INTER_LINEAR);
    // namedWindow("input",WINDOW_NORMAL);//自适应窗口
    imshow("original", dstImage1);
    imshow("canny", dstImage2);
    imshow("display", dstImage3);
    waitKey(0);//停滞时间
    // HoughCircles
    // destroyAllWindows();//销毁窗口
    return 0;
}