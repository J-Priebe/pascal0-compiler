"""
Pascal0 Code Generator for x86_64. 
A retargetting of the MIPS Code Generator by Emil Sekerinski, March 2016.
Using delayed code generation for a one-pass compiler. The types of symbol
table entries for expressions, Var, Ref, Const, are extended by two more
types Reg for expression results in a register, and Cond, for short-circuited
Boolean expressions with two branch targets.

"""

import SC  #  used for SC.error
from SC import TIMES, DIV, MOD, AND, PLUS, MINUS, OR, EQ, NE, LT, GT, LE, \
     GE, NOT, mark
from ST import Var, Ref, Const, Type, Proc, StdProc, Int, Bool, Array, Record


# using rbx as zero register
R0 = 'rbx'; FP = 'rbp'; SP = 'rsp'  # reserved registers

# track size of parameters pushed to stack 
# so it can be restored after procedure return
global stacksize
stacksize = 0

class Reg:
    """
    For integers or booleans stored in a register;
    register can be $0 for constants '0' and 'false'
    """
    def __init__(self, tp, reg):
        self.tp, self.reg = tp, reg

class Cond:
    """
    For a boolean resulting from comparing left and right by cond:
    left, right are either registers or constants, but one has to be a register;
    cond is one of 'EQ', 'NE', 'LT', 'GT', 'LE', 'GE';
    labA, labB are lists of branch targets for when the result is true or false
    if right is $0, then cond 'EQ' and 'NE' can be used for branching depending
    on register left.
    """
    count = 0
    def __init__(self, cond, left, right):
        self.tp, self.cond, self.left, self.right = Bool, cond, left, right
        self.labA = ['C' + str(Cond.count)]; Cond.count += 1
        self.labB = ['C' + str(Cond.count)]; Cond.count += 1

# asm is the string with the generated assembly code
# curlev is the current level of nesting of procedures
# regs is the set of available registers for expression evaluation

def init():
    """initializes the code generator"""
    global asm, curlev, regs
    asm, curlev = '', 0
    # x86_64 registers, equivalent to MIPs t1..t8
    regs = {'r8', 'r9', 'r10', 'r11', 'r12', 'r13', 'r14', 'r15'} 
                                

def obtainReg():
    if len(regs) == 0: mark('out of registers'); return R0
    else: return regs.pop()

def releaseReg(r):
    if r not in (R0, SP, FP): regs.add(r)

def putLab(lab, instr = ''):
    """Emit label lab with optional instruction; lab may be a single
    label or a list of labels"""
    global asm
    if lab.__class__ == list:
        for l in lab[:-1]: asm += l + ':\n'
        asm += lab[-1] + ':\t' + instr + '\n'
    else: asm += lab + ':\t' + instr + '\n'

def putInstr(instr):
    """Emit an instruction"""
    global asm
    asm += ('\t' + instr + '\n')


# # emit two op
# def put(op, a, b):
#     putInstr(op + ' ' + a + ', ' + str(b))


def loadAddress(reg, offset, address):
    if offset == R0: 
        putInstr('lea ' + reg + ', [' + str(address) + ']')
    else: 
        putInstr('lea ' + reg + ', [' + str(address) + ' + ' + str(offset) + ']')

def store(reg, offset, address):
    if offset == R0: 
        putInstr('mov [' + str(address) + '], ' + reg)
    else:
        putInstr('mov [' + str(address) + ' + ' + str(offset) + '], ' + reg)

def load(reg, offset, address):
    if offset == R0: 
        putInstr('mov ' + reg + ', [' + str(address) + ']')
    else: 
        putInstr('mov ' + reg + ', [' + str(address) + ' + ' + str(offset) + ']')

#put constant in register
def moveConst(r, val):
    putInstr('mov ' + r + ', '+ str(val))


def testRange(x):
    """Check if x is suitable for immediate addressing"""
    if x.val >= 0x10000000000 or x.val < -0x10000000000: mark('value too large')
    
