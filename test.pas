program Test;

var
    arr : array[1..5] of string;
    i : integer;
    nomeTmp : string;
begin
    for i := 1 to 5 do 
        begin
            while true do
            begin
                writeln(' insira o nome dos cadastrados ');
                readln(nomeTmp);

                if (nomeTmp = ('Ozen'))  then
                    begin
                        writeln('nome não aceito ');
                    end
                else
                    begin
                        arr[i] := nomeTmp;
                        break;
                    end;
                end;    
            end;
writeln;

    for i:= 1 to 5 do 
    begin
        writeln(i , ' - ',arr[i]);
    end;
end.