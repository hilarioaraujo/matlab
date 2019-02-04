function [ esp_cam ] = espessura_camada( lat,vel_vento )

esp_cam=(4.3*vel_vento)/(sqrt(sind(lat)));


end

