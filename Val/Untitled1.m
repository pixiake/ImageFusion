clear all;
close all;
tic;
X1 = imread('C:\Users\happy\Documents\MATLAB\clockA.jpg');
X2 = imread('C:\Users\happy\Documents\MATLAB\clockB.jpg');
FUSmean=wfusimg(X1,X2,'haar',3,'mean','max');
%���������ʱ
num2str(toc)
%��ͼ
figure
subplot(121), imshow(X1)
subplot(122), imshow(uint8(FUSmean))
%��Ϣ��
shang(uint8(FUSmean));
%�ܽ�����
ce=CERF(X1,uint8(FUSmean));
ce2=CERF(X2,uint8(FUSmean));
ss=ce^2+ce2^2;
ans=sqrt(ss/2)
%��ֵ
av=mean(mean(FUSmean))
i2=double(FUSmean);
%��׼��
bzcha=std(i2(:)) 
