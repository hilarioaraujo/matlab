function [emb_x,emb_y] = rumo( emb_x,emb_y )
            posx=randi([-50 50])/100;
                        emb_x(1,1:6)=emb_x(1,1:6)+posx;
            
            posy=randi([-50 50])/100;
                        emb_y(1,1:6)=emb_y(1,1:6)+posy;
                        
            rumo=randi([0 360]);
                        [THETA,RHO] = cart2pol(emb_x,emb_y);
                        THETA=radtodeg(THETA);
                         
                                    for as=1:6
                                    emb_x(1,as)=RHO(1,as)*cosd(THETA(1,as)+rumo);
                                    emb_y(1,as)=RHO(1,as)*sind(THETA(1,as)+rumo);
                                    end
                                    
                         end


