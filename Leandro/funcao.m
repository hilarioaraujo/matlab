erro_F=0.005*9.8;
erro_dx=0.0005; 

kmax=0;
kmin=1000;

f1=0.4905;
f2=1.8639;
f3=2.3544;

x1=0.0115;
x2=0.043;
x3=0.0565;


dx1=[x1-erro_dx; x1+erro_dx];
dx2=[x2-erro_dx; x2+erro_dx];
dx3=[x3-erro_dx; x3+erro_dx];

F1=[f1-erro_F; f1+erro_F];
F2=[f2-erro_F; f2+erro_F];
F3=[f3-erro_F; f3+erro_F];
knum=1;

for a=1:2
   for b=1:2
       for c=1:2
           for d=1:2
               for e=1:2
                   for f=1:2
                       p = polyfit([dx1(a,1);dx2(c,1);dx3(e,1)],[F1(b,1);F2(d,1);F3(f,1)],1);
                       k=p(1);
                       %k=((3*(dx1(a,1)*F1(b,1)+dx2(c,1)*F2(d,1)+dx3(e,1)*F3(f,1)))-(dx1(a,1)+dx2(c,1)+dx3(e,1))*(F1(b,1)+F2(d,1)+F3(f,1)))/((3*((dx1(a,1)^2)+(dx2(c,1)^2)+(dx3(e,1)^2)))-((dx1(a,1)+dx2(c,1)+dx3(e,1))^2));
                       if (k>kmax)
                           kmax=k;
                       end
                       
                       if(k<kmin)
                           kmin=k;
                       end
                       todos_k(knum,1)=k;
                       knum=knum+1;
                   end
               end
           end
       end
   end    
end

disp(['O Kmáx é: ', num2str(kmax)]);
disp(['O Kmin é: ', num2str(kmin)]);