clear all;clc;
A = imread('clockA.jpg');
B = imread('clockB.jpg');
if size(A,3)==3
    A = rgb2gray(A);
    B = rgb2gray(B);
end
A = double(A);
B = double(B);

a = 0;
[height , width] = size(A);
OUT = zeros(height , width); 

OUT2 = zeros(height , width); 
A2 = zeros(height , width); 
B2= zeros(height , width); 
A3 = zeros(height , width); 
B3= zeros(height , width); 
while(a < pi)
       A1 = phase(A , a);
       B1 = phase(B , a);
      a = a + pi / 12;
      for m = 1 : height - 1
          for n = 1 : width - 1
               Af = (A1(m + 1 , n) - A1(m , n)) .^ 2 + (A1(m , n + 1) - A1(m , n)) .^ 2 + (A1(m + 1 , n + 1) - A1(m , n)) .^ 2;
               Bf =  (B1(m + 1 , n) - B1(m , n)) .^ 2 + (B1(m , n + 1) - B1(m , n)) .^ 2 + (B1(m + 1 , n + 1) - B1(m , n)) .^ 2;
               if(Af > A2(m , n))
                   A2(m , n) = Af;
               end
               if(Bf > B2(m , n))
                   B2(m , n) = Bf;
               end
          end
      end
   
        for m = 1 : height - 1
                  for n = 1 : width - 1
                       A3(m , n) = (A(m + 1 , n) - A(m , n)) .^ 2 + (A(m , n + 1) - A(m , n)) .^ 2;
                       B3(m ,n) =  (B(m + 1 , n) - B(m , n)) .^ 2 + (B(m , n + 1) - B(m , n)) .^ 2;
                  end
        end
end

for i = 1 : height
    for j = 1 : width
              if(A2(i , j)  > B2(i , j) || (A2(i , j) == B2(i , j) && A3(i , j) > B3(i , j)) || (A2(i , j) == B2(i , j) && A3(i , j) == B3(i , j) && A(i , j) > B(i , j)))
                  OUT(i , j) = A(i , j);
              else
                  OUT(i , j) = B(i , j);
              end
    end
end
%imwrite(uint8(OUT),'OUR05.gif
%figure(1);imshow(imread('8right.jpg'));
%figure(2);imshow(imread('8left.jpg'));
%figure(3);imshow(mat2gray(OUT));
% M = MIF(A , B , OUT);
 %Q = QF(A , B , OUT);
O = OUT;
OUT1 = mat2gray(O);
imtool(OUT1);
MI0 = MIF(A , B , O);
QF0 = QF(A , B , O);
L = demo(O);
k = 0;
while(k < 250)
    p = 0;
    q = 0;
    for i = 1 : height
        for j = 1 : width
              if(L(i , j) == k);
              p = p + A2(i , j);
              q = q + B2(i , j);
              end
        end
    end
    if(p > q)
           for i = 1 : height
               for j = 1 : width
                  if(L(i , j) == k);
                        OUT2(i , j) = A(i , j);
                  end
               end
           end
    else
         for i = 1 : height
               for j = 1 : width
                  if(L(i , j) == k);
                        OUT2(i , j) = B(i , j);
                  end
               end
         end
    end
    k = k + 1;
end
MI1 = MIF(A , B , OUT2);
QF1 = QF(A , B , OUT2);
OUT2 = mat2gray(OUT2);
imtool(OUT2);
