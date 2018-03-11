close all;clear all;clc;

%I = imread('p2.jpg');
[I,map] =  imread('p1.jpg');
J = imnoise(I , 'poisson' );

figure
imshow(J);
