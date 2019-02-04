%--------------------------------------------------------------------------
% Nome do programa/função: atingir
% Objetivo: Pergunta ao utilizar, até este desejar o contrário, as
% coordenadas do missel, e informa o utilizador se acertou ou não no alvo.
%
% Parâmetros de entrada: posicoes_x,posicoes_y
% Valor retornado: p_x,p_y,dentro
%
% Autores: nº131 Rocha Araújo, nº182 Paulo Fernandes, nº185 Lázaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ p_x,p_y,dentro ] = atingir( posicoes_x,posicoes_y )
continuar=1;
linhasto=1;
while continuar==1
coorx=inputdlg('Introduza a coordenada (x) do míssel, entre -0.5 e 0.5 milhas.');

%ve se as coordenadas são validas, isto é entre -0.5 e 0.5, e se não são
%letras.
pix=str2num(coorx{1});            
            letras1=isempty(pix); 
                        if (letras1==1)|| pix>0.5 || pix<-0.5
                                    while letras1==1 || pix>0.5 || pix<-0.5
                                    na=errordlg('O que introduziu não é uma coordenada válida.');
                                    waitfor(na);
                                    coorx=inputdlg('Introduza a coordenada (x) do míssel, entre -0.5 e 0.5 milhas.');
                                    pix=str2num(coorx{1});        
                                    letras1=isempty(pix);                                     
                                    end                                                                                                         
                        end

p_x(linhasto)=pix;

coory=inputdlg('Introduza a ordenada (y) do míssel, entre -0.5 e 0.5 milhas.');
piy=str2num(coory{1});            
            letras1=isempty(piy); 
                        if (letras1==1)|| piy>0.5 || piy<-0.5
                                    while letras1==1 || piy>0.5 || piy<-0.5
                                    na=errordlg('O que introduziu não é uma coordenada válida.');
                                    waitfor(na);
                                    coory=inputdlg('Introduza a ordenada (y) do míssel, entre -0.5 e 0.5 milhas.');
                                    piy=str2num(coory{1});        
                                    letras1=isempty(piy);                                     
                                    end                                                                                                         
                        end
p_y(linhasto)=piy;
dentro=0;
linhasx=size(posicoes_x,1);

%cria o poligno do navio e vê se o pix e piy no momneto correspondem em
%algum ponto do poligno. caso seja  dentro é verdadeiro, caso contrário é
%falso.
for da=1:linhasx         
[in]=inpolygon(pix,piy,posicoes_x(da,:),posicoes_y(da,:));
         if in==0
                 
             dentro(1,linhasto)=0;
         
         else
            
            dentro(1,linhasto)=1;
            break
            
         end                           
            
end
%se dentro for falso mostra uma mensagem a dizer que nenhuma embarcação fui
%atingida.
if dentro(1,linhasto)==0
a=msgbox('Nenhuma embarcação foi atingida.');
                  waitfor(a);
else
         %caso contrário mostra uma mensagem a dizer que uma embarcação fui atingida.
         a=msgbox('Uma embarcação foi atingida.');
            waitfor(a);
end


%Pergunta ao utilizarse deseja continuar a tentar atingir as embarcações,
%retomando ao ciclo de novo.

questao=questdlg('Deseja continuar a lançar mísseis?','Continuar','Sim','Não','a');

if questao == 'Sim'
            continuar=1;
            linhasto=linhasto+1;
            
else
            continuar=0;
end

end
end


