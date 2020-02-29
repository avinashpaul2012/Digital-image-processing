clc;
close all;
in_img=imread('givenhist.jpg');
targ_img=imread('sphist.jpg');
subplot(3,2,2)
histogram(in_img)
title('Input image histogram')
subplot(3,2,4)
histogram(targ_img)
title('Target image histogram')
size=size(in_img);
total_pixel=size(1,1)*size(1,2);
in_img=double(in_img);
targ_img=double(targ_img);
m=size(1,1);
n=size(1,2);
%equalizing input image
no_pixel=zeros(1,256);
no_pixel_targ=zeros(1,256);
no_pixel_specified=zeros(1,256);
for i=1:m
    for j=1:n
        no_pixel(in_img(i,j)+1)=no_pixel(in_img(i,j)+1)+1;
        no_pixel_targ(targ_img(i,j)+1)=no_pixel_targ(targ_img(i,j)+1)+1;
    end
end
pdf=zeros(1,256);
pdf_targ=zeros(1,256);
for i=1:256
    pdf(i)=no_pixel(i)/total_pixel;
    pdf_targ(i)=no_pixel_targ(i)/total_pixel;
end
cdf=cumsum(pdf);
cdf_targ=cumsum(pdf_targ);
for i=1:256
        [c(i) index(i)] = min(abs(cdf_targ-cdf(i)));
end
specified_img=zeros(256,512);
for i=1:m
    for j=1:n
        specified_img(i,j)=index(in_img(i,j)+1)-1;
    end
end
specified_img=double(specified_img);
for i=1:m
    for j=1:n
        no_pixel_specified(specified_img(i,j)+1)=no_pixel_specified(specified_img(i,j)+1)+1;
    end
end
subplot(3,2,1)
imshow(uint8(in_img));
title('Input image')
subplot(3,2,3)
imshow(uint8(targ_img));
title('Target image')
subplot(3,2,5)
imshow(uint8(specified_img));
title('Histogram specified image')
subplot(3,2,6)
histogram(uint8(specified_img))
title('Specified image histogram')