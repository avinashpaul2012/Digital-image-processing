clc;
close all;
img=imread('lenna.noise.jpg');
img=double(img);
in_img=img;
L=1/5;
for iter=1:10
    lap= [0 L 0;L 1-4*L L;0 L 0];
    grad=conv2(in_img,lap,'same');
    in_img=grad;
end
subplot(2,1,1);
imshow(uint8(img));
subplot(2,1,2);
imshow(uint8(in_img));