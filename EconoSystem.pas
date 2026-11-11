Program EconoSystem;
{recebe as entradas e saídas de caixa, calcula o total á pagar, e armazena tudo num array}
{$mode objfpc}

type
    Tmovimentation = record
        value_in : real;
        value_out : real;
        type_mov : shortint;
        ad_gov : boolean;
    end;

var
  supravt, defcit : array[1..25] of real;
  i,cont_in : integer;
  p,x ,cont_out : integer;
  types : array[1..25] of shortint; 
  
procedure save_json();
var
    regis : Text ;
    mov : Tmovimentation;
    isfirst : boolean;   
    x : integer;
    // lembrete  : adicionar menu de escolha para o tipo de mov : 1 ,2, 3 ['pix', 'crédito', 'débito']
begin
    isfirst := true;
    Assign(regis, 'registros.json');
    Rewrite(regis);
    writeln(regis,'[');
    p := 1;
    i := 1;
    for x := 1 to cont_in + cont_out do
    begin
    if types[x] = 1 then
        begin
            mov.value_in := supravt[i];
            mov.type_mov := types[x];
            i := i + 1;
            if (isfirst = true) then
            begin
                isfirst := false;
            end
            else
            begin
                write(regis,',');
            end;
            mov.ad_gov := true;
            writeln(regis , #13#10 + '{"tipo da movimentação" : ' ,mov.type_mov,', "valor da movimentação " : ',mov.value_in:5:2,'}');
        end
    else
        begin
            mov.value_out := defcit[p];
            mov.type_mov := types[x];
            p := p + 1;
            if (isfirst = true) then
            begin
                isfirst := false;
            end
            else
            begin
                write(regis,',');
            end;
            mov.ad_gov := false;
            writeln(regis , #13#10 + '{"tipo da movimentação" : ' ,mov.type_mov,', "valor da movimentação " : ',mov.value_out:5:2,'}');
        end
    end;
    write(regis, #13#10 + ']');
    close(regis);
    writeln('json, salvo com sucesso!');
end;

procedure registers();
begin
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

procedure inputs_outs();
  var
  inputs,outs : real;
  inadout : shortint;
    begin
        i := 1;
        p := 1;
        x := 1;
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
                types[x] := inadout;
                i := i + 1;
                x := x + 1;
                cont_in := cont_in + 1;
                
            end
            else if (inadout = 2) then
            begin
                writeln('--- valor de saída: ---');
                readln(outs);
                defcit[p] := outs; 
                types[x] := inadout;
                p:= p + 1;
                x := x + 1;
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
    writeln('-> 3. salvar os dados <-');
    writeln('-> 0. sair <-');
    readln(options);
    case options of
        1: inputs_outs();
        2: registers();
        3: save_json();
        0: writeln('saindo.....');
    else
    begin
        writeln('opção invalida...., apenas 1 á 3');
    end;
end;
until options = 0;
menu := options;
end; 
Begin
    menu();
end.