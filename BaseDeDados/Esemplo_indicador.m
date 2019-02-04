clear
clc

a=input('Ano lectivo:   ');
conn=database('SIGA','','');
   
dados1=fetch(conn, ['select distinct NOME from SIGA_ALUNO where ANO_LECTIVO_ENTRADA=',num2str(a),'and NACIONALIDADE <> ''PT'' and (SIGA_ALUNO.CURSO_DE_ENTRADA=34 or SIGA_ALUNO.CURSO_DE_ENTRADA=35 or SIGA_ALUNO.CURSO_DE_ENTRADA=36 or SIGA_ALUNO.CURSO_DE_ENTRADA=45)']);
dados2=fetch(conn, ['select distinct NOME from SIGA_ALUNO where ANO_LECTIVO_ENTRADA=',num2str(a)]);
A=size(dados1);
B=size(dados2);
C=A(1);
D=B(1);
perc=(A/B)*100;
disp([num2str(perc) '%'])
