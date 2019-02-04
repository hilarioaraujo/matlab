function R2=line(a,b,c,d,e,f,g,h,k,a2,b2,c2,d2,e2)
conn=database('siga','',''); 
setdbprefs('DataReturnFormat','cellarray');
curs1 = exec(conn,'select * from SIGA_DOCENTE');
curs1 = fetch(curs1);
colnames1 = {'C�DIGO','PESSOA','IDENTIFICADOR','NOME_COLOQUIAL','NOME_COMPLETO','CATEGORIA','DEPARTAMENTO','IN�CIO','FIM'};
data1={a,b,c,d,e,f,g,h,k};
tablename = 'SIGA_DOCENTE';
insert(conn,tablename,colnames1,data1);
close(curs1);

curs2 = exec(conn,'select * from SIGA_TELEFONE_DE_PESSOA');
curs2 = fetch(curs2);
colnames2 = {'SUJEITO','TIPO','OBSERVA��O','N�MERO','EXTENS�O'};
data2={a2,b2,c2,d2,e2};
tablename = 'SIGA_TELEFONE_DE_PESSOA';
insert(conn,tablename,colnames2,data2);
close(curs2);
close(conn);

R2=msgbox('Opera��o completa','Resultado');