%--------------------------------------------------------------------------
% Nome do programa/fun��o: aleatorio
% Objetivo: Pergunta ao utilizador se pretende gerar as embarca��es
% aleatoriamente ou se quer ser ele a especificar-las.
%
% Par�metros de entrada: 
% Valor retornado: esp
%
% Autores: n�131 Rocha Ara�jo, n�182 Paulo Fernandes, n�185 L�zaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ esp ] = aleatorio()
%questiona o utilizador sobre como deseja gerar as embarca��es.
posic=questdlg('Deseja especificar as embarca��es aleat�riamente e respetivas posi��es ou ger�-las aleateriormente?', 'Posi��es e tipos de embarca��es', 'Sim desejo escolher.', 'Desejo ger�-las aleatoriamente.', 's');

%a fun��o switc � tipo um if, caso o utilizador escolher desejar
%aleatoriamente esp =0 caso nao deseje, e queira ser ele esp=1.
switch posic
            case 'Sim desejo escolher.'
                        esp=1;
            
            case'Desejo ger�-las aleatoriamente.'
                        esp=0;


end

