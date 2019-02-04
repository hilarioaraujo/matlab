function [ ang_rel ] = angulo_relativo( comp_transv_u,comp_long_v )

aux=rad2deg(atan(comp_transv_u/comp_long_v));

if comp_long_v<0
    ang_rel=180+aux;
    
elseif comp_long_v>=0 && comp_transv_u>=0
    ang_rel=aux;

else
    ang_rel=360+aux;

end

