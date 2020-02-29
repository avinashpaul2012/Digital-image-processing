function b=bilateral(sub,s_d,s_r)
b1=0;
b2=0;
for i=1:5
    for j=1:5
        d=(i-3)^2+(j-3)^2;
        b1=b1+exp(.5*-d/s_d^2)*exp(-(sub(i,j)-sub(3,3))^2/(2*s_r^2))*sub(i,j);
        b2=b2+exp(.5*-d^2/s_d^2)*exp(-(sub(i,j)-sub(3,3))^2/(2*s_r^2));
        b=b1/b2;
    end
end
end
