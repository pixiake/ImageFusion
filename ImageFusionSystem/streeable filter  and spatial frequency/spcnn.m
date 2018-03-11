function [Em] = spcnn(E)
%E0 = rgb2gray(imread('5left.jpg'));

[w0,h0] = size(E);

Ui = zeros(w0,h0);
%S = zeros(w0,h0);
Fi = zeros(w0,h0);
Em = zeros(w0,h0);
Yi = zeros(w0,h0);
Li = zeros(w0,h0);
%L1 = zeros(w0,h0);

N = 100;
VT = 10;
K = [0.707 1 0.707 ; 1 0 1 ; 0.707 1 0.707];
B = 0.1;
dT = 14;
Ti = 350000 * ones(w0,h0);

while(N > 0)
     %Ti = 255;
     L1 = conv2(Yi , K , 'same');
    for i = 1 : w0
        for j = 1 : h0
       % Fi(i,j) = E0(i,j);
        Fi(i,j) = E(i,j);
        if(L1(i,j) > 0)
            Li(i,j) = 1;
        else Li(i,j) = 0;
        end
        Ui(i,j) = (Fi(i,j) .* (1 + B .* Li(i,j)));
        if( Ui(i,j) > Ti(i,j))
            Yi(i,j) = 1;
        else Yi(i,j) = 0;
        end
        Ti(i,j) = Ti(i,j) - dT + VT .* Yi(i,j);
        Em(i,j) = Em(i,j) + Yi(i,j);
        end
    end
    N = N - 1;
end

