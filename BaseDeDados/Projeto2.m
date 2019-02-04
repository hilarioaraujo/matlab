clear
clc
boasvindas=msgbox('Bem vindo ao Programa SIGA v2.2');
waitfor(boasvindas);
tema=msgbox('No �mbito do processo de avalia��o e acredita��o dos cursos da EN por parte da A3ES, nomeadamente no apoio � tomada de decis�o por parte das comiss�es externas de avalia��o, � importante utilizar indicadores de desempenho para apoiar este processo. Uma forma de obter estes indicadores de uma forma autom�tica, din�mica e optativa, consiste na utiliza��o de algoritmos, que pesquisem a base de dados do SIGA e produzam os indicadores.');

waitfor(tema);
f=225;
while f==225
ma={'O que deseja fazer?'; 'Obter indicador I1_8 - selecione "Indicador"';'Percentagem de alunos de Engenharia Mec�nica cuja resid�ncia permanente � no estrangeiro'; 'Inserir dados na tabela - selecione "Inserir"'};
q=questdlg(ma,'Func�o','Indicador','Inserir','cancelar','n');
switch q
    case 'Indicador'
        ano=inputdlg('Qual � o ano letivo ao qual deseja obter o indicador (desde 1999 at� 2014) ?');
        ano=cell2mat(ano);
        anos=str2double(ano);
        n=isnan(anos);
        if (n ==1) || (anos>2014) || (anos<1999)
            while n==1 || (anos>2014) || (anos<1999)            
                gh=warndlg('O que introduziu n�o � um n�mero/n�o ha dados para o ano letivo.');
                waitfor(gh);
                ano=inputdlg('Qual � o ano letivo ao qual deseja obter o indicador?');
                ano=cell2mat(ano);
                anos=str2double(ano);  
                n=isnan(anos);
                while (anos>2014) || (anos<1999)           
                    gh=warndlg('O que introduziu n�o � um n�mero/n�o ha dados para o ano letivo.');
                    waitfor(gh);
                    ano=inputdlg('Qual � o ano letivo ao qual deseja obter o indicador?');
                    ano=cell2mat(ano);
                    anos=str2double(ano);  
                    n=isnan(anos);
                   
                end
            end
           end       
       
        [ perc, palopsmec ] = Ref_do_indicador( ano );
        palopsinf=isempty(palopsmec);
        if palopsinf==0
                a=msgbox(['Os alunos de mestrado/licenciatura de Engenharia Mec�nica, cuja resid�ncia permanente � no estrangeiro s�o:'; palopsmec;'A percentagem � ' num2str(perc) '%']);
                waitfor(a)
        
        else
                a=msgbox(['N�o existem alunos de mestrado/licenciatura de Engenharia Mec�nica, cuja resid�ncia permanente � no estrangeiro no ano letivo ' ano '.']);
                waitfor(a)  
        end
        
    case 'Inserir'
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
if isconnection(conn)==1
    a=msgbox('Foi estabelecida liga��o � base de dados');
    waitfor(a);
    
else
    a=msgbox('Corrija os dados sobre a database no Documento Excel - ligacao.xlsx');
    waitfor(a);  
    z=questdlg('J� corrigiu os dados da sua database?','Database','Sim','N�o','Cancelar','n');
    switch z
        case 'Sim'
            clear conn
            clc
            conn = database('',db.username,db.password,'sun.jdbc.odbc.JdbcOdbcDriver',url);
            setdbprefs('DataReturnFormat','cellarray');
            return 
        case 'N�o'
            return
        case 'Cancelar'
            break 
    end
end
        nome_colunas=columns(conn,'','','SIGA_ALUNO_EM_UNIDADE_CURRICULAR');
        j=msgbox('Selecione as colunas da Tabela para adicionar os dados que deseja');
waitfor(j);
dad=1;

aluno1=0;
aluno=0;
unidade1=0;
unidade=0;
ano_lectivo=0;
ano_lectivo1=0;
tipo_periodo={'g'};
periodo_lectivo=0;
classificacao_insc=0;
classificacao_insc1=0;
classificacao_final=0; 
classificacao_final1=0;
nota_freq=0; 
nota_freq1=0;
resultado={'l'};
colunas={0};
dados={0};

