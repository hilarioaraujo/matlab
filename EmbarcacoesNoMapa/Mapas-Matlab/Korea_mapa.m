% Load the data.
load korea
load geoid

% Create a map axes that includes Korea.
figure
worldmap(map, refvec)

% Display the digital elevation data and apply a colormap.
geoshow(map, refvec, 'DisplayType', 'texturemap');
demcmap(map)

% Contour the geoid values from -100 to 100 in increments of 5.
[c,h] = contourm(geoid, geoidlegend, -100:5:100, 'k');

% Add red labels with white backgrounds to the contours.
ht = clabelm(c,h);
set(ht,'Color','r','BackgroundColor','white','FontWeight','bold')