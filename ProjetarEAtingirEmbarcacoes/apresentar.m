%--------------------------------------------------------------------------
% Nome do programa/fun��o: apresentar
% Objetivo: Apresenta os autores, a data de inicio do projeto e os dias que
% passaram desde a cria��o
%
% Par�metros de entrada: 
% Valor retornado: 
%
% Autores: n�131 Rocha Ara�jo, n�182 Paulo Fernandes, n�185 L�zaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

%define a data de inicio.
begin=[2015 12 13 0 0 0];

%define agora como a data no momento atual quando o programa � aberto
%(dd-mmm-aaaa)
agora=date;

%formata a data o momento para matriz de numeros
datavetor=datevec(agora);

%determina quanto tempo passou desde o inicio da cria��o at� ao momento
%atual em segundos
secpast=etime(datavetor, begin);
%transforma o tempo passado de segundos para dias.
days=secpast/86400;
info={'Autores:' '-n�131 Rocha Ara�jo' [] '-n�182 Paulo Fernandes' [] '-n�185 L�zaro Salumbo' [] ['Passaram ' num2str(days) ' dias desde 13/12/2015 (data de in�cio)']};
%mensagem de tempo sobre os autores, os dias passados desde a cria��o e a
%data do momento atual.
a=msgbox(info);
%espera que o utilizador clique em "ok" para prosseguir.
waitfor(a)

