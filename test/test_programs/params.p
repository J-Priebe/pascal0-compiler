program p;
  var x: integer;
  procedure q({-4($sp)}a: integer {4($fp)}; {-8($sp)}var b: integer {($fp)});
    var y: integer;{-12($fp)}
    begin y := a; write(y); writeln(); {writes 7}
      a := b; write(x); write(a); writeln(); {writes 5, 5}
      b := y; write(b); write(x); writeln(); {writes 7, 7}
      write(a); write(y); writeln() {writes 5, 7}
    end;
  begin x := 5; q(7, x);
    write(x) {writes 7}
  end;
{ }
{OUTPUT}