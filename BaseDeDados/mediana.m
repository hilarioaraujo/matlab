function R=mediana(ano)
conn=database('siga','',''); 
setdbprefs('DataReturnFormat','cellarray');
ano=num2str(ano);
sqlquery = ['select NOME, ANO_LECTIVO_ENTRADA, CLASSIFICAÇÃO_DE_ENTRADA from SIGA_ALUNO where CURSO_DE_ENTRADA=17 and ANO_LECTIVO_ENTRADA=',ano];
%'ano'= input da function%
AN = fetch(conn,sqlquery);
AN_ano=[AN{:,3}]';
R=median(AN_ano);
