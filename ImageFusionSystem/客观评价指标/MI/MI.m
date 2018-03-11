function [mi] = MI(IMa,IMb)
%a=imread('oo.jpg');
%b=imread('lab2.gif');
%IMa=rgb2gray(a);
%IMb=rgb2gray(b);
IMa=double(IMa);
IMb=double(IMb);
[Ma,Na] = size(IMa);
[Mb,Nb] = size(IMb);
M=min(Ma,Mb);
N=min(Na,Nb);

%初始化直方图数组
hab = zeros(256,256);
ha = zeros(1,256);
hb = zeros(1,256);

%归一化
if max(max(IMa))~=min(min(IMa))
    IMa = (IMa-min(min(IMa)))/(max(max(IMa))-min(min(IMa)));
else
    IMa = zeros(M,N);
end

if max(max(IMb))-min(min(IMb))
    IMb = (IMb-min(min(IMb)))/(max(max(IMb))-min(min(IMb)));
else
    IMb = zeros(M,N);
end

IMa = double(int16(IMa*255))+1;
IMb = double(int16(IMb*255))+1;

%统计直方图
for i=1:M
    for j=1:N
       indexx =  IMa(i,j);
       indexy = IMb(i,j) ;
       hab(indexx,indexy) = hab(indexx,indexy)+1;%联合直方图
       ha(indexx) = ha(indexx)+1;%a图直方图
       hb(indexy) = hb(indexy)+1;%b图直方图
   end
end

%计算联合信息熵
hsum = sum(sum(hab));
index = find(hab~=0);
p = hab/hsum;
Hab = sum(sum(-p(index).*log(p(index))));

%计算a图信息熵
hsum = sum(sum(ha));
index = find(ha~=0);
p = ha/hsum;
Ha = sum(sum(-p(index).*log(p(index))));

%计算b图信息熵
hsum = sum(sum(hb));
index = find(hb~=0);
p = hb/hsum;
Hb = sum(sum(-p(index).*log(p(index))));

%计算a和b的互信息
mi = Ha+Hb-Hab;

%计算a和b的归一化互信息
mi1 = hab/(Ha+Hb); 
 
