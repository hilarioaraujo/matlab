%--------------------------------------------------------------------------
% Nome do programa/função: atingir_emb
% Objetivo: Funcão responsavel por: se o utilizador pretender atingir as
% embarcações ela chama a função atingir se não volta ao programa.
%
% Parâmetros de entrada: posicoes_x,posicoes_y,num
% Valor retornado: p_x,p_y,dentro
%
% Autores: nº131 Rocha Araújo, nº182 Paulo Fernandes, nº185 Lázaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ p_x, p_y, dentro ] = atingir_emb( posicoes_x,posicoes_y,num )

[at]=perguntar_at(num);
if at==1
[p_x,p_y,dentro]=atingir(posicoes_x,posicoes_y);
end 
end

