function [C1 ,  C]= PCA(A , B)
%A = double(imread('lab1.gif'));
%B = double(imread('lab2.gif'));
% clear all;
% clc;
 %A = imread('l1.jpg');
 %B = imread('l2.jpg');
if size(A,3)==3
    A = rgb2gray(A);
    B = rgb2gray(B);
end
A = double(A);
B = double(B);
%A = double(rgb2gray(imread('lab11.jpg')));
%B = double(rgb2gray(imread('lab22.jpg')));
C = fuse_pca(A , B);
C1 = mat2gray(C);

%imwrite(uint8(C),'PCA05.gif');

  %M = MIF(A , B , C);
%   Q = QF(A , B , C);
%AG = AG(C);
%AG
   %M 
%   Q
