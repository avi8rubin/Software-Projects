%% lab 8- main
clear;
clc;
pic1=imread('335.jpg');
rgb=imread('335.jpg');
figure();
imshow(rgb);
pic1 =rgb2gray(pic1);
picture_size = size(pic1);
row = 5;
col = 5;

beta=0.5;  %Laplacian distribution beta =0.5, Gaussian PDF beta=1;
mm=1;      % for a gray image mm=1, for a color image mm=3

Sigma = zeros(row*col,3);
[m,n]=size(pic1);
x = floor(m/row);
y = floor(n/col);
index=1;
figure();
for i=0:row-1
    for j=0:col-1
      mat = pic1(x*i+1 : x*i+x, y*j+1:y*j+y);
      [LL,HL,LH,HH] = wallel(mat);
      HL = double(HL);
      LH = double(LH);
      HH = double(HH);
      sigH = correlation (HL);
      sigV = correlation(LH);
      sigD = correlation(HH);
      Sigma(index,:) = sigH,sigV,sigD;
      subplot(row,col,index);
      imshow(mat);
      hold on
      index=index+1;
    end
end

dist = geo_distance(Sigma, beta,mm);
save 335_c_5x5;
[mx,nx,uuu] = size(rgb);
rgbC = zeros(mx,nx,3);
K = 4;
c = Pama_dist(dist,K);

[m,n] =size(rgb);
n=n/3;
result = zeros(m,n);

index=1;
ii1=0;
for i=1:m-1
    for j=1:n-1
        x1 =floor( i/x);
        y1 =floor( j/y);
        ii1 = int8(x1*5+y1);
        result(i,j) = c(ii1+1);

    end
end
rgb1=zeros(m,n,3);
for i=1:m-1
    for j=1:n-1
         if( result(i,j)==1)
           rgb1(i,j,1) =0;
           rgb1(i,j,2) =rgb(i,j,2)/8;
           rgb1(i,j,3) =rgb(i,j,3)/8;
         end
          if( result(i,j)==2)
           rgb1(i,j,1) = rgb(i,j,1);
           rgb1(i,j,2) = rgb(i,j,1);
           rgb1(i,j,3) =rgb(i,j,3);
          end
         if( result(i,j)==3)
            rgb1(i,j,1) =rgb(i,j,1);
           rgb1(i,j,2) =rgb(i,j,2);
           rgb1(i,j,3) =0;
         end
         if( result(i,j)==4)
            rgb1(i,j,1) =rgb(i,j,1);
           rgb1(i,j,2) =rgb(i,j,2);
           rgb1(i,j,3) =rgb(i,j,3);
         end
    end
end
figure
 imshow(uint8(rgb1));


