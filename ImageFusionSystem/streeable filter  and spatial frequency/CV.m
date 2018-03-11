function [F] = CV(X , A , B )

[height , width] = size(X);
At = 8;
%Bt = 12;

for i = 2 : 2 : height - 1 
    for j = 2 : 2 : width - 1
          M = [ X(i - 1 , j - 1) X(i - 1 , j) X(i - 1 , j + 1) ;
                    X(i , j - 1)       X(i , j)      X(i , j + 1);
                    X(i + 1 , j - 1) X(i + 1 , j) X(i + 1 , j + 1)];
                    
           N = [
                   A(i - 1 , j - 1) A(i - 1 , j) A(i - 1 , j + 1);
                   A(i , j - 1) A(i , j) A(i , j + 1) ;
                   A(i + 1 , j - 1) A(i + 1 , j) A(i + 1 , j + 1)
                   ];
           K = [
               B(i - 1 , j - 1) B(i - 1 , j) B(i - 1 , j + 1);
               B(i , j - 1) B(i , j) B(i , j + 1) ;
               B(i + 1 , j - 1) B(i + 1 , j) B(i + 1 , j + 1)
               ];
           t = 0;
               for k = 1 : 3
                   for l = 1 : 3
                      %  if( k ~= 2 && l ~=2)
                            if(M(k , l) - N(k , l) == 0)
                                t = t + 1;
                            end
                       % end
                   end
               end
            if(t > At)
                %B(i , j) = A(i , j);
                X(i - 1 , j - 1) = N(1 , 1); X(i - 1 , j) = N(1 , 2) ; X(i - 1 , j + 1)  = N(1 , 3);
                    X(i , j - 1) = N(2 , 1);       X(i , j) = N(2 , 2)  ;    X(i , j + 1) = N(2 , 3);
                    X(i + 1 , j - 1) = N(3 , 1); X(i + 1 , j) = N(3 , 2); X(i + 1 , j + 1) = N(3 , 3);
            elseif(t < 3)
                   X(i - 1 , j - 1) = K(1 , 1); X(i - 1 , j) = K(1 , 2) ; X(i - 1 , j + 1)  = K(1 , 3);
                    X(i , j - 1) = K(2 , 1);       X(i , j) = K(2 , 2)  ;    X(i , j + 1) = K(2 , 3);
                    X(i + 1 , j - 1) = K(3 , 1); X(i + 1 , j) = K(3 , 2); X(i + 1 , j + 1) = K(3 , 3);
            end
    end
end
%{
for i = 3 : height - 2 
    for j = 3 : width - 2
             M = [X(i - 2 , j - 2) X(i - 2 , j - 1) X(i - 2 , j) X(i - 2 , j + 1) X(i - 2 , j + 2);
                   X(i - 1 , j - 2) X(i - 1 , j - 1) X(i - 1 , j) X(i - 1 , j + 1) X(i - 1 , j + 2);
                   X(i , j - 2) X(i , j - 1) X(i , j) X(i , j + 1) X(i , j + 2);
                   X(i + 1 , j - 2) X(i + 1 , j - 1) X(i + 1 , j) X(i + 1 , j + 1) X(i + 1 , j + 2);
                   X(i + 2 , j - 2) X(i + 2 , j - 1) X(i + 2 , j) X(i + 2 , j + 1) X(i + 2 , j + 2);
                   ];
           N = [B(i - 2 , j - 2) B(i - 2 , j - 1) B(i - 2 , j) B(i - 2 , j + 1) B(i - 2 , j + 2);
                   B(i - 1 , j - 2) B(i - 1 , j - 1) B(i - 1 , j) B(i - 1 , j + 1) B(i - 1 , j + 2);
                   B(i , j - 2) B(i , j - 1) A(i , j) B(i , j + 1) B(i , j + 2);
                   B(i + 1 , j - 2) B(i + 1 , j - 1) B(i + 1 , j) B(i + 1 , j + 1) B(i + 1 , j + 2);
                   B(i + 2 , j - 2) B(i + 2 , j - 1) B(i + 2 , j) B(i + 2 , j + 1) B(i + 2 , j + 2);
                   ];
             
           t = 0;
               for k = 1 : 3
                   for l = 1 : 3
                        if( k ~= 2 && l ~=2)
                            if(M(k , l) - N(k , l) == 0)
                                t = t + 1;
                            end
                        end
                   end
               end
            if(t > Bt)
                X(i , j) = B(i , j);
            end
    end
end
%}
F = X;