%--------------------------------------------------------------------------
% Nome do programa/função: aleatorio
% Objetivo: Pergunta ao utilizador se pretende gerar as embarcações
% aleatoriamente ou se quer ser ele a especificar-las.
%
% Parâmetros de entrada: 
% Valor retornado: esp
%
% Autores: nº131 Rocha Araújo, nº182 Paulo Fernandes, nº185 Lázaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ esp ] = aleatorio()
%questiona o utilizador sobre como deseja gerar as embarcações.
posic=questdlg('Deseja especificar as embarcações aleatóriamente e respetivas posições ou gerá-las aleateriormente?', 'Posições e tipos de embarcações', 'Sim desejo escolher.', 'Desejo gerá-las aleatoriamente.', 's');

%a função switc é tipo um if, caso o utilizador escolher desejar
%aleatoriamente esp =0 caso nao deseje, e queira ser ele esp=1.
switch posic
            case 'Sim desejo escolher.'
                        esp=1;
            
            case'Desejo gerá-las aleatoriamente.'
                        esp=0;


end

