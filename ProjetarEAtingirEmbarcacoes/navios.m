function [ posicoes_x,posicoes_y,cores ] = navios( num )
caox=msgbox('A classe, as coordenadas e o rumo dos navios será feita automaticamente.');
waitfor(caox);
for xz=1:num

            [ emb_x,emb_y, cor ] = lernavio();
            posicoes_x(xz,:)=emb_x;
            posicoes_y(xz,:)=emb_y;
            cores(xz,1)=cor;
end
end


