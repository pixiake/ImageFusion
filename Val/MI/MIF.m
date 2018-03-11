function [M] = MIF(A , B , F)

MIA = MI(A , F);
MIB = MI(B , F);

M = MIA + MIB;