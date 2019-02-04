var2 = exec(conn,'select * from SIGA_DOCENTE');
var2 = fetch(var2);
var2.Data;
data1=numel(var2.Data);
close(var2);


var1 = exec(conn,'select * from SIGA_MORADA_DE_PESSOA');
    var1 = fetch(var1);
    var1.Data;
    data2=numel(var1.Data);
    close(var1);
    
    
    
    if data1==data2
    informacao2=0;
else informacao2=1;
end