figure('Color','white')
load topo
axesm miller
axis([-180 180 -90 90]); framem on; gridm on;
[lat,lon] = meshgrat(topo,topolegend,[90 180]);
surfm(lat,lon,topo)
demcmap(topo)