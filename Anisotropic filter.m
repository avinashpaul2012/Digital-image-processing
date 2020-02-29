clc;
close all;
img=imread('lenna.noise.jpg');
img=double(img);
in_img=img;
del_x=1;
del_y=1;
k=50;
lamda=1/4;
n= [0 1 0;0 -1 0;0 0 0];
s= [0 0 0;0 -1 0;0 1 0];
e= [0 0 0;0 -1 1;0 0 0];
w= [0 0 0;1 -1 0;0 0 0];
hfn= [0 .5 0;0 -.5 0;0 0 0];
hfs= [0 0 0;0 -.5 0;0 .5 0];
hfe= [0 0 0;0 -.5 .5;0 0 0];
hfw= [0 0 0;.5 -.5 0;0 0 0];

for iter=1:10
    n_grad=conv2(in_img,n,'same');
    s_grad=conv2(in_img,s,'same');
    e_grad=conv2(in_img,e,'same');
    w_grad=conv2(in_img,w,'same');
    hfn_grad=conv2(in_img,hfn,'same');
    hfs_grad=conv2(in_img,hfs,'same');
    hfe_grad=conv2(in_img,hfe,'same');
    hfw_grad=conv2(in_img,hfw,'same');

    hfn_c=exp(-(hfn_grad/k).^2);
    hfs_c=exp(-(hfs_grad/k).^2);
    hfe_c=exp(-(hfe_grad/k).^2);
    hfw_c=exp(-(hfw_grad/k).^2);

    in_img=in_img + lamda*((1/del_x^2)*(hfe_c.*e_grad+hfw_c.*w_grad)+(1/del_y^2)*(hfn_c.*n_grad+hfs_c.*s_grad));
end
    subplot(2,1,1);
    imshow(uint8(img));
    subplot(2,1,2);
    imshow(uint8(in_img));
