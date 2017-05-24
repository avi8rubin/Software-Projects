%% Lab 6 - Morphological
clear;clc;
pic1=imread('text0.jpg');
pic1=im2bw(pic1);
figure(1)
subplot(1,3,1);
imshow(pic1)
title('Original picture');
%%----------------------------------------
subplot(1,3,2);
[m,n]=size(pic1);
pic_3X3_Dilation=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        if pic1(i,j)==1
           for x=-3:3
                for y=-3:3
                   pic_3X3_Dilation(i+x,j+y) = 1;
                end
           end
        end
    end
end
pic_7X7_Erosion=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        flag=0;
           for x=-3:3
                for y=-3:3
                    if pic_3X3_Dilation(i+x,j+y) == 1
                        flag=flag+1;
                    end                  
                end
           end 
           if flag==49
            pic_7X7_Erosion(i,j)=1;   
           end
    end
end
imshow(pic_7X7_Erosion)
title('Closing 7X7 picture');


%%----------------------------------------
[m,n]=size(pic1);
pic_7X7_Erosion=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        flag=0;
           for x=-3:3
                for y=-3:3
                    if pic1(i+x,j+y) == 1
                        flag=flag+1;
                    end                  
                end
           end 
           if flag==49
            pic_7X7_Erosion(i,j)=1;   
           end
    end
end
pic_3X3_Dilation=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        if pic_7X7_Erosion(i,j)==1
           for x=-3:3
                for y=-3:3
                   pic_3X3_Dilation(i+x,j+y) = 1;
                end
           end
        end
    end
end
subplot(1,3,3);
imshow(pic_7X7_Erosion)
title('Opening 7X7 picture');