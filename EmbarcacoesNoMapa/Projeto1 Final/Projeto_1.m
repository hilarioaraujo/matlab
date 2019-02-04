clear all
clc

%As proximas 3 linhas de comando irão criar um mapa mundo em que os
%continentes serão representados a vermelho e os rios principais a azul
figure
geoshow('landareas.shp', 'FaceColor',[1 0 0]);
geoshow('worldrivers.shp','Color', 'blue')
axis([-180 180 -90 90]);
hold on

%O programa do sonar inicia-se com uma msgbox para introduzir ao utilizador
%as funções do programa
h=msgbox('Seja benvindo ao Sonar v2.0, localize o seu navio na carta e preencha o restantes dados de forma a detetar os mergulhadores.', 'SONAR');

%Utiliza-se a função waitfor para a caixa de introdução de dados espere
%pela visualização por parte do utilizador da msgbox
waitfor(h)

%Os dados serão introduzidos no programa atravez de uma inputdlg
dados = inputdlg({'Longitude (-180º (W) : 180º (E)', 'Latitude (-90ºS : 90ºN)', 'Rumo', 'Alcance máximo do sonar (milhas)', 'Ângulo de alcance do sonar (graus)','Número de mergulhadores'}, 'posição', 1);

%Colocar todos os dados introduzidos na inputdlg em double
d=str2double(dados);
x=d(1);
y=d(2);
rumo=d(3);
alc=d(4);
ang=d(5);
mer=d(6);

%A proxima linha de codigo ira invocar a função que contem a contrução da
%zona abrangida pelo sonar
[ s,w ] = sonar( x,y,rumo,alc,ang );

%As proximas linhas intitulam o eixo x, o eixo do y e o grafico.  A linha
%40 preenche com a cor amarela a zona abrangida pelo sonar
xlabel('Longitude (-180º (W) : 180º (E))');
ylabel('Latitude (-90ºS : 90ºN)');
title('Sonar')
plot(x,y,'kv')
sonar=fill(s,w,'y');
hold all

%O Ciclo 'para' abaixo construido gera uma abcissa e coordenada (aleatorios) por cada
%numero de mergulhador indicado pelo utilizador
for i=1:mer
merx(i)=randi([x-alc,alc+x]); 
mery(i)=randi([y-alc,alc+y]);

end

%A função analisa se existem pontos dentro da area abrangida pelo sonar, se
%estes estão dentro o ponto será representado por uma bola de cor azul, se
%estes não estão dentro o ponto será representado por uma cruz vermelha.
[in]=inpolygon(merx,mery,s,w);
plot(merx(in),mery(in),'bo',merx(~in),mery(~in),'rx');

%Legenda a figura
legend('Navio','Sonar','Mergulhadores detetados','Mergulhadores não detetados','Location','northoutside','Orientation','horizontal')

hold all

%O proximo ciclo para calcula o numero de mergulhadores existentes dentro
%da zona abrangida pelo sonar
nmerg=0;
for a=1:mer
        if in(1,a)==1
            nmerg=nmerg+1;
        end
end
 min=50;
% Se existir mergulhadores dentro da zona abrangida pelo sonar será
% exibida uma mensagem com o numero de mergulhadores encontrados e um
% aviso personalizado. Caso não seja encontrado nenhum mergulhador é exibida uma caixa
% com essa mensagem
%Para calcular a distancia do mergulhador mais proximo utiliza-se um ciclo 'para' que calcula a distancia 
%a todos os mergulhadores, mas selecionando o menor valor e apresentando-o.
if nmerg>0 
    mens = warndlg(['Cuidado, existem ' num2str(nmerg) ' mergulhadores no seu caminho, tenha especial atenção à posição deles']);
    waitfor(mens);
    q=questdlg('Quer saber a que distância a que se encontra o mergulhador mais próximo detetado no radar?','Distância', 'Sim','Não','Sim');
    comp=strcmp(q,'Sim');
    if comp==1
            for a=1:mer
               
                if in(1,a)==1
                    d=round(sqrt((x-merx(a))^2+(y-mery(a))^2));                   
                    if d<min
                        min=d;
                    end
                end                      
            end
            
            f=(['O mergulhador mais próximo está a ' num2str(min) ' milhas']);
            as=msgbox(f);
            waitfor(as);
    else
        return;
    end
else
    hope=msgbox('Não há mergulhadores nas proximidades, pode continuar a navegar em segurança');
    waitfor(hope);
end

%As proximas linhas de codigo vao permitir ao utilizador escolher um ponto
%no mapa, atraves da função 'getpts', fazendo de seguida um ciclo para
%calcular a distancia aos pontos desejados e o rumo a seguir ate ao utilizador determinar que
%não o quer fazer mais. É tambem possivel calcular o rumo a que o ponto
%esta da proa do navio
h=questdlg('Deseja saber a distância de um waypoint/mergulhador comparativo à proa do seu navio e o rumo que terá de seguir para o alcançar?','Distância', 'Sim','Não','Cancelar');
tp=strcmp(h,'Sim');
if tp==1
    t=msgbox('Agora terá de selecionar um ponto no gráfico com o mouse, carregando em SHIFT + RIGHT MOUSE');
    waitfor(t);
while tp==1
           [x1, y1] = getpts(1);          
           dis=round(sqrt((x-x1)^2+(y-y1)^2));
           rum=mod((atan2(y-y1,x-x1)),(2*pi));
             if rum==0
                 ru=rum; 
             else
           
                 ru=round(360 - ((rum+pi/2)*180/pi));   % converte o angulo de radianos para graus
                 if ru<0
                     ru=(90+ru)+270;        % para os angulos negativos, converte os para positivos e posiciona os corretamente no rumo certo
                 end
             end
        
           pe=warndlg(['O obstáculo está a ' num2str(dis) ' milhas da proa do seu navio, terá de seguir o rumo ' num2str(ru) ' para o alcançar.']);
           waitfor(pe);
           h=questdlg('Deseja saber a distância de um waypoint/mergulhador comparativo à proa do seu navio e o rumo que terá de seguir para o alcançar?','Distância', 'Sim','Não','Cancelar');
           tp=strcmp(h,'Sim');
end

else
    return
end
