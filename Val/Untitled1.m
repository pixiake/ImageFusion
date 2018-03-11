clear all;
close all;
tic;
X1 = imread('C:\Users\happy\Documents\MATLAB\clockA.jpg');
X2 = imread('C:\Users\happy\Documents\MATLAB\clockB.jpg');
FUSmean=wfusimg(X1,X2,'haar',3,'mean','max');
%计算程序用时
num2str(toc)
%画图
figure
subplot(121), imshow(X1)
subplot(122), imshow(uint8(FUSmean))
%信息熵
shang(uint8(FUSmean));
%总交叉熵
ce=CERF(X1,uint8(FUSmean));
ce2=CERF(X2,uint8(FUSmean));
ss=ce^2+ce2^2;
ans=sqrt(ss/2)
%均值
av=mean(mean(FUSmean))
i2=double(FUSmean);
%标准差
bzcha=std(i2(:)) 
