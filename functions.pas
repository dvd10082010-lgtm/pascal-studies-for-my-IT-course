program functions;

function calc(n1, n2 : real): real;
var 
    resultof : real;
    ask : string;
begin
    writeln('Qual operação será realizada?: ');
    readln(ask);
    
    case ask of
        '+': resultof := n1 + n2;
        '-': resultof := n1 - n2;
        '*': resultof := n1 * n2;
        '/': resultof := n1 / n2; // Fixed: changed + to /
    else
        begin
            writeln('Apenas suportamos operadores clássicos:');
            writeln('+ , - , * , /'); // Default value for invalid input
        end;
    end;
    
    calc := resultof; // Assigns the final value to the function name
end;
var 
n1,n2 : real;

begin
    writeln('insira o valor do n1');
    readln(n1);
    writeln('insira o valor do n2');
    readln(n2);
    writeln('Resultado: ', calc(n1,n2):0:2);  
end.