program p;
  var g: integer;          {global variable}
  procedure q(v: integer); {value parameter}
    var l: integer;        {local variable}
    begin
      l := 9;
      if l > v then
         write(l)
      else
         write(g)
    end;
  begin
    g := 5;
    q(7)  {write 9}
  end;