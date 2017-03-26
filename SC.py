"""
Pascal0 Scanner, Emil Sekerinski, March 2016
"""

TIMES = 1; DIV = 2; MOD = 3; AND = 4; PLUS = 5; MINUS = 6
OR = 7; EQ = 8; NE = 9; LT = 10; GT = 11; LE = 12; GE = 13
PERIOD = 14; COMMA = 15; COLON = 16; RPAREN = 17; RBRAK = 18
OF = 19; THEN = 20; DO = 21; LPAREN = 22; LBRAK = 23; NOT = 24
BECOMES = 25; NUMBER = 26; IDENT = 27; SEMICOLON = 28
END = 29; ELSE = 30; IF = 31; WHILE = 32; ARRAY = 33
RECORD = 34; CONST = 35; TYPE = 36; VAR = 37; PROCEDURE = 38
BEGIN = 39; PROGRAM = 40; EOF = 41
keywords = ((DO, 'do'), (IF, 'if'), (OF, 'of'), (OR, 'or'),
            (AND, 'and'), (NOT, 'not'), (END, 'end'), (MOD, 'mod'),
            (VAR, 'var'), (ELSE, 'else'), (THEN, 'then'),
            (TYPE, 'type'), (ARRAY, 'array'), (BEGIN, 'begin'),
            (CONST, 'const'), (WHILE, 'while'), (RECORD, 'record'),
            (PROCEDURE, 'procedure'), (DIV, 'div'), (PROGRAM, 'program'))

# (line, pos) is the location of the current symbol in source
# (lastline, lastpos) is used to more accurately report errors
# (errline, errpos) is used to suppress multiple errors at the same location
# ch is the current character and sym the current symbol
# if sym is NUMBER, val is the number, if sym is IDENT, val is the identifier
# source is the string with the source program

def getErrors():
    if len(errors):
        return errors
    else:
        return False

def init(src):
    global line, lastline, errline, pos, lastpos, errpos, errors
    global sym, val, error, source, index
    errors = []
    line, lastline, errline = 1, 1, 1
    pos, lastpos, errpos = 0, 0, 0
    sym, val, error, source, index = None, None, False, src, 0
    getChar(); getSym()

def getChar():
    global line, lastline, pos, lastpos, ch, source, index
    if index == len(source): ch = chr(0)
    else:
        ch, index = source[index], index+1
        lastpos = pos
        if ch == '\n':
            pos, line = 0, line+1
        else:
            lastline, pos = line, pos+1

def number():
    global sym, val
    sym, val = NUMBER, 0
    while '0' <= ch <= '9':
        val = 10*val+int(ch)
        getChar()
    if val >= 2**31:
        mark('number too large'); val = 0

def ident():
    global sym, val
    start = index - 1
    while ('A' <= ch <= 'Z') or ('a' <= ch <= 'z') or \
          ('0' <= ch <= '9'): getChar()
    for kw, s in keywords:
        if source[start:index-1] == s:
            sym = kw; return
    sym, val = IDENT, source[start:index-1]

def comment():
    while chr(0) != ch != '}': getChar()
    if ch == chr(0): mark('comment not terminated')
    else: getChar()

def mark(msg):
    global errline, errpos, error, errors
    if lastline > errline or lastpos > errpos:
        print('error: line', lastline, 'pos', lastpos, msg)
        errors.append(msg)

    errline, errpos, error = lastline, lastpos, True

def getSym():
    global sym
    while chr(0) < ch <= ' ': getChar()
    if ch == chr(0): sym = EOF
    elif ch == '*': getChar(); sym = TIMES
    elif ch == '+': getChar(); sym = PLUS
    elif ch == '-': getChar(); sym = MINUS
    elif ch == '=': getChar(); sym = EQ
    elif ch == '<':
        getChar()
        if ch == '=': getChar(); sym = LE
        elif ch == '>': getChar(); sym = NE
        else: sym = LT
    elif ch == '>':
        getChar()
        if ch == '=': getChar(); sym = GE
        else: sym = GT
    elif ch == ';': getChar(); sym = SEMICOLON
    elif ch == ',': getChar(); sym = COMMA
    elif ch == ':':
        getChar()
        if ch == '=': getChar(); sym = BECOMES
        else: sym = COLON
    elif ch == '.': getChar(); sym = PERIOD
    elif ch == '(': getChar(); sym = LPAREN
    elif ch == ')': getChar(); sym = RPAREN
    elif ch == '[': getChar(); sym = LBRAK
    elif ch == ']': getChar(); sym = RBRAK
    elif '0' <= ch <= '9': number()
    elif 'A' <= ch <= 'Z' or 'a' <= ch <= 'z':
        ident()
    elif ch == '{': comment(); getSym()
    else: getChar(); mark('unrecognized character');sym = None

