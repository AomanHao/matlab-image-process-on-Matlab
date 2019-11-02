%% 程序分享 
% 西安邮电大学图像处理团队-郝浩
% 个人博客 www.aomanhao.top
% Github https://github.com/AomanHao
%--------------------------------------

clear
close all
clc
%% %%%%%%%%%%%%%%%图像%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I=imread('3096.jpg');

if size(I,3) == 3
   I=rgb2gray(I);
else
end
I=im2double(I);
figure;imshow(I);title('(a)原始图像')
imwrite(I,'1.jpg');
% I=I;%不加噪声
%I=imnoise(I,'speckle',deta_2);
% I=imnoise(I,'salt & pepper',0.05); %加噪图
% I=imnoise(I,'gaussian',0,0.01); % 加高斯噪声
figure;imshow(I);title('(b)加噪图像');
imwrite(I,'2.jpg');
[m,n]=size(I);

%% OTSU算法
[TGlobal]=graythresh(I);%计算阈值
gGlobal=im2bw(I,TGlobal);%分割图像
figure,imshow(gGlobal);title('ostu方法分割的图像');%采用全局阈值的结果
%% OTSU+局部阈值处理
g=localthresh(I,ones(3),30,1.5,'global');%执行局部阈值处理
SIG=stdfilt(I,ones(3));%stdfilt函数用于计算局部标准差
% SIG=im2bw(SIG);
%g=rgb2gray(g);
figure,imshow(SIG,[]);title('局部标准差图像');
figure,imshow(mat2gray(g));title('局部阈值处理的图像');%采用局部阈值的结果
%由结果比较可知，当背景接近常数，并且所有物体的灰度高于或低于背景灰度时，选择全局均值一般会得到较好的结果。
%但是对于背景和物体的灰度不是明显的分为两个层次时，采用局部均值更好。

