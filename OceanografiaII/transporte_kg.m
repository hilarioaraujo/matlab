function [transp_kg, coriolis] = transporte_kg (lat, densidade_ar, vel_vento)

tensao_vento=densidade_ar*(0.001*(1.1+0.035*vel_vento))*vel_vento^2;
coriolis=2*(2*pi/86202)*sind(lat);

transp_kg=tensao_vento/coriolis;


end

