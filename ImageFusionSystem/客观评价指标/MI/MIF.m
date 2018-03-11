function [M] = MIF(A , B , F)

if size(A,3)==3
    A = rgb2gray(A);
    B = rgb2gray(B);
end

MIA = MI(A , F);
MIB = MI(B , F);

M = MIA + MIB;