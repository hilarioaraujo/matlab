function [comp_transv_u, v0] = componente_transv_u( im,vel_vento, esp_cam, coriolis, lat_ns )

v0=0.79*(10^(-5))*((vel_vento^2)/(esp_cam*coriolis));

if lat_ns ==2
        comp_transv_u=-(exp((pi/esp_cam)*im))*v0*cos((pi/4)+(im*(pi/esp_cam)));

else
        comp_transv_u=(exp((pi/esp_cam)*im))*v0*cos((pi/4)+(im*(pi/esp_cam)));
end



end

