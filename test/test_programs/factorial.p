program p;
  const size = 10;
  type arr = array [1 .. 25] of integer;
  var i, j, factorial: integer;
  var a1, a2: arr;
  procedure writestuff(var a, b: integer);
    var aaa,bbb,ccc,ddd,eee,fff,ggg: integer;
    begin 
      eee := 42;
      ggg := 11;
      write(a);
      write(b)
    end;
  begin 
    i := 1;
    factorial := 1;
    read(j);
    while i <= j do
      begin 
        factorial := factorial * i;
        a1[i] := factorial;
        writestuff(i, a1[i]);
        i := i + 1
      end
  end;

{
Expected output for input 12:

1
1

2
2

3
6

4
24

5
120

6
720

7
5040

8
40320

9
362880

10
3628800

11
39916800

12
479001600
}
{6}
{OUTPUT}