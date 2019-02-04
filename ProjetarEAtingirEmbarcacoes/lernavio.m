function [ emb_x, emb_y, cor ] = lernavio()
[o,o,navyships]=xlsread('Embarcações.xlsx');
            tipoship=randi([1 5]);
            switch tipoship
                         case 1
                                    emb_x=cell2mat(navyships(2,4:9));
                                    emb_y=cell2mat(navyships(3,4:9));
                                    cor=cell2mat(navyships(2,2));
                        case 2                             
                                    emb_x=cell2mat(navyships(4,4:9));
                                    emb_y=cell2mat(navyships(5,4:9));
                                    cor=cell2mat(navyships(4,2));
                        case 3
                                    emb_x=cell2mat(navyships(6,4:9));
                                    emb_y=cell2mat(navyships(7,4:9));
                                    cor=cell2mat(navyships(6,2));
                                    
                        case 4
                                    emb_x=cell2mat(navyships(8,4:9));
                                    emb_y=cell2mat(navyships(9,4:9));
                                    cor=cell2mat(navyships(8,2));
                        case 5
                                    emb_x=cell2mat(navyships(10,4:9));
                                    emb_y=cell2mat(navyships(11,4:9));
                                    cor=cell2mat(navyships(10,2));
            end

[ emb_x, emb_y ] = converter( emb_x, emb_y );                                                                  
[emb_x,emb_y] = rumo( emb_x,emb_y );


end

