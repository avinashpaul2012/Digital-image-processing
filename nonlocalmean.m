function y=nonlocalmean(a,b,h)
m=cell(7,7);
s=zeros(11,11);
for i=1:11
    for j=1:11
        m{i,j}=a(i:i+6,j:j+6);
        m1=m{i,j};
            n=m1-b;
            n=n.^2;
            s(i,j)=sqrt(1/49*sum(sum(n)));            
    end
end
s(6,6)=1000;
[Xs Xind]=sort(s(:));
sum1=0;
sum2=0;
for i=1:8
   %[rows1, columns1] = Xind(i);
   t=m{Xind(i)};
   sum1=sum1+t(4,4)*exp(-((t(4,4)-b(4,4))^2)/h^2);
   sum2=sum2+exp(-((t(4,4)-b(4,4))^2)/h^2);
end
y=sum1/sum2;





            
            
            
            
        
        
        