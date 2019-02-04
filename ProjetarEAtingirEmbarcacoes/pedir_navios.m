function [ posicoes_x,posicoes_y, cores ] = pedir_navios( num )
for xz=1:num
            caox=msgbox(['Escolha a classe, coordenadas e o rumo do ' num2str(xz) 'º navio.']);
            waitfor(caox);
            [ emb_x,emb_y, cor ] = mostrar_navios();
            posicoes_x(xz,:)=emb_x;
            posicoes_y(xz,:)=emb_y;
            cores(xz,1)=cor;
end
end

