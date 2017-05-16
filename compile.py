import os, sys
import optparse
from P0 import program #entry point
import SC, ST, CGx86 as CG


def compileString(src, dstfn = None, suppress_errors = False):
    """Compiles string src; if dstfn is provided, the code is written to that
    file, otherwise printed on the screen. Returns the latest error message, if any"""
    SC.init(src, suppress_errors)
    ST.init()
    CG.init()
    try:
        p = program()
    #compounding errors cause compile to crash, exit when we can't continue
    except Exception as e:
        #errors = SC.getErrors()
        #print('COMPILER ERROR', e)
        pass

    errors = SC.getErrors()
    if not errors:
        if dstfn == None: 
            print(p)
        else:
            with open(dstfn, 'w') as f: f.write(p);
    return errors


#python compile.py tests/filename ASM_DEST EXEC_DEST
# should throw warn if not using python 3
def compile_nasm(srcfn, asm_dest_dir ='./', exec_dest_dir ='./', suppress_errors = False):



    if srcfn.endswith('.p'):
        with open(srcfn, 'r') as f: src = f.read()

        filename = os.path.basename(srcfn)
        dirname = os.path.dirname(srcfn)

        dstfn = filename[:-2] + '.s'
        objfn = filename[:-2] + '.o'
        binfn = filename[:-2]
        error = compileString(src, asm_dest_dir + dstfn, suppress_errors)
        if error:
            print('%s : There are errors in the source file. Could not compile.' % (filename))
            print(error)
            #sys.exit(0)
        else:
            os.system('nasm -f elf64 '+ (asm_dest_dir + dstfn) + ' && gcc -m64 -o ' + (exec_dest_dir +binfn) + ' ' + asm_dest_dir + objfn)
            os.system('rm ' + asm_dest_dir + objfn)

    else: 
        #print("'.p' file extension expected")
        raise Exception(".p' file extension expected")

if __name__ == "__main__":

    parser = optparse.OptionParser(usage="%prog /path/to/file.p [options] ")
    parser.add_option("-a", "--asm", dest="asm_dest_dir",
                      help="Directory to output assembly file [default: current dir]",
                      default="./", metavar="ASMDIR")
    
    parser.add_option("-e", "--exec", dest="exec_dest_dir",
                      help="Directory to output executable [default: current dir]",
                      default = "./", metavar="EXECDIR")

    options, args = parser.parse_args()
    if len(args) != 1:
        parser.error("No source file specified")
    else:
        src = args[0]

    compile_nasm(src, options.asm_dest_dir, options.exec_dest_dir)