while dad==1
c=menu('Colunas da Tabela',[nome_colunas,'Inserir os dados']);
switch c
    case 1 %'ALUNO' 
       nomealunos=fetch(conn,'Select Nome From SIGA_ALUNO');
       [pos, n]=listdlg('PromptString','Selecione o nome do aluno:','SelectionMode','single','ListString',nomealunos);
       aluno=fetch(conn,['Select C�DIGO From SIGA_ALUNO where NOME=''' nomealunos{pos} '''']);
       aluno1=aluno{1};
       aluno=num2str(aluno{1});

        
    case 2 %'UNIDADE' 
       nomeunidades=fetch(conn,'Select Nome From SIGA_UNIDADE_CURRICULAR');
       [poss, nn]=listdlg('PromptString','Selecione o nome da unidade curricular:','SelectionMode','single','ListString',nomeunidades);
       unidade=fetch(conn,['Select C�DIGO From SIGA_UNIDADE_CURRICULAR where NOME=''' nomeunidades{poss} '''']);
       unidade1=unidade{1};
       unidade=num2str(unidade{1}); 
        
        
    case 3 %'ANO_LECTIVO' 
        
        ano_lectivo1=inputdlg('Introduza o ano letivo ao qual quer introduzir os dados do aluno (valor inteiro)');
        ano_lectivo=str2num(ano_lectivo1{1});
        ano_lectivoint=int64(ano_lectivo);        
        letras=isempty(ano_lectivo);
        if (letras==1) || (ano_lectivo~=ano_lectivoint) 
            while (letras==1)|| (ano_lectivo~=ano_lectivoint)            
                n=errordlg('O que introduziu n�o � um n�mero inteiro.');
                waitfor(n);
                ano_lectivo1=inputdlg('Introduza o ano letivo ao qual quer introduzir os dados do aluno (valor inteiro)');
                ano_lectivo=str2num(ano_lectivo1{1});
                ano_lectivoint=int64(ano_lectivo);        
                letras=isempty(ano_lectivo);
            end
        end
    case 4 %'TIPO_DE_PER�ODO_LECTIVO' 
        perio=menu('Introduza o tipo de per�odo letivo:','Semestre','Anual','Trimestre');
                switch perio
                    case 1
                        tipo_periodo={'s'};
                    case 2
                        tipo_periodo={'a'};
                    case 3
                        tipo_periodo={'t'};
                end
        
        
    case 5 %'PER�ODO_LECTIVO' 
         periole=menu('Introduza qual o per�odo letivo:','1� semestre','2� semestre');
                switch periole
                    case 1
                        periodo_lectivo=1;
                    case 2
                        periodo_lectivo=2;
                   
                end
         
                
    case 6 %'CLASSIFICA��O_NO_ANO' 
         
         classificacao_insc1=inputdlg('Introduza a nota obtida na inscri��o � unidade curricular (valor inteiro entre 0-20)');
         classificacao_insc=str2num(classificacao_insc1{1});
         classificacao_inscint=int64(classificacao_insc);        
         letras=isempty(classificacao_insc);
        if (letras==1) || (classificacao_insc~=classificacao_inscint) || (classificacao_insc<0) || (classificacao_insc>20)
            while (letras==1)|| (classificacao_insc~=classificacao_inscint) || (classificacao_insc<0) || (classificacao_insc>20)          
                n=errordlg('O que introduziu n�o � um n�mero inteiro.');
                waitfor(n);
                classificacao_insc1=inputdlg('Introduza a nota obtida na inscri��o � unidade curricular (valor inteiro entre 0-20)');
                classificacao_insc=str2num(classificacao_insc1{1});
                classificacao_inscint=int64(classificacao_insc);        
                letras=isempty(classificacao_insc);
            end
        end
        
    case 7 %'CLASSIFICA��O_FINAL' 
      
        classificacao_final1=inputdlg('Introduza a nota final � unidade curricular(valor inteiro entre 0-20)');
        classificacao_final=str2num(classificacao_final1{1});
        classificacao_finalint=int64(classificacao_final);        
        letras=isempty(classificacao_final);
        if (letras==1) || (classificacao_final~=classificacao_finalint) || (classificacao_final<0) || (classificacao_final>20)
            while (letras==1)|| (classificacao_final~=classificacao_finalint) || (classificacao_final<0) || (classificacao_final>20)          
                n=errordlg('O que introduziu n�o � um n�mero inteiro.');
                waitfor(n);
                classificacao_final1=inputdlg('Introduza a nota final � unidade curricular(valor inteiro entre 0-20)');
                classificacao_final=str2num(classificacao_final1{1});
                classificacao_finalint=int64(classificacao_final);        
                letras=isempty(classificacao_final);
            end
        end
        
    case 8 %'NOTA_DE_FREQU�NCIA'        
        nota_freq1=inputdlg('Introduza a nota obtida na frequ�ncia continua (valor decimal entre 0-20)');
        nota_freq=str2num(nota_freq1{1});        
        letras=isempty(nota_freq);
        if (letras==1) || (nota_freq<0) || (nota_freq>20)
            while (letras==1)  || (nota_freq<0) || (nota_freq>20)      
                n=errordlg('O que introduziu n�o � um n�mero inteiro.');
                waitfor(n);
                nota_freq1=inputdlg('Introduza a nota obtida na frequ�ncia continua (valor decimal entre 0-20)');
                nota_freq=str2num(nota_freq1{1});
                letras=isempty(nota_freq);
            end
        end
        
    case 9 %'RESULTADO'
        result=menu('Introduza se o aluno ficou aprovado � unidade curricular:','Aprovado','Reprovado');
                switch result
                    case 1
                        resultado={'ap'};
                    case 2
                        resultado={'rp'};
                   
                end         
          
    case 10
        dad=0;
end
end



h=1;
        if (aluno1~=0)
            dados{1,h}=aluno;
            colunas{1,h}='ALUNO';
            dados1{1,h}=aluno1;
            h=h+1;
        end
        if (unidade1~=0)
            dados{1,h}=unidade;
            colunas{1,h}='UNIDADE';
            dados1{1,h}=unidade1;
            h=h+1;
        end
        if (ano_lectivo~=0)
            dados{1,h}=ano_lectivo1{1};
            colunas{1,h}='ANO_LECTIVO';
            dados1{1,h}=ano_lectivo;
            h=h+1;
        end
        if (tipo_periodo{1}~='g')
            dados{1,h}=tipo_periodo{1};
            colunas{1,h}='TIPO_DE_PER�ODO_LECTIVO';
            dados1{1,h}=tipo_periodo{1};
            h=h+1;
        end
        if (periodo_lectivo~=0)
            dados{1,h}=num2str(periodo_lectivo);
            colunas{1,h}='PER�ODO_LECTIVO';
            dados1{1,h}=periodo_lectivo;
            h=h+1;
        end
        if (classificacao_insc~=0)
            dados{1,h}=classificacao_insc1{1};
            colunas{1,h}='CLASSIFICA��O_NO_ANO';
            dados1{1,h}=classificacao_insc;
            h=h+1;
        end
        if (classificacao_final~=0)
            dados{1,h}=classificacao_final1{1};
            colunas{1,h}='CLASSIFICA��O_FINAL';
            dados1{1,h}=classificacao_final;
            h=h+1;
        end
        if (nota_freq~=0)
            dados{1,h}=nota_freq1{1};
            colunas{1,h}='NOTA_DE_FREQU�NCIA';
            dados1{1,h}=nota_freq;
            h=h+1;
        end
        if (resultado{1}~='l')
            dados{1,h}=resultado{1};
            colunas{1,h}='RESULTADO';
            dados1{1,h}=resultado{1};
            h=h+1;
        end
 
 if dados{1}==0
        conclusao=msgbox('N�o foram introduzidos nenhuns dados, logo n�o foram inseridos dados na tabela');
        waitfor(conclusao)
    else    
    c=[ (cellstr(colunas)) ; cellstr(dados)];
    w=questdlg('Deseja ver os dados que introduziu?','Dados Introduzidos','Sim','N�o','n');
    switch w
        case 'Sim'
            d=msgbox(c);
            waitfor(d);
     end
    
    tudo=questdlg('J� introduziu os dados todos para as diferentes colunas da tabela?','Prosseguir','Sim, e quero prosseguir','N�o, mas quero prosseguir', 'N�o, inserir mais dados','n');
        switch tudo
            case ('Sim, e quero prosseguir')
                dad=0;
                
            case ('N�o, mas quero prosseguir')
                dad=0;
            
            case ('N�o, inserir mais dados')
                dad=1;
        end
    end

        [ insertab ] = inserir_S(dados1,colunas );
if insertab==0
on=msgbox('Os dados foram introduzidos com sucesso');
waitfor(on)
else
off=msgbox('Os dados n�o foram introduzidos com sucesso');
waitfor(off)
close(conn)  
end

case 'Cancelar'
        return
end

ui=questdlg('Deseja voltar  a visualizar o programa?', 'Correr de novo','Sim', 'N�o','n');
if ui=='Sim'
    f=225;
else
    break
end
end



