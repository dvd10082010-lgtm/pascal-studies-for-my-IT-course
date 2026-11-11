program feature_InOuts;
{$objfpc}{$H+}
procedure inputs_outs();
  var
  inputs,outs : real;
  inadout : shortint;
  supravt, defcit : array[1..25] of real;
  i,cont_in : integer;
  p, cont_out : integer;
    begin
    i := 1;
    p := 1;
    cont_in := 0;
    cont_out := 0;
    repeat
    writeln('--- cadastrar movimentações ---');
    writeln('1. entrada de capital ');
    writeln('2. saídas ');
    writeln('3.sair ');
        writeln('---- insira a sua escolha: ----');
        readln(inadout);
        if (inadout = 1) then
        begin
            writeln('--- valor de entrada: ---');
            readln(inputs);
            supravt[i] := inputs;
            i := i + 1;
            cont_in := cont_in + 1;
        end
        else if (inadout = 2) then
        begin
            writeln('--- valor de saída: ---');
            readln(outs);
            defcit[p] := outs; 
            p:= p + 1;
            cont_out := cont_out + 1;
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
    
    writeln('==== valores registrados: ====');
    writeln;
    writeln('----- entradas: -----');
    for i := 1 to cont_in  do
    begin
        writeln(i ,' - valor : R$', supravt[i]:5:2);
    end;
    writeln('----- saídas -----');
    for p := 1 to cont_out do
    begin
        writeln(p ,' - valor : R$ ', defcit[p]:5:2);
    end;
end;

Begin 
inputs_outs()
end.