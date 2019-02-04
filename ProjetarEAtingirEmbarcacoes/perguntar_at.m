%--------------------------------------------------------------------------
% % Nome do programa/função: atingir
% Objetivo: Esta função deverá indicar ao utilizador quantas embarcações estão na área (num) e perguntar se o mesmo deseja tentar atingi-las. 
%Caso o utilizador tente atingir as embarcações, deverá definir o parâmetro de saída (at) como verdadeiro. 
%Caso contrário, deve dizer ao utilizador que escolheu não tentar atingir as embarcações e que o gráfico irá ser mostrado e ainda definir “at” como falso.

%
% Parâmetros de entrada: NUM
% Valor retornado: AT
%
% Autores: nº131 Rocha Araújo, nº182 Paulo Fernandes, nº185 Lázaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ at ] = perguntar_at( num )

%pergunta ao utilizador se deseja atingir as embarcações e informa-o do
%número de embarcações presentes na area.
atacar=questdlg(['Estão ' num2str(num) ' embarcações na área, deseja atingir-las?'],'Atacar as Embarcações','Sim, desejo.','Não.','d');
%compara as strings para ver se são verdadeiras, caso sejam at=1 caso
%contrário at=0
if strcmpi(atacar,'Sim, desejo.')
            at=true;

else
            co=msgbox('Escolheu não atingir as embarcações, o gráfico das embarcações será mostrado.');
            waitfor(co);
            at=false;
end
           


end

