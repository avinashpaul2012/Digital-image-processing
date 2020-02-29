clc;
close all;
clear all;
img=imread('IITG.jpg');
img=double(img);
matx= 1/3*[1 0 -1;2 0 -2;1 0 -1];
maty= 1/3*[1 2 1;0 0 0;-1 -2 -1];
gauss=1/16*[1 2 1;2 4 2;1 2 1];
gradx=convn(img,matx,'same');
grady=convn(img,maty,'same');

for l=1:3
    for m=0:527
        for n=0:797
            s=0;t=0;u=0;
            for i=1:3
                for j=1:3
                    s=s+(gauss(i,j)*gradx(i+m,j+n,l))^2;
                    t=t+(gauss(i,j)*grady(i+m,j+n,l))^2;
                    u=u+(gauss(i,j)*gradx(i+m,j+n,l))*(gauss(i,j)*grady(i+m,j+n,l));   
                end
            end
            mat=[s,u;u,t];
            e=eig(mat);
            R=e(1)*e(2)-0.05*(e(1)+e(2));
            if R>1000
                img(m+2,n+2,l)=255;
            end
                
        end
    end
end       

imshow(uint8(img));
