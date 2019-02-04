%--------------------------------------------------------------------------
% % Nome do programa/fun��o: atingir
% Objetivo: Esta fun��o dever� indicar ao utilizador quantas embarca��es est�o na �rea (num) e perguntar se o mesmo deseja tentar atingi-las. 
%Caso o utilizador tente atingir as embarca��es, dever� definir o par�metro de sa�da (at) como verdadeiro. 
%Caso contr�rio, deve dizer ao utilizador que escolheu n�o tentar atingir as embarca��es e que o gr�fico ir� ser mostrado e ainda definir �at� como falso.

%
% Par�metros de entrada: NUM
% Valor retornado: AT
%
% Autores: n�131 Rocha Ara�jo, n�182 Paulo Fernandes, n�185 L�zaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ at ] = perguntar_at( num )

%pergunta ao utilizador se deseja atingir as embarca��es e informa-o do
%n�mero de embarca��es presentes na area.
atacar=questdlg(['Est�o ' num2str(num) ' embarca��es na �rea, deseja atingir-las?'],'Atacar as Embarca��es','Sim, desejo.','N�o.','d');
%compara as strings para ver se s�o verdadeiras, caso sejam at=1 caso
%contr�rio at=0
if strcmpi(atacar,'Sim, desejo.')
            at=true;

else
            co=msgbox('Escolheu n�o atingir as embarca��es, o gr�fico das embarca��es ser� mostrado.');
            waitfor(co);
            at=false;
end
           


end

