function [ novo ] = tipo_jogo( )

% Objetivo da fun��o = Perguntar ao utilzador se quer come�ar um novo jogo.

desejo=menu('Quer come�ar um continuar o jogo anterior ou come�ar um novo jogo?', 'Continuar o jogo anterior' , 'Come�ar um novo jogo');

switch desejo
            case 1
                        novo=0;
            case 2
                        novo=1;
            otherwise
                return
end
end

