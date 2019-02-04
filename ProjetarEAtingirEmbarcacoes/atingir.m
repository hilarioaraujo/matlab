%--------------------------------------------------------------------------
% Nome do programa/fun��o: atingir
% Objetivo: Pergunta ao utilizar, at� este desejar o contr�rio, as
% coordenadas do missel, e informa o utilizador se acertou ou n�o no alvo.
%
% Par�metros de entrada: posicoes_x,posicoes_y
% Valor retornado: p_x,p_y,dentro
%
% Autores: n�131 Rocha Ara�jo, n�182 Paulo Fernandes, n�185 L�zaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [ p_x,p_y,dentro ] = atingir( posicoes_x,posicoes_y )
continuar=1;
linhasto=1;
while continuar==1
coorx=inputdlg('Introduza a coordenada (x) do m�ssel, entre -0.5 e 0.5 milhas.');

%ve se as coordenadas s�o validas, isto � entre -0.5 e 0.5, e se n�o s�o
%letras.
pix=str2num(coorx{1});            
            letras1=isempty(pix); 
                        if (letras1==1)|| pix>0.5 || pix<-0.5
                                    while letras1==1 || pix>0.5 || pix<-0.5
                                    na=errordlg('O que introduziu n�o � uma coordenada v�lida.');
                                    waitfor(na);
                                    coorx=inputdlg('Introduza a coordenada (x) do m�ssel, entre -0.5 e 0.5 milhas.');
                                    pix=str2num(coorx{1});        
                                    letras1=isempty(pix);                                     
                                    end                                                                                                         
                        end

p_x(linhasto)=pix;

coory=inputdlg('Introduza a ordenada (y) do m�ssel, entre -0.5 e 0.5 milhas.');
piy=str2num(coory{1});            
            letras1=isempty(piy); 
                        if (letras1==1)|| piy>0.5 || piy<-0.5
                                    while letras1==1 || piy>0.5 || piy<-0.5
                                    na=errordlg('O que introduziu n�o � uma coordenada v�lida.');
                                    waitfor(na);
                                    coory=inputdlg('Introduza a ordenada (y) do m�ssel, entre -0.5 e 0.5 milhas.');
                                    piy=str2num(coory{1});        
                                    letras1=isempty(piy);                                     
                                    end                                                                                                         
                        end
p_y(linhasto)=piy;
dentro=0;
linhasx=size(posicoes_x,1);

%cria o poligno do navio e v� se o pix e piy no momneto correspondem em
%algum ponto do poligno. caso seja  dentro � verdadeiro, caso contr�rio �
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
%se dentro for falso mostra uma mensagem a dizer que nenhuma embarca��o fui
%atingida.
if dentro(1,linhasto)==0
a=msgbox('Nenhuma embarca��o foi atingida.');
                  waitfor(a);
else
         %caso contr�rio mostra uma mensagem a dizer que uma embarca��o fui atingida.
         a=msgbox('Uma embarca��o foi atingida.');
            waitfor(a);
end


%Pergunta ao utilizarse deseja continuar a tentar atingir as embarca��es,
%retomando ao ciclo de novo.

questao=questdlg('Deseja continuar a lan�ar m�sseis?','Continuar','Sim','N�o','a');

if questao == 'Sim'
            continuar=1;
            linhasto=linhasto+1;
            
else
            continuar=0;
end

end
end


