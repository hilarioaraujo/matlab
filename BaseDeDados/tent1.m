clc

conn=database('SIGA','','');
setdbprefs('DataReturnFormat','cellarray');
   
nome_colunas=columns(conn,'','','SIGA_ALUNO_EM_UNIDADE_CURRICULAR');
j=msgbox('Selecione as colunas da Tabela para adicionar os dados que deseja');
waitfor(j);
dad=1;

aluno1=0;
unidade1=0;
ano_lectivo=0;
tipo_periodo={'g'};
periodo_lectivo=0;
classificacao_insc=0;
classificacao_final=0; 
nota_freq=0; 
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
       [poss, nn]=listdlg('PromptString','Selecione o nome do aluno:','SelectionMode','single','ListString',nomeunidades);
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
         
         classificacao_insc1=inputdlg('Introduza a nota obtida na inscri��o � unidade curricular (valor inteiro)');
         classificacao_insc=str2num(classificacao_insc1{1});
         classificacao_inscint=int64(classificacao_insc);        
         letras=isempty(classificacao_insc);
        if (letras==1) || (classificacao_insc~=classificacao_inscint)
            while (letras==1)|| (classificacao_insc~=classificacao_inscint)            
                n=errordlg('O que introduziu n�o � um n�mero inteiro.');
                waitfor(n);
                classificacao_insc1=inputdlg('Introduza a nota obtida na inscri��o � unidade curricular (valor inteiro)');
                classificacao_insc=str2num(classificacao_insc1{1});
                classificacao_inscint=int64(classificacao_insc);        
                letras=isempty(classificacao_insc);
            end
        end
        
    case 7 %'CLASSIFICA��O_FINAL' 
      
        classificacao_final1=inputdlg('Introduza a nota final � unidade curricular(valor inteiro)');
        classificacao_final=str2num(classificacao_final1{1});
        classificacao_finalint=int64(classificacao_final);        
        letras=isempty(classificacao_final);
        if (letras==1) || (classificacao_final~=classificacao_finalint)
            while (letras==1)|| (classificacao_final~=classificacao_finalint)            
                n=errordlg('O que introduziu n�o � um n�mero inteiro.');
                waitfor(n);
                classificacao_final1=inputdlg('Introduza a nota final � unidade curricular(valor inteiro)');
                classificacao_final=str2num(classificacao_final1{1});
                classificacao_finalint=int64(classificacao_final);        
                letras=isempty(classificacao_final);
            end
        end
        
    case 8 %'NOTA_DE_FREQU�NCIA'        
        nota_freq1=inputdlg('Introduza a nota obtida na frequ�ncia continua (valor decimal)');
        nota_freq=str2num(nota_freq1{1});        
        letras=isempty(nota_freq);
        if (letras==1)
            while (letras==1)           
                n=errordlg('O que introduziu n�o � um n�mero inteiro.');
                waitfor(n);
                nota_freq1=inputdlg('Introduza a nota obtida na frequ�ncia continua (valor decimal)');
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
