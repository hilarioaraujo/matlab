%# GPS positions (latitude,longitude) of some markers
data = [
    -22.976730, - 43.195080 ;
     55.756950,   37.614975 ;
     33.605381, -  7.631940 ;
     35.670479,  139.740921 ;
     51.506325, -  0.127144 ;
     40.714550, - 74.007124 ;
    -33.869629,  151.206955 ;
    -26.204944,   28.040035 ;
     37.777125, -122.419644 ;
     30.083740,   31.255360 ;
      6.439180,    3.423480
];
labels = {
    'Rio de Janeiro'
    'Moscow'
    'Casablanca'
    'Tokyo'
    'London'
    'New York'
    'Sydney'
    'Johannesburg'
    'San Francisco'
    'Cairo'
    'Lagos'
};

ld map in Mercator projection
fname = 'http://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Mercator-projection.jpg/773px-Mercator-projection.jpg';
img = imread(fname);
[imgH,imgW,~] = size(img);

%# Mercator projection
[x,y] = mercatorProjection(data(:,2), data(:,1), imgW, imgH);

%# plot markers on map
imshow(I, 'InitialMag',100, 'Border','tight'), hold on
plot(x,y, 'bo', 'MarkerSize',10, 'LineWidth',3)
text(x, y, labels, 'Color','w', 'VerticalAlign','bottom', 'HorizontalAlign','right')
hold off