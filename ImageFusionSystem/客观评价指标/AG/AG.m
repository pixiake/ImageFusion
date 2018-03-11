function [AG] = AG(A)
A = double(A);
[a , b] = size(A);
A1 = zeros(a , b);
for i = 1 : a - 1
    for j = 1 : b-1
         A1(i , j) = sqrt(((A(i + 1 , j) -A(i , j)) .^ 2 +((A(i , j + 1) - A(i , j)) .^2) ./ 2));
    end
end
AG = sum(sum(A1)) ./ ((a - 1) .* (b - 1));