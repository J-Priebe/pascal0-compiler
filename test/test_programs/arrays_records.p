program p;
  type a = array [2 .. 8] of integer;
  type r = record f: integer; g: a; h: integer end;
  var v, c: a;
  var w, d: r;
  var x, y: integer;
  begin 
    x := 9;
    w.h := 12 - 7; write(w.h); {writes 5}
    v[2] := 3; write(v[x-7]); {writes 3}
    w.g[x div 3] := 9; write(w.g[3]); {writes 9}
    writeln(); 
    y := 3;
    write(w.h); write(v[2]); write(w.g[y]); {writes 5, 3, 9}
    writeln();
    v[4 + y] := 7; 
    v[y + 4] := 7; 
    write(v[y+4]); {writes 7}
    w.g[y*2] := 7; 
    write(w.g[6]); {writes 7}
    writeln();
    write(v[7]); write(w.g[6]) {writes 7, 7}
  end;