function [] = listar()
jogosant=load('jogos');
n_jogos=size(jogosant.jogos,2);
for nv=1:n_jogos
            data1=jogosant.jogos(nv).Data;
            data=datestr(data1,'HH:MM dd-mm-yyyy');
            navioant=size(jogosant.jogos(nv).posicoes_x,1);
            misseis_lac=size(jogosant.jogos(nv).dentro,2);
            navios_atin=size(find(jogosant.jogos(nv).dentro==1),2);
            jogos_guard(:,nv)={['Jogo ' num2str(nv) ': ' data]; ['Navios: ' num2str(navioant)] ; ['Mísseis lançados: ' num2str(misseis_lac)] ; ['Navios atingidos: ' num2str(navios_atin)]; ''};
end
joguinhos=msgbox(jogos_guard);    
waitfor(joguinhos);


end

