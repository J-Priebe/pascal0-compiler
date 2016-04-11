from P0 import compileString
import os

def testTypeCheck0():
    """produces error 'not a field'"""
    compileString("""
program p;
  var v: record f: integer end;
  begin v.g := 4
  end
""")

def testTypeCheck1():
    """produces error 'not a record'"""
    compileString("""
program p;
  var v: integer;
  begin v.g := 4
  end
""")

def testTypeCheck2():
    """produces error 'identifier expected'"""
    compileString("""
program p;
  var v: record f: integer end;
  begin v.3 := 4
  end
""")

def testTypeCheck3():
    """produces error 'incompatible assignment' twice"""
    compileString("""
program p;
  var x: boolean;
  procedure q;
    var x: integer;
    begin x := true
    end;
  begin x := 3
  end
""")

def testTypeCheck4():
    """produces error 'undefined identifier x', 'statement expected"""
    compileString("""
program p;
  const c = x + 1;
  begin
  end
""")

def testTypeCheck5():
    """produces error 'variable or procedure expected'"""
    compileString("""
program p;
  const c = 7;
  begin c := 4
  end
""")

def testTypeCheck6():
    """produces error 'extra parameter'"""
    compileString("""
program p;
  var x: integer;
  procedure q;
    begin x := 7
    end;
  begin q(x)
  end
""")
    
def testTypeCheck7():
    """produces error 'too few parameters'"""
    compileString("""
program p;
  procedure q(a: integer);
    begin a := 7
    end;
  begin q()
  end
""")
    
def testTypeCheck8():
    """produces error 'illegal parameter mode'"""
    compileString("""
program p;
  procedure q(a: integer);
    begin a := 7
    end;
  begin q(true)
  end
""")
    
def testTypeCheck9():
    """produces error 'illegal parameter mode'"""
    compileString("""
program p;
  procedure q(var a: integer);
    begin a := 7
    end;
  begin q(5)
  end
""")
    
def testCodeGenCheck0():
    """produces error 'value too large'"""
    compileString("""
program p;
  const c = 100000;
  var x: integer;
  begin x := c
  end
""")

def testCodeGenCheck1():
    """produces error 'no structured value parameters'"""
    compileString("""
program p;
  type a = array [1..10] of integer;
  procedure q(f: a);
    begin a := 4
    end
  begin a(5)
  end
""")

def testCodeGenCheck2():
    """produces error 'out of register'"""
    compileString("""
program p;
  var x: integer;
  begin
    x := 0*x + (1*x + (2*x + (3*x + (4*x + (5*x + (6*x + (7*x + (8*x))))))))
  end
""")

def testCodeGenCheck3():
    """produces error 'level!'"""
    compileString("""
program p;
  procedure q;
    var x: integer;
    procedure r;
      begin x := 5
      end;
    begin x := 3
    end;
  begin x := 7
  end
""")

def testCodeGenCheck4():
    """produces error 'unsupported parameter type'"""
    compileString("""
program p;
  var x: integer;
  procedure q(b: boolean);
    begin b := false
    end;
  begin q(x > 7)
  end
""")

def testCompiling0():
    """input & output"""
    compileString("""
program p;
  var x: integer;
  begin 
    read(x);
    x := 3 * x;
    write(x);
    writeln();
    writeln();
    write(x * 5)
  end
""", 'T0.s')
    """ generates
  .data
x:  .space 4
  .text
  .globl main
  .ent main
main: 
  li $v0, 5
  syscall
  sw $v0, x
  addi $t0, $0, 3
  lw $t4, x
  mul $t0, $t0, $t4
  sw $t0, x
  lw $a0, x
  li $v0, 1
  syscall
  li $v0, 11
  li $a0, '\n'
  syscall
  li $v0, 11
  li $a0, '\n'
  syscall
  lw $t6, x
  mul $t6, $t6, 5
  add $a0, $t6, $0
  li $v0, 1
  syscall
  li $v0, 10
  syscall
  .end main
"""

def testCompiling1():
    """parameter passing"""
    compileString("""
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
  end
""", 'T1.s')

def testRecords():
    """arrays and records"""
    compileString("""
program p;
  type a = array [1 .. 7] of integer;
  type r = record f: integer; g: a; h: integer end;
  var v, c: a;
  var w, d: r;
  var x, y: integer;
  begin 
    x := 9;
    w.h := 12 - 7; write(w.h); {writes 5}
    v[1] := 3; write(v[x-8]); {writes 3}
    w.g[x div 3] := 9; write(w.g[3]); {writes 9}
    writeln(); 

    y := 3;
    write(w.h); write(v[1]); write(w.g[y]); {writes 5, 3, 9}
    writeln();
    v[7] := 7; 
    write(v[y+4]); {writes 7}
    w.g[y*2] := 7; 
    write(w.g[6]); {writes 7}

    writeln();
    write(v[7]); write(w.g[6]) {writes 7, 7}
  end
""", 'records_x64.s')

"""
program p;
  type a = array [1 .. 7] of integer;
  type r = record f: integer; g: a; h: integer end;
  var v: a;
  var w: r;
  var x: integer;
  procedure q(var c: a; var d: r);
    var y: integer;
    begin 
      y := 3;
      write(d.h); write(c[1]); write(d.g[y]); {writes 5, 3, 9}
      writeln();
      c[7] := 7; 
      write(c[y+4]); {writes 7}
      d.g[y*2] := 7; 
      write(d.g[6]) {writes 7}
    end;
  begin 
    x := 9;
    w.h := 12 - 7; write(w.h); {writes 5}
    v[1] := 3; write(v[x-8]); {writes 3}
    w.g[x div 3] := 9; write(w.g[3]); {writes 9}
    writeln(); q(v, w); writeln();
    write(v[7]); write(w.g[6]) {writes 7, 7}
  end
"""

