Program EcoSystem ;
{recebe as entradas e saídas de caixa, calcula o total á pagar, e armazena tudo num array}

procedure inputs_outs();
  var
  inputs,outs : real;
  inadout : shortint;
  supravt, defcit : array[1..25] of real;
  i : integer;
  p : integer;
    begin
    writeln('--- cadastrar movimentações ---');
    writeln('1. entrada de capital ');
    writeln('2. saídas ');
    writeln('3.sair ');
    i := 1;
    p := 1;
    repeat
        writeln('---- insira a sua escolha: ----');
        readln(inadout);
        if (inadout = 1) then
        begin
            writeln('--- valor de entrada: ---');
            readln(inputs);
            supravt[i] := inputs;
            i := i + 1;
        end
        else if (inadout = 2) then
        begin
            writeln('--- valor de saída: ---');
            readln(outs);
            defcit[p] := outs; 
            p:= p + 1;
        end
        else if (inadout = 3) then
        begin
            writeln('saindo');
        end
        else
        begin
            writeln('insira valores de 1 á 3');
        end;
    until inadout = 3;
end;

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
    1 : inputs_outs();
    2: registers();
    3: writeln('saindo.....');
    else
        writeln('opção invalida....');
    end;
until options = 3;
menu := options;
end;

Begin
  inputs_outs();
end.