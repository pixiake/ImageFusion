A = double(imread('blobs.png'));
%A1 = double(rgb2gray(A));

K = [ -0.0004 -0.0103 -0.0274 -0.0103 -0.0004;
         -0.0103 -0.1256 -0.0760 -0.1256 -0.0103;
         -0.0274 -0.0760   1.0000 -0.0760 -0.0274;
         -0.0103 -0.1256 -0.0760 -0.1256 -0.0103;
         -0.0004 -0.0103 -0.0274 -0.0103 -0.0004 ];
     
    G = conv2(A , K , 'same');
     imshow(mat2gray(G));