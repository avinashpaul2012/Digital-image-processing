clc;
close all;
A=imread('spnoisy.jpg');
B=imread('unifnoisy.jpg');
C=imread('spunifnoisy.jpg');
A=double(A);
B=double(B);
C=double(C);
[m,n,p]=size(A);
B1=zeros(m,n,3);
sub=cell(5,5);
s_d=100;
s_r=100;
for k=1:p
    for i=3:m-2
        for j=3:n-2
            sub=A(i-2:i+2,j-2:j+2,k);
            B1(i,j,k)=bilateral(sub,s_d,s_r);
        end
    end 
end
subplot(2,1,1);
imshow(uint8(A));
title('Input image with salt and pepper noise')
subplot(2,1,2);
imshow(uint8(B1));
title('Image obtained after applying bilateral filter')