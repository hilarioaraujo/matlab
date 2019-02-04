%--------------------------------------------------------------------------
% Nome do programa/função: Projeto - Batalha Naval
% Objetivo: Desenvolver um jogo que coloque numa área um número de 
% embarcações pedido ao utilizador, em posições aleatórias, e que peça as 
% coordenadas para onde o utilizador pretende enviar mísseis.
%
% Parâmetros de entrada: 
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
disp('Projeto de Introdução à Programação - Batalha Naval')
disp('-----------------------------------------------------------------------');
disp('ÍNICIO');
disp(' ');

% Script destinado a apresentar os autores, data de início e quantidade de
% dias passados.
apresentar;

% A função "carregar" deverá perguntar se o utilizador pretende jogar um
% novo jogo ou carregar um jogo anterior.
novo=tipo_jogo;

% Caso o jogador tenha escolhido jogar um novo jogo:
if novo
    % A função "aleatorio" deverá perguntar se o utilizador pretende colocar 
    % embarcações aleatoriamente ou especificar a embarcação e o local:
    esp=aleatorio;

    % A função "pedir" deverá pedir o número de embarcações que o 
    % utilizador pretende colocar na área:
    num=pedir;
            
    if esp
            % A função "pedir_navios" irá pedir ao utilizador as coordenadas de "num" embarcações. 
            % É composta por outras 3 funções ("mostrar_navios", "converter" e "pedir_rumo"):
            [posicoes_x,posicoes_y,cores]=pedir_navios(num);
            
    else
            % A função "navios" irá gerar coordenadas aleatórias de "num" embarcações. 
            % É composta por outras 3 funções ("lernavio", "converter" e "rumo"):
            [posicoes_x,posicoes_y,cores]=navios(num);
    end
    
    % A função antingir_emb vai perguntar ao utilizador as coordenadas
    % para mísseis.
    [p_x,p_y,dentro]=atingir_emb(posicoes_x,posicoes_y,num);
    
% Caso o jogador tenha escolhido carregar um jogo existente:
else
    
    % Lista os jogos guardados.
    listar;                    
           
    % Carrega um jogo escolhido pelo o utilizador.
    [posicoes_x,posicoes_y,p_x,p_y,cores,dentro]=carregar;
    
    % Conta o número de embarcações do jogo carregado.
    num=contar_emb(posicoes_x);
    
    % A função antingir_emb vai perguntar ao utilizador as coordenadas
    % para mísseis.
    [p_x2,p_y2,dentro2]=atingir_emb(posicoes_x,posicoes_y,num);
   
    % Junta os mísseis lançados anteriormente com os mísseis lançados. 
    [p_x,p_y,dentro]=concatenar(p_x,p_y,dentro,p_x2,p_y2,dentro2);

end

% A função "grafico" mostra graficamente as embarcações e a localização
% dos mísseis enviados pelos utilizador.
grafico(posicoes_x,posicoes_y,p_x,p_y,cores,dentro) 

% A função "guardar" guarda os dados do jogo no ficheiro "jogos.mat". 
guardar(posicoes_x,posicoes_y,p_x,p_y,cores,dentro)

disp('-----------------------------------------------------------------------');
disp('FIM');