def loadItemReg(x, r):
    """Assuming item x is Var, Const, or Reg, loads x into register r"""
    if x.__class__ == Var:
        load(r, x.reg, x.adr); releaseReg(x.reg)         
    elif x.__class__ == Const:
        testRange(x); moveConst(r, x.val)
    elif x.__class__ == Reg: # move to register r
        putInstr('mov ' + r + ', ' + x.reg)
    # else: 
    #     #assert(False)
    #     raise Exception('x is not of type Var, Const, or Reg') 

def loadItem(x):
    """Assuming item x is Var or Const, loads x into a new register and
    returns a new Reg item"""
    if x.__class__ == Const and x.val == 0: 
        r = R0 # use R0 for "0"
    else: 
        r = obtainReg() 
        loadItemReg(x, r)
    return Reg(x.tp, r)

def loadBool(x):
    """Assuming x is Var or Const and x has type Bool, loads x into a
    new register and returns a new Cond item"""
    # improve by allowing c.left to be a constant
    if x.__class__ == Const and x.val == 0: r = R0 # use R0 for "false"
    else: 
        r = obtainReg()
        loadItemReg(x, r)
    c = Cond(NE, r, R0)
    return c

def putOp (cd, x, y):
    """For operation op with mnemonic cd, emit code for x op y, assuming
    x, y are Var, Const, Reg"""
    if x.__class__ != Reg: x = loadItem(x)
    if x.reg == R0: 
        x.reg, r = obtainReg(), R0
    else: 
        r = x.reg # r is source, x.reg is destination

    if y.__class__ == Const:
        testRange(y) 
        putInstr('mov ' + r + ', ' + x.reg)
        putInstr(cd + ' ' + r + ', ' + str(y.val))
    else:
        if y.__class__ != Reg: y = loadItem(y)
        # print('r.reg class = %s' % (r.__class__))
        # loadItemReg(x, r)
        putInstr('mov ' + x.reg + ', ' + r)
        putInstr(cd + ' ' + x.reg + ', ' + y.reg)
        releaseReg(y.reg)
    return x


def putDivide(x, y):
    if x.__class__ != Reg: x = loadItem(x)
    if x.reg == R0: x.reg, r = obtainReg(), R0
    else: r = x.reg # r is source, x.reg is destination
    if y.__class__ == Const:
        testRange(y) 
        putInstr('mov rax, ' + r)
        yc = obtainReg()
        putInstr('mov ' + yc + ', ' + str(y.val))
        putInstr('xor rdx, rdx')
        putInstr('idiv ' + yc)
        releaseReg(yc)
        # retrieve result from rax
        putInstr('mov ' + r + ', rax')

    else:
        if y.__class__ != Reg: y = loadItem(y)
        putInstr('mov ' + x.reg + ', ' + r)
        loadItemReg(x, 'rax')
        putInstr('xor rdx, rdx')
        putInstr('idiv ' + y.reg)
        putInstr('mov ' + x.reg + ', rax')
        releaseReg(y.reg)
    return x


def putModulo(x, y):
    if x.__class__ != Reg: 
        x = loadItem(x)

    if x.reg == R0: 
        x.reg, r = obtainReg(), R0
    else: 
        r = x.reg # r is source, x.reg is destination
    if y.__class__ == Const:
        testRange(y) 
        putInstr('mov rax, ' + r)
        yc = obtainReg()
        putInstr('mov ' + yc + ', ' + str(y.val))
        putInstr('xor rdx, rdx')
        putInstr('idiv ' + yc)
        releaseReg(yc)
        # remainder is stored in rdx
        putInstr('mov ' + r + ', rdx')

    else:
        if y.__class__ != Reg: 
            y = loadItem(y)
        putInstr('mov ' + x.reg + ', ' + r)
        putInstr('mov rax, ' + x.reg)
        putInstr('xor rdx, rdx')
        putInstr('idiv ' + y.reg)
        putInstr('mov ' + x.reg + ', rdx')
        releaseReg(y.reg)
    return x



# public functions

def genRec(r):
    """Assuming r is Record, determine fields offsets and the record size"""
    s = 0
    for f in r.fields:
        f.offset, s = s, s + f.tp.size
    r.size = s
    return r

