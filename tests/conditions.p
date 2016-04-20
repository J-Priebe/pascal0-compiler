program p;
  const five = 5;
  const seven = 7;
  const always = true;
  const never = false;
  var x, y, z: integer;
  var b, t, f: boolean;
  begin x := seven; y := 9; z := 11; t := true; f := false;
    if true then write(7) else write(9);    {writes 7}
    if false then write(7) else write(9);   {writes 9}
    if t then write(7) else write(9);       {writes 7}
    if f then write(7) else write(9);       {writes 9}
    if not t then write(7) else write(9);   {writes 9}
    if not f then write(7) else write(9);   {writes 7}
    if t or t then write(7) else write(9);  {writes 7}
    if t or f then write(7) else write(9);  {writes 7}
    if f or t then write(7) else write(9);  {writes 7}
    if f or f then write(7) else write(9);  {writes 9}
    if t and t then write(7) else write(9); {writes 7}
    if t and f then write(7) else write(9); {writes 9}
    if f and t then write(7) else write(9); {writes 9}
    if f and f then write(7) else write(9); {writes 9}
    writeln();
    b := true;
    if b then write(3) else write(5); {writes 3}
    b := false;
    if b then write(3) else write(5); {writes 5}
    b := x < y;
    if b then write(x) else write(y); {writes 7}
    b := (x > y) or t;
    if b then write(3) else write(5); {writes 3}
    b := (x > y) or f;
    if b then write(3) else write(5); {writes 5}
    b := (x = y) or (x > y);
    if b then write(3) else write(5); {writes 5}
    b := (x = y) or (x < y);
    if b then write(3) else write(5); {writes 3}
    b := f and (x >= y);
    if b then write(3) else write(5); {writes 5}
    writeln();
    while y > 3 do                    {writes 9, 8, 7, 6, 5, 4}
      begin write(y); y := y - 1 end;
    write(y); writeln();              {writes 3}
    if not(x < y) and t then          {writes 7}
      write(x)
  end;