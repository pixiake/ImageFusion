%����PCA��ͼ���ں�
function [ Y ]=fuse_pca(x,y)
k=[x(:) y(:)];
%��X��׼����Э����������������������
[V D] = eig(cov(k));
if (D(1,1) > D(2,2))
  a = V(:,1)./sum(V(:,1));
else 
  a = V(:,2)./sum(V(:,2));
end;

% and fuse
Y = a(1)*x+a(2)*y; 

% imshow(mat2gray(Y));