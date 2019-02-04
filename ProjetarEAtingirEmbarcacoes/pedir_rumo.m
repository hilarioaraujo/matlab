function [emb_x,emb_y] = pedir_rumo( emb_x,emb_y )
            linhas=1;
            posx1=inputdlg('Introduza a coordenada x, entre -0.5 e 0.5 milhas');
            posx=str2num(posx1{1});            
            letras1=isempty(posx); 
                        if (letras1==1)|| posx>0.5 || posx<-0.5
                                    while letras1==1 || posx>0.5 || posx<-0.5
                                    na=errordlg('O que introduziu não é uma coordenada válida.');
                                    waitfor(na);
                                    posx1=inputdlg('Introduza a coordenada x, entre -0.5 e 0.5 milhas.');
                                    posx=str2num(posx1{1});        
                                    letras1=isempty(posx);                                     
                                    end                                                                                                         
                        end
                        emb_x(linhas,1:6)=emb_x(linhas,1:6)+posx;
            
            posy1=inputdlg('Introduza a ordenada y, entre -0.5 e 0.5 milhas.');
            posy=str2num(posy1{1});        
            letras1=isempty(posy); 
                        if (letras1==1) || posy>0.5 || posy<-0.5
                                    while letras1==1 || posy>0.5 || posy<-0.5
                                    na=errordlg('O que introduziu não é uma ordenada válida.');
                                    waitfor(na);
                                    posy1=inputdlg('Introduza a ordenada y, entre -0.5 e 0.5 milhas.');
                                    posy=str2num(posy1{1});        
                                    letras1=isempty(posy); 
                                    end
                                                                      
                        end
                        emb_y(linhas,1:6)=emb_y(linhas,1:6)+posy;
                        
                        counterd=2;
                        while counterd==2
                        rumos1=inputdlg('Introduza o rumo do navio, entre 0 a 360º:');
                        rumo=str2num(rumos1{1});
                        letras1=isempty(rumo); 
                        if (letras1==1)|| rumo<0 || rumo>360
                                    cad=errordlg('O valor que introduziu não é válido.');
                                    waitfor(cad);
                                    counterd=2;
                        else
                                    counterd=1;
                        end
                        end 
                       
                        %emb_x=emb_x*cosd(rumo)-emb_y*sind(rumo);
                        %emb_y=paraangulo*sind(rumo)-emb_y*cosd(rumo);
                        [THETA,RHO] = cart2pol(emb_x,emb_y);
                        THETA=radtodeg(THETA);
                         
                                    for as=1:6
                                    emb_x(1,as)=RHO(1,as)*cosd(THETA(1,as)+rumo);
                                    emb_y(1,as)=RHO(1,as)*sind(THETA(1,as)+rumo);
                                    end
                      


end

