program RecordSystem;

{$mode objfpc}

    type
        Tmovimentation = record
            type_mov : shortint;
            value : real;
            ad_gov : boolean;
        end;
procedure recording();
    var
        regis : Text ;
        mov : Tmovimentation;
        isfirst : boolean;
    begin
        isfirst := true;
        Assign(regis, 'registros.json');
        Rewrite(regis);
        writeln(regis,'[');
        while true do 
        begin
            writeln('--- digite o tipo de movimentação desejada (ou 0, para sair) ---');
            readln(mov.type_mov);
            if (mov.type_mov = 0) then
            begin
                writeln('saindo.....');
                break;
            end;
            writeln('digite o valor da movimentação desejada ');
            readln(mov.value);
            if (isfirst = true) then
            begin
                isfirst := false;
            end
            else
            begin
                write(regis,',');
            end;
            writeln(regis , #13#10 + '{"tipo da movimentação" : ' ,mov.type_mov,', "valor da movimentação " : R$ ',mov.value:5:2,'}');
        end;
        write(regis, #13#10 + ']');
        close(regis);
        writeln('json, salvo com sucesso!');
    end;
Begin
recording(); 
readln;
end.