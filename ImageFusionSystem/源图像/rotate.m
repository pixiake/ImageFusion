close all;clear all;clc;

%I = imread('p2.jpg');
I=  imread('book2.jpg');
J = imrotate(I , 30 );

figure
imtool(J);
