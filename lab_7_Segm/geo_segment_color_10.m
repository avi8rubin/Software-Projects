%devide the image to nXm wondows
%n - the number of the windows(rows)
%m - the number of the windows(cols)
%beta - the shape parameter 
%Laplacian distribution beta =0.5, Gaussian PDF beta=1;
%mm-dimentionality of the probability space 
% for a color image mm=3 , for a gray image mm=1
clear all
clc

Im = imread('335.jpg');

n=5
m=5
beta=0.5;  %Laplacian distribution beta =0.5, Gaussian PDF beta=1;
mm=1;      % for a gray image mm=1, for a color image mm=3

Gr=rgb2gray(Im);
picture_size=size(Gr);

figure
subplot(1,2,1)
imshow(Im)
subplot(1,2,2)
imshow(Gr)

sig  =  devide_pict (Gr, n, m);

dist = geo_distance(sig, beta,mm);
save 335_c_5x5;

K = 4;
c = Pama_dist(dist,K);
SI = construct_matrix1(c, n, m, picture_size);
SIC= uint8(40*SI(:,:));
figure
imshow(SIC)
save 335c_5x5_pama_4