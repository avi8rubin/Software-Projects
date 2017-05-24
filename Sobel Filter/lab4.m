%% Lab 4 - Historgam
pic1=imread('house.jpg');
pic1=rgb2gray(pic1);
figure(1)
subplot(1,3,1);
imshow(pic1)
title('Original');
[m,n]=size(pic1);
pic1_Filter=pic1;
% %% p1 p2 p3
% %% p4 4 p5
% %% p6 p7 p8
% for i=2:m-1
%     for j=2:n-1
%         p1=pic1(i-1,j-1);
%         p2=pic1(i-1,j);
%         p3=pic1(i-1,j+1);
%         p4=pic1(i,j-1)*0;
%         p5=pic1(i,j+1)*0;
%         p6=pic1(i+1,j-1);
%         p7=pic1(i+1,j);
%         p8=pic1(i+1,j+1);
%         vector = [double(p1)*-1 double(p2)*-1 double(p3)*-1 double(p4)*0 double(p5)*0 double(p6) double(p7) double(p8)];
%         x_sum=sum(vector);
%         x_weight=(1/3)*x_sum;
%         x=uint8(x_weight);
%         pic1_Filter(i,j)=x;
%     end
% end
% subplot(1,3,2);
% imshow(pic1_Filter)
% title('Hx');
% pic2_Filter = pic1_Filter;
% for i=2:m-1
%     for j=2:n-1
%         p1=pic1(i-1,j-1);
%         p2=pic1(i-1,j);
%         p3=pic1(i-1,j+1);
%         p4=pic1(i,j-1)*0;
%         p5=pic1(i,j+1)*0;
%         p6=pic1(i+1,j-1);
%         p7=pic1(i+1,j);
%         p8=pic1(i+1,j+1);
%         vector = [double(p1)*-1  double(p4)*-1 double(p3) double(p5) double(p6)*-1  double(p8)];
%         x_sum=sum(vector);
%         x_weight=(1/3)*x_sum;
%         x=uint8(x_weight);
%         pic2_Filter(i,j)=x;
%     end
% end
% subplot(1,3,3);
% imshow(pic2_Filter);
% title('Hy');
% subplot(2,4,4);
% imshow(pic2_Filter+pic2_Filter/2);
% title('Hx+Hy');
 %% -----------------------  SOBEL Filter  -----------------------
 
 subplot(1,4,1);
imshow(pic1)
title('Original');
[m,n]=size(pic1);
pic1_Filter=pic1;
%% p1 p2 p3
%% p4 4 p5
%% p6 p7 p8
for i=2:m-1
    for j=2:n-1
        p1=pic1(i-1,j-1);
        p2=pic1(i-1,j);
        p3=pic1(i-1,j+1);
        p4=pic1(i,j-1)*0;
        p5=pic1(i,j+1)*0;
        p6=pic1(i+1,j-1);
        p7=pic1(i+1,j);
        p8=pic1(i+1,j+1);
        vector = [double(p1)*-1 double(p2)*-2 double(p3)*-1 double(p6) double(p7)*2 double(p8)];
        x_sum=sum(vector);
        x_weight=(1/4)*x_sum;
        x=uint8(x_weight);
        pic1_Filter(i,j)=x;
    end
end
subplot(1,4,2);
imshow(pic1_Filter)
title('Hx');
pic2_Filter = pic1_Filter;
for i=2:m-1
    for j=2:n-1
        p1=pic1(i-1,j-1);
        p2=pic1(i-1,j);
        p3=pic1(i-1,j+1);
        p4=pic1(i,j-1)*0;
        p5=pic1(i,j+1)*0;
        p6=pic1(i+1,j-1);
        p7=pic1(i+1,j);
        p8=pic1(i+1,j+1);
        vector = [double(p1)*-1  double(p4)*-2 double(p3) double(p5)*2 double(p6)*-1  double(p8)];
        x_sum=sum(vector);
        x_weight=(1/4)*x_sum;
        x=uint8(x_weight);
        pic2_Filter(i,j)=x;
    end
end
subplot(1,4,3);
imshow(pic2_Filter);
title('Hy');
subplot(1,4,4);
imshow(pic2_Filter+pic2_Filter/2);
title('Hx+Hy');


