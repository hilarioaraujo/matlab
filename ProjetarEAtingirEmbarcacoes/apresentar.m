%--------------------------------------------------------------------------
% Nome do programa/função: apresentar
% Objetivo: Apresenta os autores, a data de inicio do projeto e os dias que
% passaram desde a criação
%
% Parâmetros de entrada: 
% Valor retornado: 
%
% Autores: nº131 Rocha Araújo, nº182 Paulo Fernandes, nº185 Lázaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

%define a data de inicio.
begin=[2015 12 13 0 0 0];

%define agora como a data no momento atual quando o programa é aberto
%(dd-mmm-aaaa)
agora=date;

%formata a data o momento para matriz de numeros
datavetor=datevec(agora);

%determina quanto tempo passou desde o inicio da criação até ao momento
%atual em segundos
secpast=etime(datavetor, begin);
%transforma o tempo passado de segundos para dias.
days=secpast/86400;
info={'Autores:' '-nº131 Rocha Araújo' [] '-nº182 Paulo Fernandes' [] '-nº185 Lázaro Salumbo' [] ['Passaram ' num2str(days) ' dias desde 13/12/2015 (data de início)']};
%mensagem de tempo sobre os autores, os dias passados desde a criação e a
%data do momento atual.
a=msgbox(info);
%espera que o utilizador clique em "ok" para prosseguir.
waitfor(a)

