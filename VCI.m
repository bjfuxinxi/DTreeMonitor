clear all;clc;close all;
file_path = 'F:\images\';
image_name = 'DJI_0604.JPG';% 图像名
src =  imread(strcat(file_path,image_name));
figure;imshow(src);
gaus=fspecial('gaussian',3);%3指滤波半径
src=imfilter(src,gaus);
[nrows,ncols,~]=size(src);
src=im2double(src);
dst=zeros(nrows,ncols);
for i=1:nrows
    for j=1:ncols
        sum=src(i,j,1)+src(i,j,2)+src(i,j,3);
        r=src(i,j,1)/sum;
        g=src(i,j,2)/sum;
        b=src(i,j,3)/sum;
        dst(i,j)=3*r-2.4*g-b;
    end
end
dst=im2bw(dst,0);
dst2 = bwareaopen(dst,300,8);%删除二值图像BW中面积小于P的对象,conn邻域
figure;imshow(dst2);
%imwrite(dst2,[file_path,image_name(1:end-4),'-ct-P300.bmp']);