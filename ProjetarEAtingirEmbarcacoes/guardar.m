


function [ ] = guardar( posicoes_x,posicoes_y,p_x,p_y,cores,dentro )
guardar=questdlg('Deseja guardar o jogo?','Guardar jogo', 'Sim, é o que pretendo.','Não fica para a próxima.','s');
if strcmp(guardar,'Sim, é o que pretendo.')
   
            cg=exist('jogos.mat');
            if cg~=0
                        load('jogos.mat');
                        njogos=size(jogos,2);
                        guardar=1+njogos;            
                        jogos(guardar).Data=now;
                        jogos(guardar).posicoes_x  = posicoes_x;
                        jogos(guardar).posicoes_y= posicoes_y;
                        jogos(guardar).p_x = p_x;
                        jogos(guardar).p_y = p_y;
                        jogos(guardar).cores= cores;
                        jogos(guardar).dentro = dentro;
                        a=msgbox(['O jogo foi guardado. Caso queira jogar mais tarde o número deste jogo é: ' num2str(guardar)]);
                        waitfor(a);
            
            else
                        field1 = 'Data';  value1 = now;
                        field2 = 'posicoes_x';  value2 = posicoes_x;
                        field3 = 'posicoes_y';  value3 = posicoes_y;
                        field4 = 'p_x';  value4 = p_x;
                        field5 = 'p_y';  value5 = p_y;
                        field6 = 'cores'; value6 = cores;
                        field7 = 'dentro'; value7 = dentro;
                        jogos=struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7);
                        a=msgbox('O jogo foi guardado. Não tinha mais nenhum jogo. Caso queira jogar mais tarde o número deste jogo é: 1');
                        waitfor(a);
            end
            
            save jogos
else
         close
end
end

