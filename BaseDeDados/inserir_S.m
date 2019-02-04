function [ insertab ] = inserir_S( dados1,colunas)
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
setdbprefs('DataReturnFormat','cellarray');

nelementos = exec(conn,'select * FROM SIGA_EM_UNIDADE_CURRICULAR');
nelementos = fetch(nelementos);
nelementos.Data;
tabelainicial=numel(nelementos.Data);
close(nelementos);

datainsert(conn,'SIGA_ALUNO_EM_UNIDADE_CURRICULAR',colunas,dados1);
nelementos = exec(conn,'select * FROM SIGA_EM_UNIDADE_CURRICULAR');
nelementos = fetch(nelementos);
nelementos.Data;
tabelafinal=numel(nelementos.Data);
close(nelementos);

if tabelafinal==tabelainicial
    insertab=0;
else
    insertab=1;
    
end
end
