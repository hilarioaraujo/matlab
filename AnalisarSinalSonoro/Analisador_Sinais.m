%--------------------------------------------------------------------------
% Cadeira: An�lise de Sinais
% Docente: CTEN EN - AEL Fidalgo Neves
% Cadete: CAD EN - AEL ROCHA ARA�JO
% Data: 01 de Dezembro de 2017

%Programa de An�lise de um sinal sonoro
%--------------------------------------------------------------------------

% Limpar todo o conte�do antes de executar a fun��o.

close all
clear
clc

h=msgbox('Escolha o ficheiro de audio que pretende analisar e posteriormente tirar o ru�do');
waitfor(h);
%Selecionar o ficheirode audio a ser analasisado. Returnando o nome do
%ficheiro e o diret�rio do mesmo (formato .wav)
[nome_som,diretorio] = uigetfile;
ficheiro=[diretorio nome_som];

%Fun��o que ir� returnar o sinal com o n� total de amostras, a taxa de
%amostragem, a dura��o do sinal, entre outros.
info = audioinfo(ficheiro);
num_amostras=info.TotalSamples; %taxa de amostragem - numero de amostras por segundo
durac_sinal=info.Duration; % dura��o do sinal em segundos
[amostras,taxa_amostragem]=audioread(ficheiro); %abre o ficheiro de audio selecionado, e returna as susas amostras bem como a taxa de amostragem
periodo=1/taxa_amostragem; %periodo em segundos, T=1/f

%Reproduz o sinal original
sound(amostras,taxa_amostragem);

h=msgbox('Ir� ouvir agora o sinal original, clique no Ok, no fim de o ouvir.');
waitfor(h);

dominio_tempo=0:periodo:(num_amostras-1)/taxa_amostragem; %vetor do dom�nio no tempo

%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gr�fico ser� mostrado na linha 1 coluna 1
subplot(3,2,1);
plot(dominio_tempo,amostras,'k');
grid on; % Mostra as linhas de grelha do gr�fico.
xlabel('Tempo(segundos)');
ylabel('Amplitude');
title('Sinal Original - No dom�nio do tempo');

 
dominio_freq=0:taxa_amostragem/(num_amostras-1):taxa_amostragem; %vetor do dominio de frequ�ncias


% Ciclo para eliminar as frequ�ncias abaixo de 500Hz.
ft_sinal=fft(amostras); %Transformada de Fourier Discreta - para descobrir a componente de frequ�ncia de cada amostra

media_sinal=mean(ft_sinal);

%TOrna se necess�rio eliminar um pequeno ru�do na banda de frequencias
%abaixo dos 500Hz devido � cria��o de uma onda sinosoide na produ��o do
%sinal com o ruido.
for kj = 1:length(dominio_freq)
    if dominio_freq(1,kj) <= 500
        
        %Fun��o que coloca a amostra do sinal semelhante � m�dia do sinal
        %das amostras do sinal original
       ft_sinal(kj,:) = ft_sinal(kj,:)/mean(abs(ft_sinal(kj,:)));
    end
end


%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gr�fico ser� mostrado na linha 1 coluna 2
subplot(3,2,2)
plot(dominio_freq,abs(ft_sinal),'k'); 
title('Sinal Original - No dom�nio da frequ�ncia');
xlabel('Frequ�ncia (Hz)');
ylabel('Magnitude');

%Calcula a m�dia dos declives do sinal, isto � retorna a m�dia dos declives
%do sinal, como o ru�do t�m muito maior amplitude, esse declive vai ser
%uma m�dua entre a amplitudo do sinal com o ruido. Adicionamos o 100 para
%compensar o baixo intervalo do declive. Valor descoberto feito para v�rios
%testes de som.
amplitude_ruido = std(ft_sinal)-150;

%SE a amostra do sinal for maior que a amplitude do ru�do � atribuida um
%valor de amplitude 0 para anular o efeito do ruido
for j=1:length(ft_sinal)
    if abs(ft_sinal(j,1))>=abs(amplitude_ruido(1,1))
        ft_sinal(j,1) = ft_sinal(j,1)/mean(abs(ft_sinal(j,1)));
    end
end


%Faz o mesmo processo que em cima para amorteziar o ru�do, isto � corrige
%de novo "as pontas soltas"
amplitude_ruido = std(ft_sinal)+150;

for j=1:length(ft_sinal)
    if abs(ft_sinal(j,1))>=amplitude_ruido(1,1)
        ft_sinal(j,:)=media_sinal(1,:);
    end
end


%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gr�fico ser� mostrado na linha 2 coluna 1
subplot(3,2,4)
plot(dominio_freq,abs(ft_sinal),'k'); 
title('Sinal Sem Ruido - No dom�nio da frequ�ncia');
xlabel('Frequ�ncia (Hz)');
ylabel('Magnitude');

%c�lculo da inversa da nova matriz transf, isto � convers�o do minio da
%frequencia para o dominio temporal, para ser possivel reproduzir lo.
sinal_sem_ruido=ifft(ft_sinal);

%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gr�fico ser� mostrado na linha 2 coluna 2
subplot(3,2,3)
plot(dominio_tempo,sinal_sem_ruido,'k'); 
title('Sinal sem ru�do - No dom�nio do tempo');
xlabel('Tempo (segundos)');
ylabel('Amplitude');

%Reprodu��o do sinal ap�s elimina��o do ru�do.
sound(real(sinal_sem_ruido),taxa_amostragem);
h=msgbox('Ir� ouvir agora o sinal sem ru�do. Clique no Ok, no fim de o ouvir.');
waitfor(h);

%c�lculo do desvio padr�o das amplitudes e atenua��o para metade o valor da
%norma de cada amplitude caso ultrapasse o desvio padr�o
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
%gr�fico ser� mostrado na linha 3 coluna 1
subplot(3,2,6);
plot(dominio_freq,abs(ft_sinal),'k'); 
title('Sinal Sem ru�do e com atenua��o - No dom�nio da frequ�ncia');
xlabel('Frequ�ncia (Hz)');
ylabel('Magnitude');


%c�lculo da inversa da nova matriz transf, ap�s a atenua��o
novo_sinal=ifft(ft_sinal);

%Cria uma matriz de figuras, de 3 linhas e 2 colunas, sendo que este
%gr�fico ser� mostrado na linha 3 coluna 2
subplot(3,2,5);
plot(dominio_tempo,novo_sinal,'k'); 
title('Sinal Sem ru�do e com atenua��o - No dom�nio do tempo');
xlabel('Tempo (segundos)');
ylabel('Amplitude');

%Reprodu��o do sinal ap�s atenua��o.
sound(real(novo_sinal),taxa_amostragem);
h=msgbox('Ir� ouvir agora o sinal sem ru�do e com a atenua��o. Clique no Ok, no fim de o ouvir.');
waitfor(h);

%pergunta para guardar o som analisado sem ru�do, ou sem ruido e com
%atenua��o.
a=questdlg('Deseja guardar qual som?','Guardar som','Som sem Ru�do','Som sem Ru�do e Atenuado','Nenhum','a');
switch a
    case 'Som sem Ru�do'
        audiowrite(['sem_ruido_' nome_som],real(sinal_sem_ruido),taxa_amostragem);
    case 'Som sem Ru�do e Atenuado'
        audiowrite(['sem_ruido_atenuado' nome_som],real(novo_sinal),taxa_amostragem);
    case 'Nenhum'
end

    