function [ num ] = pedir()
numero=inputdlg('Quantas embarcações deseja colocar na área?');
num=str2num(numero{1});        
letras1=isempty(num); 
numerointeiro=int64(num);
inteiro=(numerointeiro==num);
        if (letras1==1) || inteiro==0 || num<=0
            while letras1==1  || inteiro==0 || num<=0
                n=errordlg('O que introduziu não é um número válido.');
                waitfor(n);
                numero=inputdlg('Quantas embarcações deseja colocar na área?');
                num=str2num(numero{1});        
                letras1=isempty(num); 
                numerointeiro=int64(num);
                inteiro=(numerointeiro==num);
            end
        end

end

