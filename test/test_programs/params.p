program p;
  type arr = array [1..10] of integer;
  var x: integer;
  var globalarr: arr;
  procedure inner(var ii: integer);
    begin
      ii := 3
    end;
  procedure q(a: integer; var b: integer; var localarr: arr);
    var y: integer;{-12($fp)}
    begin 
      localarr[a] := 5; write(globalarr[a]); {write 5}
      y := a; write(y); writeln(); {writes 7}
      inner(localarr[a]);
      a := b; write(x); write(a); writeln(); {writes 5, 5}
      b := y; write(b); write(x); writeln(); {writes 7, 7}
      write(a); write(y); writeln() {writes 5, 7}
    end;
  begin 
    globalarr[2] := 5;
    x := globalarr[2];
    globalarr[7] := 6; write(globalarr[7]); {write 6}
    q(7, globalarr[2], globalarr);
    write(x) {writes 7}
  end;
{ }
{OUTPUT}