def genArray(a):
    """Assuming r is Array, determine its size"""
    # adds size
    a.size = a.length * a.base.size
    return a

def genLocalVars(sc, start):
    """For list sc of local variables, starting at index starts, determine the
    $fp-relative addresses of variables"""
    s = 0 # local block size
    for i in range(start, len(sc)):
        s = s + sc[i].tp.size
        sc[i].adr = - s
    return s

def genGlobalVars(sc, start):
    """For list sc of global variables, starting at index start, determine the
    address of each variable, which is its name with a trailing _"""
    putInstr('section .bss      ; uninitialized data')
    putInstr('')   
    putLab('number', 'resb 8')   # for reading ints

    for i in range(len(sc) - 1, start - 1, - 1):
        sc[i].adr = sc[i].name + '_'
        putLab(sc[i].adr, 'resb ' + str(sc[i].tp.size))
    putInstr('')
    putInstr('section .text')
    putInstr('')

def progStart():
    putInstr('extern printf')
    putInstr('extern scanf')
    putInstr('global main')
    putInstr('')
    putInstr('section .data')
    putInstr('')
    
    putLab('newline', 'db "", 10, 0')
    putLab('write_msg','db "%d", 10, 0') # format string for printing ints
    putLab('read_msg','db "Enter an integer: ", 0') # message for reading ints
    putLab('read_format','db "%d", 0') # format string for reading ints

    putInstr('')

def progEntry(ident):
    putLab('main')
    putInstr('mov rbx, 0 ; our "zero register"')
    putInstr('')

def progExit(x):
    putInstr('') #newline
    putInstr('mov rax, 60   ;exit call')
    putInstr('mov rdi, 0    ;return code 0')
    putInstr('syscall')
    return asm
        
def procStart():
    global curlev, parblocksize
    curlev = curlev + 1

def genFormalParams(sc):
    """For list sc with formal procedure parameters, determine the $fp-relative
    address of each parameters; each parameter must be type integer, boolean
    or must be a reference parameter"""
    s = 16 # parameter block size
    for p in reversed(sc):
        if p.tp == Int or p.tp == Bool or p.__class__ == Ref:
            p.adr, s = s, s + 8
        else: mark('arrays and records cannot be passed by value')
    return s

def genProcEntry(ident, parsize, localsize):
    """Declare procedure name, generate code for procedure entry"""
    """ parameters are accessed with EBP + offset """

    putLab(ident)                      
    # set up stack frame
    putInstr('push rbp')
    putInstr('mov rbp, rsp')
    # local variable space
    putInstr('sub rsp, ' + str(localsize))


def genProcExit(x, parsize, localsize): # generates return code
    global curlev
    curlev = curlev - 1

    #restore stack
    putInstr('mov rsp, rbp') 
    putInstr('pop rbp')
    putInstr('ret')
    putInstr('')



def genSelect(x, f):
    # x.f, assuming y is name in one of x.fields
    x.tp, x.adr = f.tp, x.adr + f.offset if x.adr.__class__ == int else \
                        x.adr + '+' + str(f.offset)
    return x

def genIndex(x, y):
    # x[y], assuming x is ST.Var or ST.Ref, x.tp is ST.Array, y.tp is ST.Int
    # assuming y is Const and y.val is valid index, or Reg integer
    if y.__class__ == Const:
        offset = (y.val - x.tp.lower) * x.tp.base.size
        x.adr = x.adr + (offset if x.adr.__class__ == int else ' + ' + str(offset))
    else:
        if y.__class__ != Reg: y = loadItem(y)

        #pascal arrays have arbitrary indices
        putInstr('sub ' + y.reg + ', ' + str(x.tp.lower))

        putInstr('imul ' + y.reg + ', ' + str(x.tp.base.size))

        if x.reg != R0:
            putInstr('add ' + y.reg + ', ' + x.reg)
            releaseReg(x.reg)
        x.reg = y.reg
    x.tp = x.tp.base
    return x