def testQ2():
  compileString("""
program p;
  begin
    write(7);
    write(9); 
    write(4)
  end
""", 'Q2_expected.s')

def testCompiling3():
    """booleans and conditions"""
    compileString("""
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
  end
""", 'T3.s')

def testCompiling4():
    """constant folding; local & global variables'"""
    compileString("""
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
  begin x := 7; q(); write(x) {writes 7}
  end
""", 'T4.s')

def testCompiling5():
    """example for code generation"""
    compileString("""
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
    q(7)
  end
""", 'T5.s')
""" generates:
  .data
g_: .space 4
  .text
  .globl q
  .ent q
q:                     # procedure q
  sw $fp, -8($sp)    # M[$sp - 8] := $fp
  sw $ra, -12($sp)   # M[$sp - 12] := $ra
  sub $fp, $sp, 4    # $fp := $sp - 4
  sub $sp, $fp, 12   # $sp := $fp - 12
                     # adr(v) = M[$fp]
                     # adr(l) = M[$fp - 12]
  addi $t0, $0, 9    # $t0 := 9
  sw $t0, -12($fp)   # l := $t0
  lw $t5, -12($fp)   # $t5 := l
  lw $t1, 0($fp)     # $t1 := v
  ble $t5, $t1, C0   # if $t5 <= $t1 then pc := adr(C0)
C1: 
  lw $a0, -12($fp)   # $a0 := l
  li $v0, 1          # write($a0)
  syscall
  b I0               # goto I0
C0: 
  lw $a0, g_         # $a0 := g
  li $v0, 1          # write($a0)
  syscall
I0: 
  add $sp, $fp, 4    # $sp := $fp + 4
  lw $ra, -8($fp)    # $ra := M[$fp - 8]
  lw $fp, -4($fp)    # $fp := M[$fp - 4]
  jr $ra             # $pc := $ra
  .text
  .globl main
  .ent main
main: 
  addi $t6, $0, 5    # $t6 := 5
  sw $t6, g_         # g := $t6
  addi $t4, $0, 7    # $t4 := 7
  sw $t4, -4($sp)    # M[$sp - 4] := $t4
  jal q              # $ra := $pc + 4; $pc := adr(q)
  li $v0, 10
  syscall .end main
"""

def testCompiling6():
    """illustrating lack of 'optimization'"""
    compileString("""
program p;
  type a = array [1 .. 15] of integer;
  var x: integer;
  var v: a;
  begin 
    x := 5;
    x := x + 3;
    x := x + 3;

    v[x] := 3;
    v[x] := x;
    v[x] := 1;
    v[x] := 4;
    v[x] := x;
    v[3] := x + 2;
    v[x + 1] := x * 2;
    write(v[x + 1]); {write 22}
    write(v[12]); {write 22}
    write(x) {write 11}
  end
""", 'T6.s');os.system("nasm -f elf64 T6.s && gcc -m64 -o t6-test T6.o") 


def testCond():
  compileString("""
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
  end
""", 'conditions_x64.s');os.system("nasm -f elf64 conditions_x64.s && gcc -m64 -o cond-test conditions_x64.o") 



def testBasic():
  compileString("""
program p;
  type a = array [1 .. 15] of integer;
  var x, y, z: integer;
  var v: a;
  begin 
    y := 4;
    z := 101;
    v[y] := z;
    write(y)
  end
""", 'basic_x64.s');os.system("nasm -f elf64 basic_x64.s && gcc -m64 -o basic-test basic_x64.o") 


def testProc():
  compileString("""
program p;
  var x: integer;
  procedure q(var c, lol: integer);
    var y, z: integer;
    begin 
      y := c;
      z := lol;
      write(z)
    end;
  begin 
    x := 9;
    q(x, x)
  end
""", 'proc_x64.s');os.system("nasm -f elf64 proc_x64.s && gcc -m64 -o proc-test proc_x64.o") 


def testArrayProc():
  compileString("""
program p;
  type a = array [1 .. 5] of integer;
  var garr: a;
  var gint: integer;
  procedure q(var myint: integer; var myarr: a);
    var localint: integer;
    begin 
      localint := myarr[3];
      write(myarr[2])
    end;
  begin
    gint := 9;
    garr[1] := 1;
    garr[2] := 2;
    garr[3] := 3;
    garr[4] := 4;
    garr[5] := 5;
    q(gint, garr)
  end
""", 'array_proc_x64.s');
  os.system("nasm -f elf64 array_proc_x64.s && gcc -m64 -o array-proc-test array_proc_x64.o") 

def testReadWrite():
   compileString("""
program p;
  var x, y: integer;
  begin
    x := 9;
    read(y);
    writeln();
    write(x);
    writeln();
    write(y)
  end
""", 'readwrite_x64.s');
   os.system("nasm -f elf64 readwrite_x64.s && gcc -m64 -o readwrite-test readwrite_x64.o")

#REMEMBER TO USE PYTHON 3
#python3 P0test.py
if __name__ == "__main__":
  # QUESTION 1
  #testCompiling5()                #  T5.s
  #testCompiling0()
  testCompiling6()
  #testQ2()
  #testCompiling3()
  testBasic()
  testReadWrite()
  testProc()
  testArrayProc()
  testCond()
  testRecords()
  #testWhile()
  #compileFile('disassembly.p')    #  disassembly.s  
  #compileFile('manyvars.p')
  #compileFile('hello.p')
