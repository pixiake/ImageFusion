
function result=shang(I)
%I=double(I);
[C,R]=size(I);      %��ͼ��Ĺ��
Img_size=C*R;       %ͼ�����ص���ܸ���
L=256;              %ͼ��ĻҶȼ�
H_img=0;
nk=zeros(L,1);
%%%%%%����ѭ�����Ը�Ϊһ��ѭ��
for i=0:255
    nk(i+1,1)=sum(sum(I==i));      %ͳ��ÿ���Ҷȼ����صĵ���
end
%%%%%%%%%%%%%%%%%%%
for k=1:L
    Ps(k)=nk(k)/Img_size;                  %����ÿһ���Ҷȼ����ص���ռ�ĸ���
    if Ps(k)~=0;                           %ȥ������Ϊ0�����ص�
    H_img=-Ps(k)*log2(Ps(k))+H_img;        %����ֵ�Ĺ�ʽ
    end
end
H_img
result=H_img;
end