def genVar(x):
    # assuming x is ST.Var, ST.Ref, ST.Const
    # for ST.Const: no code, x.val is constant
    # for ST.Var: x.reg is FP for local, 0 for global vars,
    #   x.adr is relative or absolute address
    # for ST.Ref: address is loaded into register
    # returns ST.Var, ST.Const
    if x.__class__ == Const: 
        y = x
    else:
        if x.lev == 0: 
            s = R0
        elif x.lev == curlev: 
            s = FP
        else: mark('level!'); s = R0
        y = Var(x.tp); y.lev = x.lev
        if x.__class__ == Ref: # reference is loaded into register
            r = obtainReg()
            load(r, s, x.adr)
            y.reg, y.adr = r, 0; print('gen var with adr = 0')
        elif x.__class__ == Var:
            y.reg, y.adr = s, x.adr
        else: y = x # error, pass dummy item
    return y

def genConst(x):
    # assumes x is ST.Const
    return x

def genUnaryOp(op, x):
    """If op is MINUS, NOT, x must be an Int, Bool, and op x is returned.
    If op is AND, OR, x is the first operand (in preparation for the second
    operand"""
    if op == MINUS: # subtract from 0
        if x.__class__ == Var: x = loadItem(x)
        putInstr('neg ' + x.reg)
    elif op == NOT: # switch condition and branch targets, no code
        if x.__class__ != Cond: x = loadBool(x)
        x.cond = negate(x.cond) 
        x.labA, x.labB = x.labB, x.labA
    elif op == AND: # load first operand into register and branch
        if x.__class__ != Cond: x = loadBool(x)

        neg = condOp(negate(x.cond))
        putInstr('cmp ' + x.left + ', ' + x.right)
        putInstr(neg + ' ' + x.labA[0])

        releaseReg(x.left) 
        releaseReg(x.right)
        putLab(x.labB)
    elif op == OR: # load first operand into register and branch
        if x.__class__ != Cond: x = loadBool(x)
        
        neg = condOp(x.cond)
        putInstr('cmp ' + x.left + ', ' + x.right)
        putInstr(neg + ' ' + x.labB[0])    
        
        releaseReg(x.left); releaseReg(x.right); putLab(x.labA)
    # else: 
    #     #assert(False)
    #     raise Exception('Unary Op not recognized')
    return x

def genBinaryOp(op, x, y):
    """assumes x.tp == Int == y.tp and op is TIMES, DIV, MOD
    or op is AND, OR"""
    if op == PLUS: 
        y = putOp('add', x, y)
    elif op == MINUS: 
        y = putOp('sub', x, y)
    elif op == TIMES: 
        y = putOp('imul', x, y)
    elif op == DIV: 
        # x64 uses rax register for division
        y = putDivide(x, y)

    elif op == MOD: 
        # use remainder from div op
        y = putModulo(x, y)
    elif op == AND: # load second operand into register 
        if y.__class__ != Cond: y = loadBool(y)
        y.labA += x.labA # update branch targets
    elif op == OR: # load second operand into register
        if y.__class__ != Cond: y = loadBool(y)
        y.labB += x.labB # update branch targets
    # else: 
    #     #assert(False)
    #     raise Exception('binary op not recognized')
    return y

def negate(cd):
    """Assume op in {EQ, NE, LT, LE, GT, GE}, return not op"""
    return NE if cd == EQ else \
           EQ if cd == NE else \
           GE if cd == LT else \
           GT if cd == LE else \
           LE if cd == GT else \
           LT

def condOp(cd):
    """Assumes op in {EQ, NE, LT, LE, GT, GE}, return instruction mnemonic"""
    return 'je' if cd == EQ else \
           'jne' if cd == NE else \
           'jl' if cd == LT else \
           'jle' if cd == LE else \
           'jg' if cd == GT else \
           'jge'

def genRelation(op, x, y):
    """Assumes x, y are Int and op is EQ, NE, LT, LE, GT, GE;
    x and y cannot be both constants; return Cond for x op y"""
    if x.__class__ != Reg: x = loadItem(x)
    if y.__class__ != Reg: y = loadItem(y)
    return Cond(op, x.reg, y.reg)

assignCount = 0

