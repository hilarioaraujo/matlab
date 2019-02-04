function [ novo ] = tipo_jogo( )

% Objetivo da função = Perguntar ao utilzador se quer começar um novo jogo.

desejo=menu('Quer começar um continuar o jogo anterior ou começar um novo jogo?', 'Continuar o jogo anterior' , 'Começar um novo jogo');

switch desejo
            case 1
                        novo=0;
            case 2
                        novo=1;
            otherwise
                return
end
end

