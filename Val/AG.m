function [M] = AG(X)

[a, b] = size(X);
M0 = zeros(a , b);
for i = 1 : a-1
    for j = 1 : b-1
        M0(i , j) = sqrt(((X(i + 1,j) - X(i , j)) .^ 2 + (X(i , j + 1) - X(i , j)) .^2) ./ 2); 
    end
end

M = sum(sum(M0)) ./ ((a-1) .* (b - 1)) ; 