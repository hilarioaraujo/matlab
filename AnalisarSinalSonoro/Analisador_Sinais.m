%--------------------------------------------------------------------------
% Cadeira: Análise de Sinais
% Docente: CTEN EN - AEL Fidalgo Neves
% Cadete: CAD EN - AEL ROCHA ARAÚJO
% Data: 01 de Dezembro de 2017

%Programa de Análise de um sinal sonoro
%--------------------------------------------------------------------------

% Limpar todo o conteúdo antes de executar a função.

close all
clear
clc

h=msgbox('Escolha o ficheiro de audio que pretende analisar e posteriormente tirar o ruído');
waitfor(h);
%Selecionar o ficheirode audio a ser analasisado. Returnando o nome do
%ficheiro e o diretório do mesmo (formato .wav)
[nome_som,diretorio] = uigetfile;
ficheiro=[diretorio nome_som];

%Função que irá returnar o sinal com o nº total de amostras, a taxa de
%amostragem, a duração do sinal, entre outros.
info = audioinfo(ficheiro);
num_amostras=info.TotalSamples; %taxa de amostragem - numero de amostras por segundo
durac_sinal=info.Duration; % duração do sinal em segundos
[amostras,taxa_amostragem]=audioread(ficheiro); %abre o ficheiro de audio selecionado, e returna as susas amostras bem como a taxa de amostragem
periodo=1/taxa_amostragem; %periodo em segundos, T=1/f

%Reproduz o sinal original
sound(amostras,taxa_amostragem);

h=msgbox('Irá ouvir agora o sinal original, clique no Ok, no fim de o ouvir.');
waitfor(h);

dominio_tempo=0:periodo:(num_amostras-1)/taxa_amostragem; %vetor do domínio no tempo

%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gráfico será mostrado na linha 1 coluna 1
subplot(3,2,1);
plot(dominio_tempo,amostras,'k');
grid on; % Mostra as linhas de grelha do gráfico.
xlabel('Tempo(segundos)');
ylabel('Amplitude');
title('Sinal Original - No domínio do tempo');

 
dominio_freq=0:taxa_amostragem/(num_amostras-1):taxa_amostragem; %vetor do dominio de frequências


% Ciclo para eliminar as frequências abaixo de 500Hz.
ft_sinal=fft(amostras); %Transformada de Fourier Discreta - para descobrir a componente de frequência de cada amostra

media_sinal=mean(ft_sinal);

%TOrna se necessário eliminar um pequeno ruído na banda de frequencias
%abaixo dos 500Hz devido à criação de uma onda sinosoide na produção do
%sinal com o ruido.
for kj = 1:length(dominio_freq)
    if dominio_freq(1,kj) <= 500
        
        %Função que coloca a amostra do sinal semelhante à média do sinal
        %das amostras do sinal original
       ft_sinal(kj,:) = ft_sinal(kj,:)/mean(abs(ft_sinal(kj,:)));
    end
end


%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gráfico será mostrado na linha 1 coluna 2
subplot(3,2,2)
plot(dominio_freq,abs(ft_sinal),'k'); 
title('Sinal Original - No domínio da frequência');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

%Calcula a média dos declives do sinal, isto é retorna a média dos declives
%do sinal, como o ruído têm muito maior amplitude, esse declive vai ser
%uma médua entre a amplitudo do sinal com o ruido. Adicionamos o 100 para
%compensar o baixo intervalo do declive. Valor descoberto feito para vários
%testes de som.
amplitude_ruido = std(ft_sinal)-150;

%SE a amostra do sinal for maior que a amplitude do ruído é atribuida um
%valor de amplitude 0 para anular o efeito do ruido
for j=1:length(ft_sinal)
    if abs(ft_sinal(j,1))>=abs(amplitude_ruido(1,1))
        ft_sinal(j,1) = ft_sinal(j,1)/mean(abs(ft_sinal(j,1)));
    end
end


%Faz o mesmo processo que em cima para amorteziar o ruído, isto é corrige
%de novo "as pontas soltas"
amplitude_ruido = std(ft_sinal)+150;

for j=1:length(ft_sinal)
    if abs(ft_sinal(j,1))>=amplitude_ruido(1,1)
        ft_sinal(j,:)=media_sinal(1,:);
    end
end


%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gráfico será mostrado na linha 2 coluna 1
subplot(3,2,4)
plot(dominio_freq,abs(ft_sinal),'k'); 
title('Sinal Sem Ruido - No domínio da frequência');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

%cálculo da inversa da nova matriz transf, isto é conversão do minio da
%frequencia para o dominio temporal, para ser possivel reproduzir lo.
sinal_sem_ruido=ifft(ft_sinal);

%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gráfico será mostrado na linha 2 coluna 2
subplot(3,2,3)
plot(dominio_tempo,sinal_sem_ruido,'k'); 
title('Sinal sem ruído - No domínio do tempo');
xlabel('Tempo (segundos)');
ylabel('Amplitude');

%Reprodução do sinal após eliminação do ruído.
sound(real(sinal_sem_ruido),taxa_amostragem);
h=msgbox('Irá ouvir agora o sinal sem ruído. Clique no Ok, no fim de o ouvir.');
waitfor(h);

%cálculo do desvio padrão das amplitudes e atenuação para metade o valor da
%norma de cada amplitude caso ultrapasse o desvio padrão
desvio_padrao=std(ft_sinal);
for j=1:length(ft_sinal)
    p_sinal=abs(ft_sinal(j,1));
    arg_sinal=angle(ft_sinal(j,1));
    if p_sinal>=desvio_padrao
        p_sinal=p_sinal/2;
    end
    ft_sinal(j,1)=p_sinal*cos(arg_sinal)+1i*p_sinal*sin(arg_sinal);
end

%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gráfico será mostrado na linha 3 coluna 1
subplot(3,2,6);
plot(dominio_freq,abs(ft_sinal),'k'); 
title('Sinal Sem ruído e com atenuação - No domínio da frequência');
xlabel('Frequência (Hz)');
ylabel('Magnitude');


%cálculo da inversa da nova matriz transf, após a atenuação
novo_sinal=ifft(ft_sinal);

%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gráfico será mostrado na linha 3 coluna 2
subplot(3,2,5);
plot(dominio_tempo,novo_sinal,'k'); 
title('Sinal Sem ruído e com atenuação - No domínio do tempo');
xlabel('Tempo (segundos)');
ylabel('Amplitude');

%Reprodução do sinal após atenuação.
sound(real(novo_sinal),taxa_amostragem);
h=msgbox('Irá ouvir agora o sinal sem ruído e com a atenuação. Clique no Ok, no fim de o ouvir.');
waitfor(h);

%pergunta para guardar o som analisado sem ruído, ou sem ruido e com
%atenuação.
a=questdlg('Deseja guardar qual som?','Guardar som','Som sem Ruído','Som sem Ruído e Atenuado','Nenhum','a');
switch a
    case 'Som sem Ruído'
        audiowrite(['sem_ruido_' nome_som],real(sinal_sem_ruido),taxa_amostragem);
    case 'Som sem Ruído e Atenuado'
        audiowrite(['sem_ruido_atenuado' nome_som],real(novo_sinal),taxa_amostragem);
    case 'Nenhum'
end

    