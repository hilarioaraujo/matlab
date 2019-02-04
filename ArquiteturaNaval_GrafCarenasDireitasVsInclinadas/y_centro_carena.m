function [ y ] = y_centro_carena( Im )


if Im<=0.5
    y=Im-(4*Im)/(3*pi);
    
elseif Im>0.5 && Im<=1
    y1=(Im-0.5)/2; %ordenada do centroide do retangulo
    y2=0.5-(4*0.5)/(3*pi);
    y=y1+y2;


end

