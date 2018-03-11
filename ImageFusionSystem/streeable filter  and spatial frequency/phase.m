function [IG] = phase(X , a)

%I = double(rgb2gray(imread('1.png')));
I = double(X);
%[height , width] = size(I);
%arg0 =  zeros(height , width);
%arg1 =  zeros(width , height );
%Fr = zeros(width , height );
%Fr0 = zeros(width , height);

%IG = zeros(width,height);
%IH = zeros(width,height);
%G = ones(width,height);
%H = zeros(width,height);
%a  = 0;
%n = 0;
   [G0] = GH(a);

         
   IG = conv2(I , G0 , 'same');
  % IH = conv2(I , H0 , 'same');
   
   
       %  G = G +  IG;
         %a = a + pi ./ 36;
       %  n = n + 1;
 %{
 for i = 1 : height
        for j = 1 : width     
              A = abs(atan(IH(i , j) ./ IG(i , j)));  
              if(A > arg0(i , j))
                  arg0(i , j) = A;
              else arg0(i , j) = arg0(i , j);
              end
        end
 end
  %  n = n + 1;
%}
%end
%figure(1)
%T = mat2gray(abs(G));
%imtool(T);
%Fr0 = G;
  

