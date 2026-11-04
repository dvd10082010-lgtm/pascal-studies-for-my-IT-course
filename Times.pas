program variousTimes;

var
camp : string;
times,T_ruins : array[1..5] of string;
pts,n_der : array[1..5] of integer;
vit,emp,derr,i,pts_camp,cont_ruin: integer;

begin
camp := '';
pts_camp := 0;
cont_ruin := 0;
for i := 1 to 5 do 
    begin
    writeln('insira o nome do seu time');
    readln(times[i]);

    writeln('insira o numero de vitorias');
    readln(vit);
    pts[i] := (3 * vit);

    writeln('insira o numero de empates');
    readln(emp);
    pts[i] := pts[i] + emp;

    writeln('insira o numero de derrotas:');
    readln(derr);
    n_der[i] := derr;
    writeln;

    if (pts[i] = 0) then
    begin
        cont_ruin := cont_ruin + 1;
        T_ruins[cont_ruin] := times[i]; 
    end;
    if (pts[i] > pts_camp) then
    begin
        camp := times[i];
        pts_camp := pts[i];
    end;
end;

writeln('========== times cadastrados: ==========');
for i := 1 to 5 do 
begin
    writeln('- ', times[i],'- pts : ', pts[i]);
end;
writeln;
writeln('Times que não fizeram nenhum ponto: ');

if (cont_ruin = 0) then
begin
    writeln('Nenhum time ficou sem pontos.');
end
else
begin
    writeln('===============');
    for i:= 1 to cont_ruin do 
        begin
            writeln(T_ruins[i])
        end;
    writeln('===============');
end;
writeln;
writeln('============');
writeln;
writeln('time campeão:');
writeln(camp, ' - pts: ',pts_camp);
writeln;
writeln('============');
end.