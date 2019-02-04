%1)Extração dos dados do Excel
%TEMPERATURA
%Posição:S79 30.00 W002 30.00 0-4500m
% [Temp_50_90]=xlsread('Dados.xlsx','B8:B27');
[~,Temp_50_90]=xlsread('Dados.xlsx','B8:B27');
Temp_50_90=str2num(cell2mat(Temp_50_90));

[P_50_90]=xlsread('Dados.xlsx','A8:A27');


%SALINIDADE 
%Posição:S79 30.00 W002 30.00 0-4500m
[~,Sal_50_90]=xlsread('Dados.xlsx','B36:B55');
for i=1:20
tudo(i)=str2num(Sal_50_90{i});
end
Sal_50_90=tudo';
%2)Cálculo da Velocidade do som com a função Velocidade_som
Vel_50_90=zeros(20,1);
Den_50_90=zeros(20,1);
for i=1:20
    Sal_50_90(i)
    Temp_50_90(i)
    P_50_90(i)
    aux1=Velocidade_som(Sal_50_90(i),Temp_50_90(i),P_50_90(i));
    
    aux2= Densidade(Sal_50_90(i),Temp_50_90(i),P_50_90(i));
    
    Vel_50_90(i)=aux1;
    Den_50_90(i)=aux2;
end

%4)Compilação final
Dados_50_90=[P_50_90, Temp_50_90, Sal_50_90,Vel_50_90,Den_50_90];


%Posição:S40 30.00 W128 30.00 0-4500m
[~, Temp_40_50]=xlsread('Dados.xlsx','D8:D27');
% Temp_40_50=str2num(cell2mat(Temp_40_50));

for i=1:20
tudoS(i)=str2num(Temp_40_50{i});
end
Temp_40_50=tudoS;


[P_40_50]=xlsread('Dados.xlsx','C8:C27');


% Sal_50_90=str2num(cell2mat(Sal_50_90));

%Posição:S40 30.00 W128 30.00 0-4500m
[~,Sal_40_50]=xlsread('Dados.xlsx','D36:D55');
for i=1:20
tudo(i)=str2num(Sal_40_50{i});
end
Sal_40_50=tudo;




Vel_40_50=zeros(20,1);
Den_40_50=zeros(20,1);
for i=1:20
    aux3=Velocidade_som(Sal_40_50(i),Temp_40_50(i),P_40_50(i));
    aux4= Densidade(Sal_40_50(i),Temp_40_50(i),P_40_50(i));
    Vel_40_50(i)=aux3;
    Den_40_50(i)=aux4;
    
end


Dados_40_50={P_40_50, Temp_40_50, Sal_40_50,Vel_40_50,Den_40_50};