program p;
  var w,x,y,z: integer;
  begin 

    {multiply, divide by one, zero}
    x := 5 * 1;
    write(x);
    x := 5 div 1;
    write(x);
    x := x * 0 * 3; {write 5 5 0}
    write(x);
    writeln();

    {add, multiply, divide, modulo by constant}
    
    w := 30 div 3;
    w := w div 2;
    x := 23 mod 5;
    x := x mod 2;
    y := 3 + 4;
    y := y + 3;
    z := 5 * 2;
    z := z * 3;
    write(w);write(x);
    write(y);write(z); {write 5 1 10 30}
    writeln();

    {order of operations}
    x := w * x + z div y; {write 8}
    writeln() ;

    {negation}
    x := -x + x;
    y := -y + z;
    write(x);write(y); {write 0 20 }
    writeln()

  end;
{ }
{OUTPUT}