def genAssign(x, y):
    """Assume x is Var, generate x := y"""
    global assignCount, regs
    if y.__class__ == Cond: # 
        neg = condOp(negate(y.cond))
        putInstr('cmp ' + y.left + ', ' + y.right)
        putInstr(neg + ' ' + y.labA[0])
        releaseReg(y.left); releaseReg(y.right); r = obtainReg()
        
        putLab(y.labB)  # load true
        putInstr('mov ' + r + ', 1')
        lab = 'A' + str(assignCount); assignCount += 1
        putInstr('jmp ' + lab)
        
        putLab(y.labA) # load false 
        putInstr('mov ' + r + ', 0')
        putLab(lab)
    
    elif y.__class__ != Reg: y = loadItem(y); r = y.reg
    else: r = y.reg
    store(r, x.reg, x.adr); releaseReg(r)

def genActualPara(ap, fp, n):
    """Pass parameter, ap is actual parameter, fp is the formal parameter,
    either Ref or Var, n is the parameter number"""
    global stacksize

    if fp.__class__ == Ref:  #  reference parameter, assume p is Var
        print('ref param address: %s' % (ap.adr))
        if ap.adr != 0:  #  load address in register
            r = obtainReg()
            loadAddress(r, ap.reg, ap.adr)
        else: 
            r = ap.reg  #  address already in register
        
        putInstr('push ' + r)
        stacksize += 8 # we restore stack after return
        releaseReg(r)

    else:  #  value parameter
        if ap.__class__ != Cond:
            if ap.__class__ != Reg: 
                ap = loadItem(ap)
            putInstr('push ' + ap.reg)
            stacksize += 8
            releaseReg(ap.reg)
        else: mark('unsupported parameter type')

def genCall(pr):
    """Assume pr is Proc"""
    global stacksize

    putInstr('call ' + pr.name)
    putInstr('add rsp, ' + str(stacksize))
    stacksize = 0

    
# Use C scanf, printf calls for I/O

def genRead(x):
    """Assume x is Var"""

    putInstr('')
    putInstr('mov rdi, read_msg')
    putInstr('mov rax, 0')
    putInstr('call printf')
    putInstr('mov rdi, read_format')
    putInstr('mov rsi, number')
    putInstr('mov rax, 0')
    putInstr('call scanf')
    putInstr('mov rsi, [number]')
    putInstr('mov [' + str(x.adr) + '], rsi')
    putInstr('')


def genWrite(x):

    # use c printf 
    putInstr('')
    putInstr('mov rdi, write_msg')
    loadItemReg(x, 'rsi')
    putInstr('mov rax, 0')
    putInstr('call printf')
    putInstr('')


def genWriteln():

    putInstr('')
    putInstr('mov rdi, newline')
    putInstr('mov rax, 0')
    putInstr('call printf')
    putInstr('')


def genSeq(x, y):
    """Assume x and y are statements, generate x ; y"""
    pass

def genCond(x):
    """Assume x is Bool, generate code for branching on x"""
    if x.__class__ != Cond: x = loadBool(x)
    neg = condOp(negate(x.cond))
    putInstr('cmp ' + x.left + ', ' + x.right)
    putInstr(neg + ' ' + x.labA[0])
    releaseReg(x.left); releaseReg(x.right); putLab(x.labB)
    return x

def genIfThen(x, y):
    """Generate code for if-then: x is condition, y is then-statement"""
    putLab(x.labA)

ifCount = 0

def genThen(x, y):
    """Generate code for if-then-else: x is condition, y is then-statement"""
    global ifCount
    lab = 'I' + str(ifCount); ifCount += 1
    putInstr('jmp ' + lab)
    putLab(x.labA); 
    return lab

def genIfElse(x, y, z):
    """Generate code of if-then-else: x is condition, y is then-statement,
    z is else-statement"""
    putLab(y)

loopCount = 0

def genTarget():
    """Return target for loops with backward branches"""
    global loopCount
    lab = 'L' + str(loopCount); loopCount += 1
    putLab(lab)
    return lab

def genWhile(t, x, y):
    """Generate code for while: t is target, x is condition, y is body"""
    putInstr('jmp ' + t)
    putLab(x.labA); 

