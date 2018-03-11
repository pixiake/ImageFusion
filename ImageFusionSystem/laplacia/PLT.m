function [OUT , O] = PLT(A , B)
% close all;
% clear all;
% clc;
% A = imread('ps1.jpg');
% B = imread('ps2.jpg');
if size(A,3)==3
    A = rgb2gray(A);
    B = rgb2gray(B);
end
A = double(A);
B = double(B);
%% �Ƚ��и�˹�������ֲ�
layer = 3;      % ����
h = [1 4 6 4 1;4 16 24 16 4; 6 24 36 24 6;4 16 24 16 4;1 4 6 4 1];
h = h/256;
G_A = cell(layer+1,1);
G_B = cell(layer+1,1);
T_imgA = A;
T_imgB = B;
G_A{1,1} = A;
G_B{1,1} = B;
for i=2:layer+1
  T_imgA  = imfilter(G_A{i-1,1},h,'conv','same');
  T_imgB  = imfilter(G_B{i-1,1},h,'conv','same');
  G_A{i,1} = T_imgA(2:2:end,2:2:end);
  G_B{i,1} = T_imgB(2:2:end,2:2:end);  
end
%%  ������˹�ֽ� 
L_A = cell(layer+1,1);
L_B = cell(layer+1,1);
for i=1:layer
    T_A1 = G_A{i,1};
    T_B1 = G_B{i,1};
    T_A2 = zeros(size(T_A1));
    T_B2 = zeros(size(T_B1));
    T_A2(2:2:end,2:2:end) = G_A{i+1,1};
    T_B2(2:2:end,2:2:end) = G_B{i+1,1};
    L_A{i,1} = 4*imfilter(T_A2,h,'conv','same');
    L_B{i,1} = 4*imfilter(T_B2,h,'conv','same');
    L_A{i,1} = T_A1 - L_A{i,1};
    L_B{i,1} = T_B1 - L_B{i,1};
end
 L_A{end,1} = cell2mat(G_A(end,1));
 L_B{end,1} = cell2mat(G_B(end,1));
 %% ͼ���ں�
 % ������˹�������Ķ����ں�
 diff_Ax =  diff([L_A{end,1} L_A{end,1}(:,end)],1,2);
 diff_Ay =  diff([L_A{end,1};L_A{end,1}(end,:)],1,1);
 diff_Bx =  diff([L_B{end,1} L_B{end,1}(:,end)],1,2);
 diff_By =  diff([L_B{end,1};L_B{end,1}(end,:)],1,1);
 diff_A = sqrt((diff_Ax.^2+diff_Ay.^2)/2);
 diff_B = sqrt((diff_Bx.^2+diff_By.^2)/2);
 diff_A = [diff_A(:,1) diff_A diff_A(:,end)];
 diff_A = [diff_A(1,:);diff_A;diff_A(end,:)];
 diff_B = [diff_B(:,1) diff_B diff_B(:,end)];
 diff_B = [diff_B(1,:);diff_B;diff_B(end,:)];
 A_G = im2col(diff_A,[3 3],'sliding');
 B_G = im2col(diff_B,[3 3],'sliding');
 A_G = sum(A_G,1)/4;
 B_G = sum(B_G,1)/4;
 ind = (A_G>=B_G);
 L_C = cell(layer+1,1);
 L_C{end,1}(ind) = L_A{end,1}(ind);
 L_C{end,1}(~ind) = L_B{end,1}(~ind);
 L_C{end,1} = reshape(L_C{end,1},size(L_A{end,1}));
 %%�������ں�
 ARE_A = cell(layer,1);
 ARE_B = cell(layer,1);
 h_w = [1 2 1;2 4 2;1 2 1]/16;
 for i=1:layer
     ARE_A{i,1} = imfilter(abs(L_A{i,1}),h_w,'conv','same');
     ARE_B{i,1} = imfilter(abs(L_B{i,1}),h_w,'conv','same');
 end
 for i=1:layer
     ind = (ARE_A{i,1}>=ARE_B{i,1});
     L_C{i,1}(ind) = L_A{i,1}(ind);
     L_C{i,1}(~ind) = L_B{i,1}(~ind);
     L_C{i,1} = reshape(L_C{i,1},size(L_A{i,1}));
 end
 %% ������˹�ؽ�
 G_C = cell(layer+1,1);
 G_C{end,1} = L_C{end,1}; 
 for i=layer:-1:1
     T_C1 = zeros(size(L_C{i,1}));
     T_C1(2:2:end,2:2:end) = G_C{i+1,1};
     G_C{i,1} = 4*imfilter(T_C1,h,'conv','same');
     G_C{i,1} = L_C{i,1}+G_C{i,1};
 end
 O = G_C{1,1};
 OUT = uint8(O);
%  imshow(uint8(G_C{1,1}));title('�ں�ͼ��');
 %imwrite(uint8(G_C{1,1}),'LP05.gif','gif');
%   M = MIF(A , B , G_C{1,1});
%   Q = QF(A , B , G_C{1,1});
%   AG = AG(G_C{1,1});
%   AG
%   M 
%   Q
  
% IM = MIF(A , B , G_C{1,1});
%{
His(A)
His(B)
His(uint8(G_C{1,1}))
var(A(:))
var(B(:))
var(G_C{1,1}(:))
%}