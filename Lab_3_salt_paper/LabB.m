%% Lab 3 - Noise Salt & paper 
clear all
clc

pic1=imread('lena.jpg');
pic1=rgb2gray(pic1);
pic2=imread('S&Pnoise3.jpg');
% pic1=rgb2gray(pic2);
pic3=imread('plane_noise2.png');
% pic1=rgb2gray(pic3);
figure(1)
subplot(2,2,1);
imshow(pic1)
title('Original Picture')
subplot(2,2,2);
%% Median Filter

%% p1 p2 p3
%% p4 4 p5
%% p6 p7 p8

%% 1 2 1
%% 2 4 2
%% 1 2 1
%% 1/16 * avg ( p1 + 2*p2 + p3 + 2*p4 + 4*p10 + 2*p5 + p6 + 2*p7  + p8)
[m,n]=size(pic1);
pic1_wehit_Filter=pic1;
for i=2:m-1
    for j=2:n-1
        p1=pic1(i-1,j-1);
        p2=pic1(i-1,j);
        p2=double(p2);
        p2=2*p2;
        p3=pic1(i-1,j+1);
        p4=pic1(i,j-1);
        p4=double(p4);
        p4=2*p4;
        p10=pic1(i,j);
        p10=double(p10);
        p10=4*p10;
        p5=pic1(i,j+1);
        p5=double(p5);
        p5=p5*2;
        p6=pic1(i+1,j-1);
        p7=pic1(i+1,j);
        p7=double(p7);
        p7=2*p7;
        p8=pic1(i+1,j+1);
        vector = [double(p1) double(p2) double(p3) double(p4) double(p10) double(p5) double(p7) double(p8)];
        x_sum=sum(vector);
        x_weight=(1/16)*x_sum;
        x=uint8(x_weight);
        pic1_wehit_Filter(i,j)=x;
    end
end
imshow(pic1_wehit_Filter)
title('Weight Cross Filter')
subplot(2,2,3);
imshow(pic1)
title('Original Picture')
subplot(2,2,4);
%% Median Filter

pic1_Median_Cross_Filter=pic1;
for i=2:m-1
    for j=2:n-1   
        p2=pic1(i-1,j);       
        p4=pic1(i,j-1);
        p5=pic1(i,j+1);       
        p7=pic1(i+1,j);     
        vector = [p2 p4 p5 p7];
        x=median(vector);
        pic1_Median_Cross_Filter(i,j)=x;
    end
end
imshow(pic1_Median_Cross_Filter)
title('Median Croess Filter')


