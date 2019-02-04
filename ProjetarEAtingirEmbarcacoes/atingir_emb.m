%--------------------------------------------------------------------------
% Nome do programa/fun��o: atingir_emb
% Objetivo: Func�o responsavel por: se o utilizador pretender atingir as
% embarca��es ela chama a fun��o atingir se n�o volta ao programa.
%
% Par�metros de entrada: posicoes_x,posicoes_y,num
% Valor retornado: p_x,p_y,dentro
%
% Autores: n�131 Rocha Ara�jo, n�182 Paulo Fernandes, n�185 L�zaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ p_x, p_y, dentro ] = atingir_emb( posicoes_x,posicoes_y,num )

[at]=perguntar_at(num);
if at==1
[p_x,p_y,dentro]=atingir(posicoes_x,posicoes_y);
end 
end

