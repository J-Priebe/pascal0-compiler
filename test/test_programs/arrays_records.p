program p;
  type a = array [1 .. 7] of integer;
  type r = record f: integer; g: a; h: integer end;
  var v: a;
  var w: r;
  var x: integer;
  procedure q(var c: a; var d: r);
    var y: integer;
    begin y := 3;
      write(d.h); write(c[1]); write(d.g[y]); {writes 5, 3, 9}
      writeln(); c[7] := 7; write(c[y+4]); {writes 7}
      d.g[y*2] := 7; write(d.g[6]) {writes 7}
    end;
  begin x := 9;
    w.h := 12 - 7; write(w.h); {writes 5}
    v[1] := 3; write(v[x-8]) {writes 3}
  end;
{ }
{OUTPUT}