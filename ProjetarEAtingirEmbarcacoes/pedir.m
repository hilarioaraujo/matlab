function [ num ] = pedir()
numero=inputdlg('Quantas embarca��es deseja colocar na �rea?');
num=str2num(numero{1});        
letras1=isempty(num); 
numerointeiro=int64(num);
inteiro=(numerointeiro==num);
        if (letras1==1) || inteiro==0 || num<=0
            while letras1==1  || inteiro==0 || num<=0
                n=errordlg('O que introduziu n�o � um n�mero v�lido.');
                waitfor(n);
                numero=inputdlg('Quantas embarca��es deseja colocar na �rea?');
                num=str2num(numero{1});        
                letras1=isempty(num); 
                numerointeiro=int64(num);
                inteiro=(numerointeiro==num);
            end
        end

end

