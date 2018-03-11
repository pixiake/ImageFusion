clear all;
A = imread('l1.jpg');
B = imread('l2.jpg');
if size(A,3)==3
    A = rgb2gray(A);
    B = rgb2gray(B);
end
A = double(A);
B = double(B);
C = (A + B) ./ 2;
L = demo(C);
a = 0;
[height , width] = size(A);
OUT = zeros(height , width); 
OUT1 = zeros(height , width); 
OUT2 = zeros(height , width); 
A2 = zeros(height , width); 
B2= zeros(height , width); 
A3 = zeros(height , width); 
B3= zeros(height , width); 
O3= zeros(height , width); 


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
  
end

%{
for i = 1 : height - 1
    for j = 1 :  width-1
         A2(i , j) = (A(i + 1 , j) -A(i , j)) .^ 2 +(A(i , j + 1) - A(i , j)) .^2;
         B2(i , j) = (B(i + 1 , j) -B(i , j)) .^ 2 +(B(i , j + 1) - B(i , j)) .^2;
    end
end
%}
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
                        OUT(i , j) = A(i , j);
                  end
               end
           end
    else
         for i = 1 : height
               for j = 1 : width
                  if(L(i , j) == k);
                        OUT(i , j) = B(i , j);
                  end
               end
         end
    end
    k = k + 1;
end
OUT1 = mat2gray(OUT);
imtool(OUT1);
VV = MIF(A , B , OUT);
V = QF(A , B , OUT);
VV
V

  