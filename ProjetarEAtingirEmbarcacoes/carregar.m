%--------------------------------------------------------------------------
% Nome do programa/fun��o: atingir_emb
% Objetivo: Func�o responsavel por: se o utilizador pretender atingir as
% embarca��es ela chama a fun��o atingir se n�o volta ao programa.
%
% Par�metros de entrada: 
% Valor retornado:posicoes_x,posicoes_y,p_x,p_y,cores,dentro
%
% Autores: n�131 Rocha Ara�jo, n�182 Paulo Fernandes, n�185 L�zaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ posicoes_x,posicoes_y,p_x,p_y,cores,dentro ] = carregar( )
%carrega a estrutura jogos
jogosant=load('jogos');
n_jogos=size(jogosant.jogos,2);
int1=inputdlg('Qual � o jogo que pretende carregar?');
jogsave=str2num(int1{1});            
            letras1=isempty(jogsave); 
                        if (letras1==1)|| jogsave>n_jogos || jogsave<1
                                    while (letras1==1)|| jogsave>n_jogos || jogsave<1
                                    na=errordlg('O que introduziu n�o � um jogo v�lido.');
                                    waitfor(na);
                                    int1=inputdlg('Qual � o jogo que pretende carregar?');
                                    jogsave=str2num(int1{1});        
                                    letras1=isempty(jogsave);                                     
                                    end                                                                                                         
                        end
posicoes_x=jogosant.jogos(jogsave).posicoes_x;
posicoes_y=jogosant.jogos(jogsave).posicoes_y;
p_x=jogosant.jogos(jogsave).p_x;
p_y=jogosant.jogos(jogsave).p_y;
cores=jogosant.jogos(jogsave).cores;
dentro=jogosant.jogos(jogsave).dentro;

end