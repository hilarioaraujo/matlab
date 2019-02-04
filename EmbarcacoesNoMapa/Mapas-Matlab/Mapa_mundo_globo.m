load topo
R = georasterref('RasterSize', size(topo),'Latlim', [-90 90], 'Lonlim', [-180 180]);
figure('Color','white')
worldmap('world')
geoshow(topo, R, 'DisplayType', 'texturemap')
demcmap('inc',[max(topo(:)) min(topo(:))],10);
colorbar