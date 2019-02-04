function [ Asec ] = area_seccao_vent_sup_en ( Im, Bmax, Bf )

if min(Im)<0 || max(Im)>1
    return;
end

if Im>=1/2
    Asece=0.5*(pi*0.5*Bf/2);
    Asecp=(Im-0.5)*Bmax;
    Asec=(Asece)+Asecp;
else
    Asec=0.5*(pi*Im*Bf/2);

end

