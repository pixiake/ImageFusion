A = imread('5left.jpg');
B = imread('5right.jpg');
Ag = rgb2gray(A);
Bg = rgb2gray(B);
a = 0;
[height , width , z] = size(A);
OUT = zeros(height , width , z); 
A2 = zeros(height , width); 
B2= zeros(height , width); 
A3 = zeros(height , width); 
B3= zeros(height , width); 
while(a < pi)
       A1 = phase(Ag , a);
       B1 = phase(Bg , a);
  
      a = a + pi / 12;
      for m = 1 : height - 1
          for n = 1 : width - 1
               Af = (A1(m + 1 , n) - A1(m , n)) .^ 2 + (A1(m , n + 1) - A1(m , n)) .^ 2;
               Bf =  (B1(m + 1 , n) - B1(m , n)) .^ 2 + (B1(m , n + 1) - B1(m , n)) .^ 2;
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
                  OUT(i , j , :) = A(i , j , :);
              else
                  OUT(i , j , :) = B(i , j , :);
              end
    end
end

imshow(mat2gray(OUT));


