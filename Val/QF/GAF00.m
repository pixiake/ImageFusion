function [QAF , GA] = GAF00(A , F)
%A = double(imread('lab1.gif'));
%F = double(rgb2gray(imread('o1.jpg')));
%F = OUT;
%{
if size(A,3)==3
    A = rgb2gray(A);
    F = rgb2gray(F);
end
A = double(A);
F = double(F);
%}
[width , height] = size(A);

GA = zeros(width , height);
GF = zeros(width , height);
GAF = zeros(width , height);
argA = zeros(width , height);
argF = zeros(width , height);
argAF = zeros(width , height);
QAFg = zeros(width , height);
QAFa = zeros(width , height);
QAF0 = zeros(width , height);
QAF = zeros(width , height);

Tg = 0.9994;
Ta = 0.9879;
kg = -15;
ka = -22;
og = 0.5;
oa = 0.8;
for i = 2 : width
    for j = 2 : height
        GA(i , j) = sqrt((A(i , j) - A(i - 1 , j)) .^ 2 + (A(i , j) - A(i , j - 1)) .^ 2);
        GF(i , j) = sqrt((F(i , j) - F(i - 1 , j)) .^ 2 + (F(i , j) - F(i , j - 1)) .^ 2);
        if(GA(i , j) > GF(i , j))
            GAF(i , j) = GF(i , j) ./ GA(i , j);
        elseif(GA(i , j) < GF(i , j))
             GAF(i , j) = GA(i , j) ./ GF(i , j);
        elseif(GA(i , j) == GF(i , j))
             GAF(i , j) = 1;
        end
      
        if(A(i , j) - A(i , j - 1) == 0)
            argA(i , j) = pi ./ 2;
        else
            argA(i , j) = atan((A(i , j) - A(i - 1 , j)) ./ (A(i , j) - A(i , j - 1)));
        end
        if(F(i , j) - F(i , j - 1) == 0)
            argF(i , j) = pi ./ 2;
        else
            argF(i , j) = atan((F(i , j) - F(i - 1 , j)) ./ (F(i , j) - F(i , j - 1)));
        end
        argAF(i , j) = abs(abs(argA(i , j) - argF(i , j)) - pi ./ 2) ./ pi ./ 2;
    end
end
for i = 1 : width
    for j = 1 : height
         QAFg(i , j) = Tg ./ (1 + exp(kg .* (GAF(i , j) - og)));
         QAFa(i , j) = Ta ./ (1 + exp(ka .* (argAF(i , j) - oa)));
         QAF0(i , j) = QAFg(i , j) .* QAFa(i , j);
         QAF(i , j) = QAF0(i , j) .* GA(i , j);
    end
end

