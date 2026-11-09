Program EcoSystem ;
{recebe as entradas e saídas de caixa, calcula o total á pagar, e armazena tudo num array}



function menu() : shortint;
var 
options : shortint;
begin
repeat
writeln('--- opções ---');
writeln;
writeln('-> 1. registar dados <-');
writeln('-> 2. Olhar Registros <-');
writeln('-> 3. Sair <-');
readln(options);
    case options of
    1: inputs_outs();
    2: registers();
    3: writeln('saindo.....');
    else
        begin
            writeln('opção invalida...., apenas 1 á 3');
        end;
    end;
until options = 3;
menu := options;
end;


Begin
  inputs_outs();
end.