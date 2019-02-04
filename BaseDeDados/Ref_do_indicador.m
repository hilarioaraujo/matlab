function [ perc,palopsmec ] = Ref_do_indicador( ano )
[n,o,ligacao]=xlsread('ligacao.xlsx');
db.nome=ligacao(1,2);
db.loca=ligacao(2,2);
db.username=cell2mat(ligacao(4,2));
db.password=cell2mat(ligacao(5,2));
if isnan(db.username)==1
    db.username='';
end
if isnan(db.password)==1
    db.password='';
end

db.loc.nam=[db.loca '\' db.nome];

url=[['jdbc:odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};DSN='';DBQ='],db.loc.nam];
url=cell2mat(url);
conn = database('',db.username,db.password,'sun.jdbc.odbc.JdbcOdbcDriver',url);
con=isconnection(conn);
if con==0
       while con ==0             
            a=msgbox('Corrija os dados sobre a database no Documento Excel - ligacao.xlsx');
            waitfor(a);  
            conn = database('',db.username,db.password,'sun.jdbc.odbc.JdbcOdbcDriver',url);
            con=isconnection(conn);
       end
   
end

a=msgbox('Foi estabelecida ligação à base de dados');
waitfor(a);

interna=fetch(conn, ['select distinct NOME from SIGA_ALUNO where ANO_LECTIVO_ENTRADA=',num2str(ano),'and NACIONALIDADE <> ''PT'' and (SIGA_ALUNO.CURSO_DE_ENTRADA=34 or SIGA_ALUNO.CURSO_DE_ENTRADA=35 or SIGA_ALUNO.CURSO_DE_ENTRADA=36 or SIGA_ALUNO.CURSO_DE_ENTRADA=45)']);
anoalu=fetch(conn, ['select distinct NOME from SIGA_ALUNO where ANO_LECTIVO_ENTRADA=',num2str(ano)]);
palops=size(interna);
palopsmec=interna;
total=size(anoalu);
perc=(palops/total)*100;
    
end

