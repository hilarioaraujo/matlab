%--------------------------------------------------------------------------
% Nome do programa/função: gráfico
% Objetivo: Esta função representa graficamente todas as embarcações, numa área de 0,5x0,5 milhas náuticas, com as respetivas cores. 
% mostra os mísseis lançados: a verde os que atingiram alguma embarcação e a vermelhos os restantes.
%
% Parâmetros de entrada: posicoes_x, posicoes_y, p_x, p_y, cores, dentro
% Valor retornado: 
%
% Autores: nº131 Rocha Araújo, nº182 Paulo Fernandes, nº185 Lázaro Salumbo
%          
% Data: 20-12-2015
%--------------------------------------------------------------------------

function [] = grafico(posicoes_x, posicoes_y, p_x, p_y, cores, dentro)
    
    num = contar_emb(posicoes_x);    
    
    %  Definir uma legenda com todas as cores, isto porque são adicionados
    %  pontos nao visiveis com essas cores, para que mesmo que as cores nao
    %  estejam todas desenhadas o utilizador saiba sempre que cores
    %  representam quem(navios).
    
    [~, texto, ~] = xlsread('Embarcações.xlsx');
    i = 2;
    hold on % permitir vários plots em simultá¢neo
    
    while i <= 10
       plot(0,0,char(texto(i,2))); 
       i = i + 2;
    end
    
    % colocar em legenda apenas as classes das embarcações
    %  texto(2:2:end,1) retorna o cell array com as classes das embarcações
    legend(texto(2:2:end,1));    
    
 
    for i=1:num
        % desenhar um poligono dado por uma dada linha das matrizes de
        % posicoes e pintá-lo por dentro com a cor respectiva
        fill(posicoes_x(i,:), posicoes_y(i,:), cores(i));
        
    end
    
    for i=1:size(p_x,2)
        if dentro(i) == 1
            % se acertou desenhar ponto em forma de asterisco verde
            plot(p_x(i), p_y(i),'*g');
        else
            % senão desenhar ponto em forma de asterisco vermelho
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
    title('Projeto de Introdução á  Programação - Batalha Naval');
end

