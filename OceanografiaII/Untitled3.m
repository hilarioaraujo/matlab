function [ v0 ] = Untitled3( vel_vento, esp_cam, coriolis )
v0=0.79*(10^(-5))*((vel_vento^2)/(esp_cam*coriolis));


end

