A = imread('hourse.png');

Ag =rgb2gray(A);

a = 0;
[height , width , z] = size(A);

A2 = zeros(height , width); 



while(a < pi)
       A1 = phase(Ag , a);

      a = a + pi / 12;
      for m = 1 : height - 1
          for n = 1 : width - 1
               Af = (A1(m + 1 , n) - A1(m , n)) .^ 2 + (A1(m , n + 1) - A1(m , n)) .^ 2;
               if(Af > A2(m , n))
                   A2(m , n) = Af;
               end
          end
      end
end 
 figure(4);
 imshow(mat2gray(A2))

