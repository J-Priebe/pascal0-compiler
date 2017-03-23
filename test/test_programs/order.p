program p;
  var xx, xy, xz, xp: integer;
  procedure q(var a, b, c, d: integer);
    var x,y,z,p: integer;
    begin 
      x := a;
      y := b;
      z := c;
      p := d;
      write(x);
      write(xy);
      write(z);
      write(xp)
    end;
  begin 
    xx := 1;
    xy := 2;
    xz := 3;
    xp := 4;
    q(xx, xy, xz, xp) {write 1 2 3 4}
  end;
{ }
{OUTPUT}