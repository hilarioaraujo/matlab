%--------------------------------------------------------------------------
% Nome do programa/fun��o: gr�fico
% Objetivo: Esta fun��o representa graficamente todas as embarca��es, numa �rea de 0,5x0,5 milhas n�uticas, com as respetivas cores. 
% mostra os m�sseis lan�ados: a verde os que atingiram alguma embarca��o e a vermelhos os restantes.
%
% Par�metros de entrada: posicoes_x, posicoes_y, p_x, p_y, cores, dentro
% Valor retornado: 
%
% Autores: n�131 Rocha Ara�jo, n�182 Paulo Fernandes, n�185 L�zaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [] = grafico(posicoes_x, posicoes_y, p_x, p_y, cores, dentro)
    
    num = contar_emb(posicoes_x);    
    
    %  Definir uma legenda com todas as cores, isto porque s�o adicionados
    %  pontos nao visiveis com essas cores, para que mesmo que as cores nao
    %  estejam todas desenhadas o utilizador saiba sempre que cores
    %  representam quem(navios).
    
    [~, texto, ~] = xlsread('Embarca��es.xlsx');
    i = 2;
    hold on % permitir v�rios plots em simult�neo
    
    while i <= 10
       plot(0,0,char(texto(i,2))); 
       i = i + 2;
    end
    
    % colocar em legenda apenas as classes das embarca��es
    %  texto(2:2:end,1) retorna o cell array com as classes das embarca��es
    legend(texto(2:2:end,1));    
    
 
    for i=1:num
        % desenhar um poligono dado por uma dada linha das matrizes de
        % posicoes e pint�-lo por dentro com a cor respectiva
        fill(posicoes_x(i,:), posicoes_y(i,:), cores(i));
        
    end
    
    for i=1:size(p_x,2)
        if dentro(i) == 1
            % se acertou desenhar ponto em forma de asterisco verde
            plot(p_x(i), p_y(i),'*g');
        else
            % sen�o desenhar ponto em forma de asterisco vermelho
            plot(p_x(i), p_y(i),'*r');
        end
    end
    
    %determina os limites do grafico.
    axis([-0.5 0.5 -0.5 0.5]);
    %legenda para o eixo do x
    xlabel('Eixo dos X''s (em milhas)');
    %legenda para o eixo dos y
    ylabel('Eixo dos Y''s (em milhas)');
    %define um titulo para o projeto
    title('Projeto de Introdu��o � Programa��o - Batalha Naval');
end

