%A= double(rgb2gray(imread('l1.jpg')));
%B= double(rgb2gray(imread('l2.jpg')));
%{
V= [-0.0004 -0.0103 -0.0274 -0.0103 -0.0004;
       -0.0103 -0.1256 -0.0760 -0.1256 -0.0103;
       -0.0274 -0.0760  1.0000  -0.0760 -0.0274;
       -0.0103 -0.1256 -0.0760 -0.1256  -0.0103;
       -0.0004 -0.0103 -0.0274 -0.0103 -0.0004
      ];
%}
%{
   A5 = conv2(A , V ,'same');
 B5 = conv2(B , V ,'same');
 figure(1)
  imshow(mat2gray(C));
  figure(2)
  imshow(mat2gray(D));
%}
A = imread('5left.jpg');
B = imread('5right.jpg');
if size(A,3)==3
    A11 = rgb2gray(A);
    B11 = rgb2gray(B);
end
A11 = double(A11);
B11 = double(B11);
C = mat2gray((A11 + B11) ./ 2);
L = demo(C);
a = 0;
[height , width , rgb] = size(A);
OUT = zeros(height , width); 
OUT1 = zeros(height , width , rgb); 
A2 = zeros(height , width); 
B2= zeros(height , width); 
A3 = zeros(height , width); 
B3= zeros(height , width); 
O3= zeros(height , width); 

while(a < pi)
       A1 = phase(A11 , a);
       B1 = phase(B11 , a);
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
%C = (A2 + B2) ./ 2;
%L = demo(C);
%{
for m = 1 : height - 1
                  for n = 1 : width - 1
                       A2(m , n) = (A(m + 1 , n) - A(m , n)) .^ 2 + (A(m , n + 1) - A(m , n)) .^ 2;
                       B2(m ,n) =  (B(m + 1 , n) - B(m , n)) .^ 2 + (B(m , n + 1) - B(m , n)) .^ 2;
                  end
end
%}
k = 0;
while(k < 300)
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
                        OUT1(i , j , :) = A(i , j , :);
                  end
               end
           end
    else
         for i = 1 : height
               for j = 1 : width
                  if(L(i , j) == k);
                        OUT1(i , j , :) = B(i , j , :);
                  end
               end
         end
    end
    k = k + 1;
end
imtool(mat2gray(OUT1));
imtool( '5left.jpg');
imtool('5right.jpg')
    %{
for m = 1 : height - 1
                  for n = 1 : width - 1
                       A3(m , n) = (A(m + 1 , n) - A(m , n)) .^ 2 + (A(m , n + 1) - A(m , n)) .^ 2;
                       B3(m ,n) =  (B(m + 1 , n) - B(m , n)) .^ 2 + (B(m , n + 1) - B(m , n)) .^ 2;
                  end
        end
%}
%{
for i = 1 : height
    for j = 1 : width
              if(A2(i , j)  > B2(i , j))
                  OUT(i , j) = A(i , j);
              elseif(A2(i , j)  < B2(i , j))
                  OUT(i , j) = B(i , j);
              else OUT(i , j) = (A(i , j) + B(i ,j)) ./ 2;
              end
    end
end
   %{
      A5 = conv2(A , V ,'same');
    
    B5 = conv2(B , V ,'same');
    O3 = conv2(OUT , V ,'same');  
    for i = 1 : height
         for j = 1 : width
              if(O3(i , j) - A5(i , j) < O3(i , j) - B5(i , j))
                  OUT1(i , j) = A(i , j); 
              else
                  OUT1(i , j) = B(i , j);
              end
         end
     end
    %}
O1 = mat2gray(A2);

O2 = mat2gray(B2);
figure(1)
imtool(A2);
figure(2)
imtool(O2)
%}