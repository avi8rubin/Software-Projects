%% Lab 6 - Morphological
clear;clc;
pic1=imread('Apple.jpg');
pic1=im2bw(pic1);
figure(1)
subplot(1,4,1);
imshow(pic1)
title('Original picture');
grey = 150.0;

subplot(1,4,2);
[m,n]=size(pic1);
pic_3X1_Dilation=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        if pic1(i,j)==1
           for x=-3:3
                for y=-1:1
                   pic_3X1_Dilation(i+x,j+y) = 1;
                end
           end
        end
    end
end
imshow(pic_3X1_Dilation)
title('Setp 1 :Dilation 7X3 picture');
%%----------------------------------------
subplot(1,4,3);
[m,n]=size(pic_3X1_Dilation);
pic_7X7_Erosion=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        flag=0;
           for x=-1:1
                for y=-1:1
                    if pic_3X1_Dilation(i+x,j+y) == 1
                        flag=flag+1;
                    end                  
                end
           end 
           if flag==9
            pic_7X7_Erosion(i,j)=1;   
           end
    end
end
imshow(pic_7X7_Erosion)
title('Step 2: Erosion 7X7 picture');
%%----------------------------------------
subplot(1,4,4);
[m,n]=size(pic_3X1_Dilation);
pic_7X7_Erosion1=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        flag=0;
           for x=-1:1
                for y=-1:1
                    if pic_7X7_Erosion(i+x,j+y) == 1
                        flag=flag+1;
                    end                  
                end
           end 
           if flag==9
            pic_7X7_Erosion1(i,j)=1;   
           end
    end
end
imshow(pic_7X7_Erosion1)
title('Step 3: Erosion 3X3 picture');
