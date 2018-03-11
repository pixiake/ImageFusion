function [O] = CV1(X , A ,B ,labels)
k = 0;
l = 0;
z = 0;
[width , height] = size(X);
while(z < 127 || z == 127)
      for i = 1 : width
          for j = 1 : height
              if(labels(i , j) == z)
                  if(X(i , j) - A(i , j) == 0)
                      l = l + 1;
                  end
                  if(X(i , j) - B(i , j) == 0)
                      k = k + 1;
                  end
              end
          end
      end
      if(l < k)
          for i = 1 : width
              for j = 1 : height
                     if(labels(i , j) == z )
                         X(i , j) =  B(i , j);
                     end
              end
          end
      else
           for i = 1 : width
              for j = 1 : height
                     if(labels(i , j) == z )
                         X(i , j) = A(i , j);
                     end
              end
          end
      end
      z = z + 1;
end
O = X;