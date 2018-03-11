function [Q] = QF(A , B , F)

%[width , height] = size(A);
%A = imread('l1.jpg');
%B = imread('l2.jpg');
if size(A,3)==3
    A = rgb2gray(A);
    B = rgb2gray(B);
end
A = double(A);
B = double(B);
F = double(F);
[QAF , GA] = GAF00(A , F);
[QBF , GB] = GAF00(B , F);

Q = (sum(sum(QAF + QBF)) ./ sum(sum(GA + GB))) .* 1000000 ./ 5;