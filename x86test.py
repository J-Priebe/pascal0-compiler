from compile import compileString
import os

def testTypeCheck0():
    """produces error 'not a field'"""
    error = compileString("""
program p;
  var v: record f: integer end;
  begin v.g := 4
  end
""", os.devnull)

def testTypeCheck1():
    """produces error 'not a record'"""
    error = compileString("""
program p;
  var v: integer;
  begin v.g := 4
  end
""", os.devnull)

def testTypeCheck2():
    """type decl produces error declaration expcted, 'identifier expected'"""
    error = compileString("""
program p;
  x := 5;
  var v: record f: integer end;
  var x, 5: integer;
  begin v.3 := 4
  end
""", os.devnull)

def testTypeCheck3():
    """produces error 'incompatible assignment' twice"""
    error = compileString("""
program p;
  var x: boolean;
  procedure q;
    var x: integer;
    begin 
      x := true
    end;
  begin 
    x := 3
  end
""", os.devnull)

def testTypeCheck4():
    """produces error constance name expetced, = expected, 'undefined identifier x', 'statement expected"""
    error = compileString("""
program p;
  const a := 4;
  const c = x + 1;
  const 3 = 3; 
  begin
  end
""", os.devnull)

def testTypeCheck5():
    """produces error 'variable or procedure expected'"""
    error = compileString("""
program p;
  const c = 7;
  begin c := 4
  end
""", os.devnull)

def testTypeCheck6():
    """produces error 'extra parameter'"""
    error = compileString("""
program p;
  var x: integer;
  procedure q;
    begin x := 7
    end;
  begin q(x)
  end
""", os.devnull)
    
def testTypeCheck7():
    """produces error ) expec,  'too few parameters' and extra param"""
    error = compileString("""
program p;
  procedure q(a: integer);
    begin a := 7
    end;
  begin 
    q();
    q(5,6);
    q(5
  end
""", os.devnull)


def testTypeCheck8():
    """produces error 'illegal parameter mode'"""
    error = compileString("""
program p;
  procedure q(var a, b: integer);
    begin a := 7
    end;
  begin q(5, 6)
  end
""", os.devnull)
    

def testCodeGenCheck0():
    """produces error 'value too large'"""
    error = compileString("""
program p;
  const c = 100000;
  var x: integer;
  begin x := c
  end
""", os.devnull)

def testCodeGenCheck1():
    """produces error 'no structured value parameters'"""
    error = compileString("""
program p;
  type a = array [1..10] of integer;
  procedure q(f: a);
    begin a := 4
    end
  begin a(5)
  end
""", os.devnull)

def testCodeGenCheck2():
    """produces error 'out of register'"""
    error = compileString("""
program p;
  var x: integer;
  begin
    x := 0*x + (1*x + (2*x + (3*x + (4*x + (5*x + (6*x + (7*x + (8*x))))))))
  end
""", os.devnull)

def testCodeGenCheck3():
    """produces error 'level!'"""
    error = compileString("""
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
""", os.devnull)

def testCodeGenCheck4():
    """produces error 'unsupported parameter type'"""
    error = compileString("""
program p;
  var x integer;
  procedure q(b: boolean);
    begin b := false
    end;
  begin q(x > 7)
  end
""", os.devnull)
    print(error)

def testCodeGenCheck5():
    """produces error 'unsupported parameter type'"""
    error = compileString("""
program p;
  var x: integer;
  var x: integer;
  begin 
    x := 100000000000000000000000000000000

  end
""", os.devnull)
    print(error)


def testCodeGenCheck6():
    error = compileString("""
program p;
  type a = array [1 .. 7] of integer;
  type r = record f: integer; g: a; h: integer end;
  var v, c: a;
  var w, d: r;
  var x, y: integer;
  begin 
    x := 9;
    w.h := 12 - 7; 
    w.g[x div 3] := 9;
    w.h = w.g;
    w.lol = 5
  end;
""", os.devnull)
    print(error)



def testCodeGenCheck7():
    """ index out of bounds, not an integer, not an array, ] expected"""
    error = compileString("""
program p;
  type a = array [1 .. 7] of integer;
  var v, u: a;
  var x: integer;
  begin 
    v[9] := 6;
    v[u] := 3;
    x[5] := 4;
    v[3 := 1
  end;
""", os.devnull)
    print(error)


