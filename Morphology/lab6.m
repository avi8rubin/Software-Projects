%% Lab 6 - Morphological
clear;clc;
pic1=imread('01.png');
pic1=im2bw(pic1);
figure(1)
subplot(2,3,1);
imshow(pic1)
title('Original picture');
grey = 150.0;
h1=7;
h2=7;
x1=int8((-1*(h1))/2)+1;
x2=int8(((h1))/2)-1;
y1=int8((-1*(h2))/2)+1;
y2=int8(((h2))/2)-1;
%%----------------------------------------
subplot(2,3,2);
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
imshow(pic_3X3_Dilation)
title('Dilation 7X7 picture');
%%----------------------------------------
subplot(2,3,3);
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
title('Dilation 7X3 picture');
%%----------------------------------------
subplot(2,3,4);
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
imshow(pic_7X7_Erosion)
title('Erosion 7X7 picture');
%%----------------------------------------
subplot(2,3,5);
[m,n]=size(pic1);
pic_7X3_Erosion=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        flag=0;
           for x=-3:3
                for y=-1:1
                    if pic1(i+x,j+y) == 1
                        flag=flag+1;
                    end                  
                end
           end 
           if flag==21
            pic_7X3_Erosion(i,j)=1;   
           end
    end
end
imshow(pic_7X3_Erosion)
title('Erosion 7X7 picture');
%%----------------------------------------
% figure(2)
% subplot(1,3,1);
% imshow(pic1)
% title('Original Picture');
% %%----------------------------------------
% subplot(1,3,2);
% [m,n]=size(pic1);
% pic_3X3_Dilation=zeros(m,n);
% for i=4:m-4
%     for j=4:n-4
%         if pic1(i,j)==1
%            for x=-3:3
%                 for y=-3:3
%                    pic_3X3_Dilation(i+x,j+y) = 1;
%                 end
%            end
%         end
%     end
% end
% 
% for i=4:m-4
%     for j=4:n-4
%         flag=0;
%            for x=-3:3
%                 for y=-3:3
%                     if pic_3X3_Dilation(i+x,j+y) == 1
%                         flag=flag+1;
%                     end                  
%                 end
%            end 
%            if flag==49
%             pic_7X7_Erosion(i,j)=1;   
%            end
%     end
% end
% imshow(pic_7X7_Erosion)
% title('Closing 7X7 picture');