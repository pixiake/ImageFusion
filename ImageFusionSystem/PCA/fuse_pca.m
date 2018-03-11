%基于PCA的图像融合
function [ Y ]=fuse_pca(x,y)
k=[x(:) y(:)];
%求X标准化的协差矩阵的特征根和特征向量
[V D] = eig(cov(k));
if (D(1,1) > D(2,2))
  a = V(:,1)./sum(V(:,1));
else 
  a = V(:,2)./sum(V(:,2));
end;

% and fuse
Y = a(1)*x+a(2)*y; 

% imshow(mat2gray(Y));