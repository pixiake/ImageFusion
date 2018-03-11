clear all;clc;
A = imread('l1.jpg');
B = imread('l2.jpg');
if size(A,3)==3
    A = rgb2gray(A);
    B = rgb2gray(B);
end
A = double(A);
B = double(B);
a = 0;
[height , width] = size(A);

A2 = zeros(height , width); 
B2 = zeros(height , width); 

A31 = zeros(height , width); 
B31 = zeros(height , width); 

OUT = zeros(height , width); 
OUT2 = zeros(height , width); 
while(a < pi)
    A1 = phase(A , a);
    B1 = phase(B , a);
    for m = 1 : height - 1
        for n = 1 : width - 1
            if(A1(m , n) > A2(m , n))
                A2(m , n) = A1(m , n);
            end
             if(B1(m , n) >B2(m , n))
                B2(m , n) = B1(m , n);
            end
            if(a == 0)
                A30 = A1;
            end
            if(A1(m , n) < A30(m , n))
                A30(m , n) = A1(m , n);
            end
            
             if(a == 0)
                B30 = B1;
            end
            if(B1(m , n) < B30(m , n))
                B30(m , n) = B1(m , n);
            end
            
        end
    end
    a = a + pi / 12;
end

A3 =abs(A2 - A30);
B3 = abs(B2 - B30);

for m = 1 : height - 1
    for n = 1 : width - 1
        A31(m , n) = (A(m + 1 , n) - A(m , n)) .^ 2 + (A(m , n + 1) - A(m , n)) .^ 2;
        B31(m ,n) =  (B(m + 1 , n) - B(m , n)) .^ 2 + (B(m , n + 1) - B(m , n)) .^ 2;
    end
end

for i = 1 : height
    for j = 1 : width
              if(A3(i , j)  > B3(i , j) || (A3(i , j) == B3(i , j) && A31(i , j) > B31(i , j)) || (A3(i , j) == B3(i , j) && A31(i , j) == B31(i , j) && A(i , j) > B(i , j)))
                  OUT(i , j) = A(i , j);
              else
                  OUT(i , j) = B(i , j);
              end
    end
end

O = OUT;
OUT1 = mat2gray(O);
imtool(OUT1);
MI0 = MIF(A , B , O);
QF0 = QF(A , B , O);
L = demo(O);
k = 0;
while(k < 150)
    p = 0;
    q = 0;
    for i = 1 : height
        for j = 1 : width
              if(L(i , j) == k);
              p = p + A3(i , j);
              q = q + B3(i , j);
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