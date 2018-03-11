function [G] = GH(a)

            t=-3:1:3;
            [x,y]=meshgrid(t);
            q =1;
           %{
             Kga = cos(a) .^ 4;                                   Ga = 1.246 .* (3 - 12 .* x .^ 2 + 4 .* x .^ 4) ./ q .^ 4  .* exp(-(x .^ 2 + y .^ 2));
            Kgb = -4 .* cos(a) .^ 3 .* sin(a);               Gb = 1.246 .* (-6 .* x + 4 .*  x .^3) .*  y  ./ q .^ 4 .* exp(-(x .^ 2 + y .^ 2));
            Kgc = 6 .* cos(a) .^ 2 .* sin(a) .^ 2;          Gc = 1.246 .* (2 .* x .^ 2 - 1) .* (2 .* y .^ 2 - 1) ./ q .^ 4 .* exp(-(x .^ 2 + y .^ 2));
            Kgd = -4 .* cos(a) .* sin(a) .^3;                Gd = 1.246 .* (-6 .* y + 4 .*  y .^ 3) .* x ./ q .^ 4  .* exp(-(x .^ 2 + y .^ 2));
            Kge = sin(a) .^ 4;                                    Ge = 1.246 .* (3 - 12 .* y .^ 2 +4 .*  y .^ 4) ./  q .^ 4 .* exp(-(x .^ 2 + y .^ 2) );
           G = Kga .* Ga + Kgb .* Gb + Kgc .* Gc + Kgd .* Gd + Kge .* Ge;
           %}
           
         
            Kga = cos(a) .^ 4;                                   Ga = 1.246 .* (3 - 12 .* x .^ 2 + 4 .* x .^ 4) ./ q .^ 4  .* exp(-(x .^ 2 + y .^ 2) ./ 2 .* (q .^ 2));
            Kgb = -4 .* cos(a) .^ 3 .* sin(a);               Gb = 1.246 .* (-6 .* x + 4 .*  x .^3) .*  y  ./ q .^ 4 .* exp(-(x .^ 2 + y .^ 2) ./ 2 .* (q .^ 2));
            Kgc = 6 .* cos(a) .^ 2 .* sin(a) .^ 2;          Gc = 1.246 .* (2 .* x .^ 2 - 1) .* (2 .* y .^ 2 - 1) ./ q .^ 4 .* exp(-(x .^ 2 + y .^ 2) ./ 2 .* (q .^ 2));
            Kgd = -4 .* cos(a) .* sin(a) .^3;                Gd = 1.246 .* (-6 .* y + 4 .*  y .^ 3) .* x ./ q .^ 4  .* exp(-(x .^ 2 + y .^ 2) ./ 2 .* (q .^ 2));
            Kge = sin(a) .^ 4;                                    Ge = 1.246 .* (3 - 12 .* y .^ 2 +4 .*  y .^ 4) ./  q .^ 4 .* exp(-(x .^ 2 + y .^ 2) ./ 2 .* (q .^ 2));
           G = Kga .* Ga + Kgb .* Gb + Kgc .* Gc + Kgd .* Gd + Kge .* Ge;

%{
            Ka = cos(a) .^ 2;                   Ga = 0.4607 .* (x .^ 2 - q .^ 2) ./ q .^ 4 .* exp(-(x .^ 2 + y .^ 2) ./ 2 .* (q .^ 2));  
            Kb = -sin(2 .* a);                    Gb = 0.4607 .* x .* y ./ q .^ 4 .* exp(-(x .^ 2 + y .^ 2) ./ 2 .* (q .^ 2));  
            Kc = sin(a) .^ 2;                     Gc = 0.4607 .* (y .^ 2 - q .^ 2) ./ q .^ 4 .* exp(-(x .^ 2 + y .^ 2) ./ 2 .* (q .^ 2));
            G = Ka .* Ga + Kb .* Gb + Kc .* Gc;
        %   mesh(x , y , G);
   %}
           
          %{
            Ka = cos(a) .^ 2;                   Ga = 0.9213 .* (2 .* x .^ 2 - 1) .* exp(-(x .^ 2 + y .^ 2));  
            Kb = -sin(2 .* a);                    Gb =1.843 .* x .* y .* exp(-(x .^ 2 + y .^ 2));  
            Kc = sin(a) .^ 2;                     Gc = 0.9213 .* (2 .* y .^ 2 -1) .* exp(-(x .^ 2 + y .^ 2));
            G = Ka .* Ga + Kb .* Gb + Kc .* Gc;
           %}
            %{
            Kha = cos(a) .^ 5;                                  Ha = 0.3975 .* (7.189 .* x - 7.501 .* x .^ 3 + x .^5) .* exp(-(x .^ 2 + y .^ 2));
            Khb = -5 .* cos(a) .^ 4 .* sin(a);              Hb = 0.3975 .* (1.438 - 4.501 .* x .^2 + x .^ 4) .* y .* exp(-(x .^ 2 + y .^ 2));
            Khc = 10 .* cos(a) .^3 .* sin(a) .^ 2;        Hc = 0.3975 .* (x .^ 3 - 2.225 .* x) .* (y .^ 2 - 0.6638) .* exp(-(x .^ 2 + y .^ 2));
            Khd = -10 .* cos(a) .^ 2 .* sin(a) .^ 3;     Hd = 0.3975 .* (y .^ 3 - 2.225 .* y) .* (x .^ 2 - 0.6638) .* exp(-(x .^ 2 + y .^ 2)); 
            Khe = 5 .* cos(a) .* sin(a) .^ 4;               He = 0.3975 .* (1.438 - 4.501 .* y .^ 2 - y .^ 4) .* x .* exp(-(x .^ 2 + y .^ 2));
            Khf = -sin(a) .^ 5;                                  Hf = 0.3975 .* (7.189 .* y - 7.501 .* y .^ 3 + y .^5) .* exp(-(x .^ 2 + y .^ 2));
%}
      %    G = Kga .* Ga + Kgb .* Gb + Kgc .* Gc + Kgd .* Gd + Kge .* Ge;
  %        H = Kha .* Ha + Khb .* Hb + Khc .* Hc + Khd .* Hd + Khe .* He + Khf .* Hf;
         %{
 figure(5)
          V = conv2(double(rgb2gray(imread('1.png'))) , G , 'same');
          imshow(mat2gray(V));
%}
