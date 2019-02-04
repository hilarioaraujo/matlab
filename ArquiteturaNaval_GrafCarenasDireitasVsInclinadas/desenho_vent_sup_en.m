figure 
Im=[0:0.035:1]';
X=[0:(6/(size(Im,1)-1)):6]';
for i=1:size(Im,1)
        Bf(i,1)= boca_vent_sup_en (Im(i,1));
end


y1=Bf;
y2=-Bf;

tabela=[Im,y1,y2,X];

plot3(X,Bf,Im)
hold on
plot3 (X,-Bf,Im);
axis equal
grid on

