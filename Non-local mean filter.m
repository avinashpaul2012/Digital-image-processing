clc;
close all;
img=imread('lenna.noise.jpg');
img=double(img);
h=1;
img_new=zeros(512,512);
for i=9:504
    for j=9:504
        a=img(i-8:i+8,j-8:j+8);
        b=img(i-3:i+3,j-3:j+3);
        img_new(i,j)=nonlocalmean(a,b,h);
    end
end
subplot(2,1,1);
imshow(uint8(img));
subplot(2,1,2);
imshow(uint8(img_new));
        