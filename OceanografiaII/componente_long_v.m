function [comp_long_v] = componente_long_v( im, esp_cam, v0 )

comp_long_v= v0*sin((pi/4)+(im*pi/esp_cam))*exp(pi*im/esp_cam);


end

