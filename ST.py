"""
Pascal0 Symbol Table, Emil Sekerinski, March 2016.
The symbol table is a list of scopes, each scope is a list of entries.
Symbol table entries are Var, Ref, Const, Type, Proc, StdProc;
all have a field tp for the type. Types are Int, Bool, Record, Array.
"""

from SC import mark

class Var:
    def __init__(self, tp):
        self.tp = tp

class Ref:
    def __init__(self, tp):
        self.tp = tp

class Const:
    def __init__(self, tp, val):
        self.tp, self.val = tp, val

class Type:
    def __init__(self, tp):
        self.tp = tp

class Proc:
    def __init__(self, par):
        self.tp, self.par = None, par

class StdProc:
    def __init__(self, par):
        self.tp, self.par = None, par

class Int: pass

class Bool: pass

class Record:
    def __init__(self, fields):
        self.fields = fields

class Array:
    def __init__(self, base, lower, length):
        self.base, self.lower, self.length = base, lower, length

def init():
    global symTab
    symTab = [[]]

def newObj(name, entry):
    top, entry.lev, entry.name = symTab[0], len(symTab) - 1, name
    for e in top:
        if e.name == name:
            mark("multiple definition"); return
    top.append(entry)

def find(name):
    for l in symTab:
        for e in l:
            if name == e.name: return e
    mark('undefined identifier ' + name)
    undef = Var(Int); undef.lev, undef.adr = 0, 0
    return undef

def openScope():
    symTab.insert(0, [])

def topScope():
    return symTab[0]

def closeScope():
    symTab.pop(0)
