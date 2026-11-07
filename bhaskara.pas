program bhaskara;

uses Math;

function call_ns(msg: string) : integer;

var 
    n : integer;

begin   
    writeln(msg);
    readln(n);
    call_ns := n;
end;

function calc_delta(a,b,c: integer) : real;
begin
    calc_delta := sqr(b) - (4*a*c);
end;

procedure calc_xs(a,b : integer; delta: real);
var 
    x1, x2 : real;
begin
    writeln('valor de delta:');
    writeln(delta);
    x1 := (- b + sqrt(delta)) / (2 *a);
    x2 := (- b  - sqrt(delta)) / (2 *a);
    writeln('x1 = ', x1:2:2);
    writeln('x2 = ', x2:2:2);
end;
var 
a,b,c : integer;
delta : real;
begin
    a := call_ns('insira a');
    b := call_ns('insira b');
    c := call_ns('insira c');
    delta := calc_delta(a,b,c);
    calc_xs(a,b,delta);
end.
