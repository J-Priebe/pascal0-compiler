import os, sys

from P0 import compileString

#python3 compile.py tests/filename

def compile(srcfn):

    if srcfn.endswith('.p'):
        with open(srcfn, 'r') as f: src = f.read()
        dstfn = srcfn[:-2] + '.s'
        objfn = srcfn[:-2] + '.o'
        binfn = srcfn[:-2]
        compileString(src, dstfn)

        os.system('nasm -f elf64 '+ dstfn + ' && gcc -m64 -o ' + binfn + ' ' + objfn)
        os.system('rm ' + objfn)

    else: print("'.p' file extension expected")

if __name__ == "__main__":
  compile(sys.argv[1])
