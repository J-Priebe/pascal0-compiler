{constant folding; local & global variables}
program p;
  const seven = (9 mod 3 + 5 * 3) div 2;
  type int = integer;
  var x, y: integer;
  procedure q;
    const sotrue = true and true;
    const sofalse = false and true;
    const alsotrue = false or true;
    const alsofalse = false or false;
    var x: int;
    begin x := 3;
      if sotrue then y := x else y := seven;
      write(y); {writes 3}
      if sofalse then y := x else y := seven;
      write(y); {writes 7}
      if alsotrue then y := x else y := seven;
      write(y); {writes 3}
      if alsofalse then y := x else y := seven;
      write(y); {writes 7}
      if not(true or false) then write(5) else write(9)
    end;
  begin 
    x := 7; 
    x := 1 * x;
    x := 2 * x;
    x := x div 1;
    x := x - 0;
    q(); 
    write(x) {writes 9 7}
  end;