function [ As,Zn,Znlimite ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,grau,bk )
if grau==0
    for as=1:size(yn,1)
                if z>= Zconves
                    Znlimite(as,1)=Zconves;
                elseif z<= Zcasco(as,1)
                    Znlimite(as,1)=Zcasco(as,1);
                else
                    Znlimite(as,1)=z;
                end

                Zn(as,1)=Znlimite(as,1)-Zcasco(as,1);
    end
    As=trapz(yn,Zn);

else
    mr=tan(grau);
    for as=1:size(yn,1)
            ZnLa(as,1)=(mr*yn(as,1))+bk;
            
            if ZnLa(as,1)>= Zconves
                Znlimite(as,1)=Zconves;
            elseif ZnLa(as,1)<= Zcasco(as,1)
                Znlimite(as,1)=Zcasco(as,1);
            else
                Znlimite(as,1)=ZnLa(as,1);
            end

              Zn(as,1)=Znlimite(as,1)-Zcasco(as,1);
        end
        
        As= trapz(yn,Zn); %área das secções na condição inclinada

end

end

