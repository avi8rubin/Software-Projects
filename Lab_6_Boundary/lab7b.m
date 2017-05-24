%% lab 7-b - Leaf
%%----------------------------------------

clear;clc;
pic1=imread('leaf.png');
gary2 = rgb2gray(pic1);
figure(1)
subplot(2,3,1);
imshow(pic1);
pic1=rgb2gray(pic1);
GrayPic=pic1;

title('Original picture');
%----------------------------------------
subplot(2,3,2);
imshow(pic1);
title('Grey picture');
[m,n]=size(pic1);
subplot(2,3,4);
pic_BW=zeros(m,n);

for i=1:m
    for j=1:n
       if pic1(i,j) < 250
         pic_BW (i,j) = 254;
        end                  
    end
end
pic_BW1 =pic_BW ;
imshow(pic_BW1);
title('Black&White picture');
pic_BW2 = im2bw(pic_BW1);
subplot(2,3,3);
for i=1:m
    for j=2:n
       if pic_BW2(i,j) ==1
         pic_BW2 (i,j)=0;
       else
           pic_BW2 (i,j)=1;
        end                  
    end
end
imshow(pic_BW2);
title('Black&White R picture');
for i=1:m
    for j=2:n
       if GrayPic(i,j) > 220
         GrayPic(i,j) = 0;
        end                  
    end
end
subplot(2,3,5);

imshow(GrayPic);
title('Gary picture');


%%--------------------------------------------

pic_7X7_Erosion=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        flag=0;
           for x=-1:1
                for y=-1:1
                    if pic_BW2(i+x,j+y) == 1
                        flag=flag+1;
                    end                  
                end
           end 
           if flag==9
            pic_7X7_Erosion(i,j)=1;   
           end
    end
end
title('Erosion 7X7 picture');


%%----------------------------------------
%set Diff
subplot(2,3,6);
pic_diff=zeros(m,n);
for i=1:m
    for j=1:n
       if pic_BW2(i,j) ~= pic_7X7_Erosion(i,j)
         pic_diff(i,j)=255;
        end                  
    end
end
imshow(pic_diff)
title('A - Erostion(A)');





