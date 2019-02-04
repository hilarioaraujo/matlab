function [ s,w ] = sonar( x,y,rumo,alc,ang )
%Fun��o que desenha a area abrangida pelo sonar
%   Inicialmente transforma-se os graus em radianos, de seguida cria
%   o vetor da sec��o circular 
r=-deg2rad(rumo)+pi/2;
a=deg2rad(ang);
b=linspace(r-a,r+a);
c=cos(b/2)*alc+x;
s=[x,c];
v=sin(b/2)*alc+y;
w=[y,v];


end

