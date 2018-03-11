function [U1 , O]= PCNN(IMA , IMB)
%����m-PCNN��ҽѧͼ���ں� MATLABԴ����
%IMA=double(imread('pepsi1.gif'));
%IMB=double(imread('pepsi2.gif'));
%IMA = double(imread('lab1.gif'));
%IMB = double(imread('lab2.gif'));
% clear all;
% clc;
% IMA = imread('ps1.jpg');
% IMB = imread('ps2.jpg');
if size(IMA,3)==3
    IMA = rgb2gray(IMA);
    IMB = rgb2gray(IMB);
end
IMA = double(IMA);
IMB = double(IMB);
[ROW,COL]=size(IMA);
[ROW1,COL1]=size(IMB);
if(ROW~=ROW1|COL~=COL1)
    error('input images should be the same size!');
end 

%%%% SET THE mPCNN PARAMEERS [7 IN TOTAL]
%%%% W=M; BETA1=BETA2; DELTA; ALPHAT; VT;
BETA=0.5;     %%% note BETA1=BETA2; SO WE USE BETA FOR CONVENIENCE
M=[0.707,1,0.707;1,0,1;0.707,1,0.707];
DELTA=1;
ALPHAT=0.012;
VT=4000;          %%% MAKE SURE WHETHER THIS IS RIGHT.
%%%%%

IMAWT=conv2(IMA,M,'same'); %%% ����󱣳�Դͼ���С��
IMBWT=conv2(IMB,M,'same');
SUMPIXEL=ROW*COL; %%% PIXELS NUMBER OF FUSED IMAGE
JUDFIR=zeros(ROW,COL); %%% JUDFIR IS USED TO JUDGE WHETHER THE NEURON(I,J) IS FIRED
                  %%%JUDFIR�����ж���Ԫ��i��j���Ƿ񼤷���ÿ����Ԫ�����еĵ�����ֻ����һ�Ρ�
THR=5000*ones(ROW,COL);     %%% ��֪����ֵ�Ƿ����
U=zeros(ROW,COL);
%%% ITERATION
ITETIME=10;      %%% SET ITERATION TIME
for(itime=1:10)
for(i=1:ROW)
   for(j=1:COL)
       if(JUDFIR(i,j)~=1)   %%% THE NEURON SHOULD NOT BE FIRED YET.
       %%% �Ե�����е�������
       HA=IMAWT(i,j)+IMA(i,j);
       HB=IMBWT(i,j)+IMB(i,j);
      U(i,j)=(1+BETA*HA)*(1+BETA*HB)+DELTA;
        %U(i,j)=BETA*HA*((1+BETA*HB)+DELTA);
       %%%�ж��Ƿ񼤷�
       if (U(i,j)>THR(i,j)) %% ���������򼤷�
           JUDFIR(i,j)=1;
       else             %% ������������ֵ����˥��
           THR(i,j)=THR(i,j)*exp(-ALPHAT);
       end
       end   %%% end of JUDFIR

   end %%% end j
end     %%% end i
       if(sum(sum(JUDFIR))==SUMPIXEL)
           fprintf(1,'fused successfully');
           break 
       end     
end    %%% end itime
O = U/max(max(U))*255;
U1=uint8(O);

% figure;imshow(uint8(U1));
%imwrite(uint8(U1),'P05.gif');
%end %%% end of function

%   M = MIF(IMA , IMB , U1);
%   Q = QF(IMA , IMB , U1);
%   AG = AG(U1 );
%   AG
%   M 
%   Q
