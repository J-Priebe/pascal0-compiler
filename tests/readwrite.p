program p;
  var x: integer;
  begin 
    read(x);
    x := 3 * x;
    write(x);
    write(x * 5);
    writeln();
    read(x);
    write(x + 5)
  end;
  {for input 0, 0 write 0, 0, 5}
  {for input 5, -3 write 15, 75, 2}