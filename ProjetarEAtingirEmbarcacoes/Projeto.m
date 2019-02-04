%--------------------------------------------------------------------------
% Nome do programa/fun��o: Projeto - Batalha Naval
% Objetivo: Desenvolver um jogo que coloque numa �rea um n�mero de 
% embarca��es pedido ao utilizador, em posi��es aleat�rias, e que pe�a as 
% coordenadas para onde o utilizador pretende enviar m�sseis.
%
% Par�metros de entrada: 
% Valor retornado: 
%
% Autores: STEN Gaspar Merca
%          
% Data: 28-10-2015
%--------------------------------------------------------------------------

%Limpar dados anteriores e linha de comandos
clear
clc

disp('-----------------------------------------------------------------------');
disp('Projeto de Introdu��o � Programa��o - Batalha Naval')
disp('-----------------------------------------------------------------------');
disp('�NICIO');
disp(' ');

% Script destinado a apresentar os autores, data de in�cio e quantidade de
% dias passados.
apresentar;

% A fun��o "carregar" dever� perguntar se o utilizador pretende jogar um
% novo jogo ou carregar um jogo anterior.
novo=tipo_jogo;

% Caso o jogador tenha escolhido jogar um novo jogo:
if novo
    % A fun��o "aleatorio" dever� perguntar se o utilizador pretende colocar 
    % embarca��es aleatoriamente ou especificar a embarca��o e o local:
    esp=aleatorio;

    % A fun��o "pedir" dever� pedir o n�mero de embarca��es que o 
    % utilizador pretende colocar na �rea:
    num=pedir;
            
    if esp
            % A fun��o "pedir_navios" ir� pedir ao utilizador as coordenadas de "num" embarca��es. 
            % � composta por outras 3 fun��es ("mostrar_navios", "converter" e "pedir_rumo"):
            [posicoes_x,posicoes_y,cores]=pedir_navios(num);
            
    else
            % A fun��o "navios" ir� gerar coordenadas aleat�rias de "num" embarca��es. 
            % � composta por outras 3 fun��es ("lernavio", "converter" e "rumo"):
            [posicoes_x,posicoes_y,cores]=navios(num);
    end
    
    % A fun��o antingir_emb vai perguntar ao utilizador as coordenadas
    % para m�sseis.
    [p_x,p_y,dentro]=atingir_emb(posicoes_x,posicoes_y,num);
    
% Caso o jogador tenha escolhido carregar um jogo existente:
else
    
    % Lista os jogos guardados.
    listar;                    
           
    % Carrega um jogo escolhido pelo o utilizador.
    [posicoes_x,posicoes_y,p_x,p_y,cores,dentro]=carregar;
    
    % Conta o n�mero de embarca��es do jogo carregado.
    num=contar_emb(posicoes_x);
    
    % A fun��o antingir_emb vai perguntar ao utilizador as coordenadas
    % para m�sseis.
    [p_x2,p_y2,dentro2]=atingir_emb(posicoes_x,posicoes_y,num);
   
    % Junta os m�sseis lan�ados anteriormente com os m�sseis lan�ados. 
    [p_x,p_y,dentro]=concatenar(p_x,p_y,dentro,p_x2,p_y2,dentro2);

end

% A fun��o "grafico" mostra graficamente as embarca��es e a localiza��o
% dos m�sseis enviados pelos utilizador.
grafico(posicoes_x,posicoes_y,p_x,p_y,cores,dentro) 

% A fun��o "guardar" guarda os dados do jogo no ficheiro "jogos.mat". 
guardar(posicoes_x,posicoes_y,p_x,p_y,cores,dentro)

disp('-----------------------------------------------------------------------');
disp('FIM');