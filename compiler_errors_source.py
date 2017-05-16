from compile import compileString
import os



def testLevelCheck():
    """ level! error with nested procedures """
    error = compileString("""
program p;
  procedure q(a, b: integer);
    procedure r(c, d: integer);
      begin
        a := 4
      end;
    begin 
      a := 7
    end;
  begin q(5, 6)
  end
""", os.devnull, suppress_errors = True)
    return error
    

def testMaxValueCheck():
    """produces error 'value too large'"""
    error = compileString("""
program p;
  const c = 4294967296;
  var x: integer;
  begin 
    x := c
  end
""", os.devnull, suppress_errors = True)
    return error



def testBooleanParamMode():

    """ cant pass cond as value """
    error = compileString("""
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
""", os.devnull, suppress_errors = True)
    return error





def testProcedureDeclarationsCheck():
    error = compileString("""
program p;
  x := 5; {declaration expected}
  const x : integer; { = expected, expression not constant, }
  const 5 = 5 {constant name expected}

  var y: integer;
  begin 
    y := 5
  end;
""", os.devnull, suppress_errors = True)

    error += compileString("""
program p;
  const w = 1 {; expected}
  type i : integer { = expected, ; expected}
  type array = array [1..5] of integer; { type name expected}

  var y: integer;
  begin 
    y := 5
  end;
""", os.devnull, suppress_errors = True)

    error += compileString("""
program p;
  var a : integer {; expected}
  var y: integer;

  procedure (5: integer); {procedure name expected, formal params expected}
    begin 
    end;

  begin 
    y := 5
  end;
""", os.devnull, suppress_errors = True)

    error += compileString("""
program p;
  var y: integer;
  procedure myproc (var a: integer { ) expected} 
    begin 
      a := 5
    end;

  procedure anotherproc (var a: integer) { ; expected} 
    begin 
      a := 5
    end {; expected}

  begin 
    y := 5
  end;
""", os.devnull, suppress_errors = True)
    
    return error
  
#     error = compileString("""
# program p;
#   procedure (var a: integer);
#     begin 
#     end;
#   begin 
#   end;
# """, os.devnull, suppress_errors = True)
#     error  += compileString("""
# program p;
#   procedure q(5: integer);
#     begin 
#     end;
#   begin 
#   end;
# """, os.devnull, suppress_errors = True)
#     print(error)

def testProgramDeclCheck():
    error = compileString("""
p;
  begin 
  end;
""", os.devnull, suppress_errors = True)
    error += compileString("""
program;
  begin 
  end;
""", os.devnull, suppress_errors = True)
    error += compileString("""
program p
  begin 
  end;
""", os.devnull, suppress_errors = True)
    return error





def testGetChar():
    error = compileString("""
program p;
var x: integer;
  begin 
  write(|)
  end;
""")
    return error


# arrays must be passed by reference
def testPassByValueCheck():

    error = compileString("""
program p;
type arr = array [1..10] of boolean;
var a1: arr;
var p: integer;
var boo: boolean;
  procedure f(a: arr; z: boolean);
    begin
      a[1] := z
    end;
  begin 
    p := 1;
    f(a1, 5>4)
  end;
""", os.devnull, suppress_errors = True)
    return error



def testSelectorCheck():
#['not a field', 'not a record', 'identifier expected', 'index out of bounds', 'index not integer', 'not an array', '] expected']
    error = compileString("""
program p;
  type arrtype = array [1 .. 7] of integer;
  type rectype = record f: integer; g: arrtype end;
  var p, q: rectype;
  var z: arrtype;
  var x, y: integer;
  begin 
    p.g[8] := 1; {oob}
    p.g[q] := 1; {index not integer}
    p.h := 12; {not a field} 
    z[1 := 2; {] expected}
    q[1] := 1; {not an array}
    x.f := 9; {not a record}
    x.5 := 4 {ident expected}
  end;
""", os.devnull, suppress_errors = True)
    return error



def testFactorCheck():
    error = compileString("""
program p;
  type arrtype = array [1 .. 7] of integer;
  var z: arrtype;
  var x, y: integer;
  begin 
    y := not x; {not boolean}
    y := (5 ; { ) expected}
    x := arrtype; {var or const expected}
    x := .^^ {factor expected x2}
  end;
""", os.devnull, suppress_errors = True)
    return error



def testTermCheck():
    error = compileString("""
program p;
  type arrtype = array [1 .. 7] of integer;
  var z: arrtype;
  var x, y: integer;
  begin 
    x := 3 * z; {bad type}
  end;
""", os.devnull, suppress_errors = True)
    return error


# expressions and simpleExpression
def testExpressionCheck():
    error = compileString("""
program p;
  type arrtype = array [1 .. 7] of integer;
  var z: arrtype;
  var x, y: integer;
  begin 
    x := -z -z; {bad type, bad type}
    x := 1 >= z {bad type}
  end;
""", os.devnull, suppress_errors = True)
    return error



def testCompoundStatementCheck():
    error = compileString("""
program p;
  var x: integer;
  {begin expected} 
    x := 1 
    x := 2
  {end expected}
""", os.devnull, suppress_errors = True)
    return error


def testAssignmentStatementCheck():
    error = compileString("""
program p;
  var x: integer;
  var y: boolean;
  begin 
    5; {statement expected, invalid statement}
    x := y; {incompatible assignment }
    y = x; {:= expected}
    y and y {:= expected}

  end;
""", os.devnull, suppress_errors = True)
    return error



def testProcCallCheck():
    error = compileString("""
program p;
  type aa = integer;
  var x, y: integer;
  procedure q(var a, b: integer);
    begin 
      a := 7
    end;
  procedure q2;
    var a: integer;
    begin 
      a := 7
    end;
  begin 
    x := 1;
    q(5, 5); {illegal param mode x2}
    q(x, x, x); {extra param}
    q(x); {too few param}
    q(x,x ;{) expected}
    q2(x) {extra param}
    aa {variable or procedure expected}
  end
""", os.devnull, suppress_errors = True)
    return error


def testConditionalStatementCheck():
    error = compileString("""
program p;
  var x, y: integer;
  var p, q: boolean;
  begin 
    if p {then expected}
      x := 5;
    
    while p  {do expected}
      x := 5; 
    
    while x then{bool expected}
      x := 1
  end
""", os.devnull, suppress_errors = True)
    error += compileString("""
    program p;
      var x, y: integer;
      begin 
        if x then{bool expected}
          x := 5
      end
    """, os.devnull, suppress_errors = True)
    return error


def testTypeCheck():
    """ type expected"""
    error = compileString("""
program p;
  type a: 5;
  type b = c;
  type d = array 1..4 integer;

  var x: a;
  begin 
    x := 5
  end;
""", os.devnull, suppress_errors = True)

    error += compileString("""
program p;

  type d = array [1:4] of integer; {. expected}
  type e = array [1.4] integer; {. expected, of expected}
  type f = array [-1..-4] of integer; {bad upper, lower bound}
  type g = record h: integer {end expected}


  var x: integer;
  begin 
    x := 5
  end;
""", os.devnull, suppress_errors = True)
    return error



def testTypedIdsCheck():

    error = compileString("""
program p;
  type s = record g, h = integer end; {: expected}
  var x: integer;
  begin 
    x := 5
  end;
""", os.devnull, suppress_errors = True)

    error += compileString("""
program p;
  type s = record g, 1 : integer end; {identifier expected}
  var x: integer;
  begin 
    x := 5
  end;
""", os.devnull, suppress_errors = True)
    return error





