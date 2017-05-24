%Lab 1 4 Filter
clear all
clc

rgb=imread('monkey1.jpg');
%% Cut Picture to small size 
gray_image = rgb2gray(rgb);
binary_image = im2bw(gray_image);
row = size(rgb,1);
col = size(rgb,2);
top=0;
firsttime=1;
button=0;
right=0;
left=0;
L=rgb2gray(rgb);
%find top and button
for i=1:row
    for j=1:col
       if L(i,j)~=255
           if firsttime == 1
                firsttime=0;
                top = i;
           else
                button = i;
           end
       end
    end
end
firsttime=1;
%find Left and Right
for i=1:col
    for j=1:row
       if L(j,i)~=255
           if firsttime == 1
                firsttime=0;
                left = i;
           else
                right = i;
           end
       end
    end
end

newrgb = rgb(top+17:button-11 , left+8:right-11,:);
%% Split picture to 3 color matrix
figure
row = size(newrgb,1);
col = size(newrgb,2);
RedMatrix = newrgb(:,:,1);
GreenMatrix = newrgb(:,:,2);
BlueMatrix = newrgb(:,:,3);
i=zeros(row,col);
red=cat(3,RedMatrix,i,i);
green=cat(3,i,GreenMatrix,i);
blue=cat(3,i,i,BlueMatrix);
final = newrgb;
for i=row/2:row
    for j=col/2:col
        for k=1:3
      final(i,j,k) = blue(i,j,k); 
        end
    end
end
for i=1:row/2
    for j=col/2:col
        for k=1:3
      final(i,j,k) = red(i,j,k); 
        end
    end
end
for i=row/2:row
    for j=1:col/2
        for k=1:3
      final(i,j,k) = green(i,j,k); 
        end
    end
end
% final(1:row/2,1:col/2,:) = newrgb(1:row/2,1:col/2,:);

imshow(final)
