%% lab7 - Boundary
clear;clc;
pic1=imread('capture.png');
pic1=im2bw(pic1);
figure(1)
subplot(2,3,1);
imshow(pic1)
title('Original picture');
%----------------------------------------
subplot(2,3,2);
[m,n]=size(pic1);
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
pic_7X7_Erosion=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        flag=0;
           for x=-1:1
                for y=-1:1
                    if pic1(i+x,j+y) == 1
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
title('Erosion 7X7 picture');


%%----------------------------------------
%set Diff
subplot(2,3,3);
pic_diff=zeros(m,n);
for i=1:m
    for j=1:n
       if pic1(i,j) ~= pic_7X7_Erosion(i,j)
         pic_diff(i,j)=255;
        end                  
    end
end
imshow(pic_diff)
title('A - Erostion(A)');

%%----------------------------------------

pic1=imread('rice.png');
pic1=im2bw(pic1);
figure(1)
subplot(2,3,4);
imshow(pic1)
title('Original picture');
%----------------------------------------
subplot(2,3,5);
[m,n]=size(pic1);
pic_7X7_Erosion=zeros(m,n);
for i=4:m-4
    for j=4:n-4
        flag=0;
           for x=-1:1
                for y=-1:1
                    if pic1(i+x,j+y) == 1
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
title('Erosion 7X7 picture');


%%----------------------------------------
%set Diff
subplot(2,3,6);
pic_diff=zeros(m,n);
for i=3:m
    for j=3:n
       if pic1(i,j) ~= pic_7X7_Erosion(i,j)
         pic_diff(i,j)=255;
        end                  
    end
end
imshow(pic_diff)