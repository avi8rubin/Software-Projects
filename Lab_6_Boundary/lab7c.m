%% Lab 7 -c
%%----------------------------------------

clear;clc;
pic1=imread('avi.png');
rgbPic = pic1;
gary2 = rgb2gray(pic1);
pic2=im2bw(pic1);
figure(1)
subplot(2,3,1);
imshow(pic1);
title('Original picture');
subplot(2,3,2);
pic1=rgb2gray(pic1);
GrayFinal=pic1;
imshow(pic1);
title('B&W picture');

[m,n]=size(pic2);
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
                    if pic2(i+x,j+y) == 1
                        flag=flag+1;
                    end                  
                end
           end 
           if flag==9
            pic_7X7_Erosion(i,j)=1;   
           end
    end
end

%%----------------------------------------
%set Diff
subplot(2,3,3);
pic_diff=zeros(m,n);
for i=1:m
    for j=1:n
       if pic2(i,j) ~= pic_7X7_Erosion(i,j)
         pic_diff(i,j)=1;
        end                  
    end
end
imshow(pic_diff)
title('A - Erostion(A)');

%---------------------------
%% Left To Right
subplot(2,3,4);
for i=3:m
    for j=3:n
       if pic_diff(i,j) ==1
           break
       else
         GrayFinal(i,j) = 0;  
       end                
    end
end


%% Right To Left
for i=3:m
    for j=n:-1:3
       if pic_diff(i,j) ==1
           break
       else
         GrayFinal(i,j) = 0;  
       end                
    end
end
imshow(GrayFinal)

%% Top To down
subplot(2,3,5);
for i=3:m
    for j=3:n
       if pic_diff(j,i) ==1
           break
       else
         GrayFinal(j,i) = 0;  
       end                
    end
end
imshow(GrayFinal)
title('Final BW');

subplot(2,3,6);
% Top To down
for i=3:m
    for j=3:n
       if GrayFinal(i,j) ==0         
         rgbPic(i,j,1) = 0;  
         rgbPic(i,j,2) = 0; 
         rgbPic(i,j,3) = 0; 
       end                
    end
end
imshow(rgbPic)
title('Final Color');


