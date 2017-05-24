%% Lab 3 - Noise Salt & paper 
clear all
clc

pic1=imread('S&Pnoise_Lena.png');
pic1=rgb2gray(pic1);
pic2=imread('S&Pnoise3.jpg');
% pic1=rgb2gray(pic2);
pic3=imread('plane_noise2.png');
pic1=rgb2gray(pic3);
figure(1)
subplot(2,2,1);
imshow(pic1)
title('Original Picture')
subplot(2,2,2);
%% Median Filter
%% p1 p2 p3 p4 p5
%% p6 p7 p8 p9 p10
%% p11 p12  i,j p13 p14
%% p15 p16 p17 p18 p19
%% p20 p21 p22 p22 p24
[m,n]=size(pic1);
pic1_Median_Filter=pic1;
for i=3:m-2
    for j=3:n-2
        p1=pic1(i-2,j-2);
        p2=pic1(i-2,j-1);
        p3=pic1(i-2,j);
        p4=pic1(i-2,j+1);
        p5=pic1(i-2,j+2);
        
        p6=pic1(i-1,j-2);
        p7=pic1(i-1,j-1);
        p8=pic1(i-1,j);
        p9=pic1(i-1,j+1);
        p10=pic1(i-1,j+2);
        
        p11=pic1(i,j-2);
        p12=pic1(i,j-1);
        p13=pic1(i,j+1);
        p14=pic1(i,j+2);
        
        p15=pic1(i+1,j-2);
        p16=pic1(i+1,j-1);
        p17=pic1(i+1,j);
        p18=pic1(i+1,j+1);
        p19=pic1(i+1,j+2);
        
        p20=pic1(i+2,j-2);
        p21=pic1(i+2,j-1);
        p22=pic1(i+2,j);
        p23=pic1(i+2,j+1);
        p24=pic1(i+2,j+2);
        
        vector = [p1 p2 p3 p4 p5 p6 p7 p8 p9 ...
            p10 p11 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24];
        x=median(vector);
        pic1_Median_Filter(i,j)=x;
    end
end
imshow(pic1_Median_Filter)
title('Median 5X5 Filter')
subplot(2,2,3);
imshow(pic1)
title('Original Picture')
subplot(2,2,4);
%% Median Filter

pic1_Median_Cross_Filter=pic1;
for i=3:m-2
    for j=3:n-2
        p3=pic1(i-2,j);
        p8=pic1(i-1,j);
        p11=pic1(i,j-2);
        p12=pic1(i,j-1);
        p13=pic1(i,j+1);
        p14=pic1(i,j+2);
        p17=pic1(i+1,j);
        p22=pic1(i+2,j);
        
        vector = [p3 p8 p11 p13 p14  p17  p22 ];
        x=median(vector);
        pic1_Median_Cross_Filter(i,j)=x;
    end
end
imshow(pic1_Median_Cross_Filter)
title('Median Croess 5X5 Filter')