def testCodeGenCheck8():
    """ bad type, not a factor, variable or constant, expected """
    error = compileString("""
program p;
  type a = array [1 .. 7] of integer;
  var v, u: a;
  var x: integer;
  begin 
    x := 4 + v;
    x :=  4 >= v;
    x := (3*3
    x := 5 and .]a;
    x := 5 and ..a;
  end;
""", os.devnull)
    print(error)


def testCodeGenCheck9():
    """ bad type , bad params"""
    error = compileString("""
program p;
  type a = array [1..10] of integer;
  var myarr: a;
  var x: integer;
  procedure q(f: a);
    begin 
      f[1] := 4
    end;
  begin 
    q(myarr)
  end;
""", os.devnull)
    print(error)
    """ cant pass cond as value """
    error2 = compileString("""
program p;
  type a = array [1..10] of integer;
  var myarr: a;
  var x: integer;
  procedure q(f: boolean);
    begin 
      f := true
    end;
  begin 
    q(5<4)
  end;
""", os.devnull)
    print(error2)



def testCodeGenCheck10():
    """ expected boolean"""
    error = compileString("""
program p;
  var x: integer;
  begin 
    x := 5;
    if true x:=3; {then expected}
    while true x:=2; {do expected}
    if x then write(x) else write(0);
  end;
""", os.devnull)
    print(error)

def testCodeGenCheck11():
    """ expected boolean"""
    error = compileString("""
program p;
  var x: integer;
  begin 
    x := 5;
    while x do x:=2 {bool expected}
  end;
""", os.devnull)
    print(error)

def testTypeSyntaxCheck():
    """ type expected"""
    error = compileString("""
program p;
  type a: 5;
  type b: x;
  type c = array of integer;

  var x: a;
  begin 
    x := 5
  end;
""", os.devnull)
    print(error)

    error2 = compileString("""
program p;
  type d = record f: integer; {end expected}

  var x: a;
  begin 
    x := 5
  end;
""", os.devnull)
    print(error2)
    
    error3 = compileString("""
program p;
  type 5 = integer;
  begin 
  end;
""", os.devnull)
    print(error3)

def testProcedureDeclarationsSyntaxCheck():
    error = compileString("""
program p;
  procedure (var a: integer);
    begin 
    end;
  begin 
  end;
""", os.devnull)
    print(error)
    error2 = compileString("""
program p;
  procedure q(5: integer);
    begin 
    end;
  begin 
  end;
""", os.devnull)
    print(error2)

def testProgramDeclSyntaxCheck():
    error = compileString("""
p;
  begin 
  end;
""", os.devnull)
    print(error)
    error2 = compileString("""
program;
  begin 
  end;
""", os.devnull)
    print(error2)
    error3 = compileString("""
program p
  begin 
  end;
""", os.devnull)
    print(error3)




def testGetChar():
    error = compileString("""
program p;
var x: integer;
  begin 
  write(|)
  end;
""")
    print(error)

# arrays must be passed by reference
def testIllegalAssignmentCheck():
    error = compileString("""
program p;
type arr = array [1..10] of integer;
var a1, a2: arr;
var x,y: boolean;
var p,q, z: integer;
  procedure f(var a,b: arr; var z: integer);
    begin
      b[1] := p;
      b[1] := a2[1];
      z := 5
    end;
  begin 
    p := 1;
    q := 2;
    f(a1,a2, z);
    a[1] := z
  end;
""", os.devnull)
    print(error)








def runall():
  testTypeCheck0()
  testTypeCheck1()
  testTypeCheck2()
  testTypeCheck3()
  testTypeCheck4()
  testTypeCheck5()
  testTypeCheck6()
  testTypeCheck7()
  testTypeCheck8() 

  testCodeGenCheck0()
  testCodeGenCheck1()
  testCodeGenCheck2()
  testCodeGenCheck3()
  testCodeGenCheck4()
  testCodeGenCheck5()
  testCodeGenCheck6()
  testCodeGenCheck7()
  testCodeGenCheck8()
  testCodeGenCheck9()
  testCodeGenCheck10()
  testCodeGenCheck11()
  testTypeSyntaxCheck()
  testProcedureDeclarationsSyntaxCheck()
  testProgramDeclSyntaxCheck()
  testIllegalAssignmentCheck()
  testGetChar()










if __name__ == "__main__":
  runall()

