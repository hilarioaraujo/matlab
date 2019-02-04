geoshow('landareas.shp', 'FaceColor', [0.15 0.5 0.15])
geoshow('worldlakes.shp', 'FaceColor', 'cyan')
geoshow('worldrivers.shp', 'Color', 'blue')
geoshow('worldcities.shp', 'Marker', '.',...
                           'Color', 'red')
setm(ax, 'FFaceColor', oceanColor)


labelLat = 35;
labelLon = 14;
textm(labelLat, labelLon, 'Mediterranean Sea')