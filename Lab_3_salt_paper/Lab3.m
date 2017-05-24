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
subplot(2,3,1);
imshow(pic1)
title('Original Picture')
subplot(2,3,2);
%% Median Filter
[m,n]=size(pic1);
pic1_Median_Filter=pic1;
for i=2:m-1
    for j=2:n-1
        p1=pic1(i-1,j-1);
        p2=pic1(i-1,j);
        p3=pic1(i-1,j+1);
        p4=pic1(i,j-1);
        p5=pic1(i,j+1);
        p6=pic1(i+1,j-1);
        p7=pic1(i+1,j);
        p8=pic1(i+1,j+1);
        vector = [p1 p2 p3 p4 p5 p6 p7 p8];
        x=median(vector);
        pic1_Median_Filter(i,j)=x;
    end
end
imshow(pic1_Median_Filter)
title('Median 3X3 Filter')
subplot(2,3,3);
%% Avg Filter
imshow(pic1)
pic1_Mean_Filter=pic1;
title('Average 3X3 Filter')
for i=2:m-1
    for j=2:n-1
        p1=pic1(i-1,j-1);
        p2=pic1(i-1,j);
        p3=pic1(i-1,j+1);
        p4=pic1(i,j-1);
        p5=pic1(i,j+1);
        p6=pic1(i+1,j-1);
        p7=pic1(i+1,j);
        p8=pic1(i+1,j+1);
        vector = [p1 p2 p3 p4 p5 p6 p7 p8];
        x=mean(vector);
        pic1_Mean_Filter(i,j)=x;
    end
end
subplot(2,3,4);
imshow(pic1)
title('Original Picture')
subplot(2,3,5);
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
subplot(2,3,6);
%% Avg Filter
pic1_Mean_Cross_Filter=pic1;
for i=2:m-1
    for j=2:n-1
    
        p2=pic1(i-1,j);
            
        p4=pic1(i,j-1);
        p5=pic1(i,j+1);
        
        p7=pic1(i+1,j);
        
        vector = [p2 p4 p5 p7];
        x=mean(vector);
        pic1_Mean_Cross_Filter(i,j)=x;
    end
end
imshow(pic1_Median_Cross_Filter)
title('Average Croess Filter')
