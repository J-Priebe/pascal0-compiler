import os, sys
import optparse

from P0 import compileString

#python3 compile.py tests/filename ASM_DEST EXEC_DEST
def compile_nasm(srcfn, asm_dest_dir ='./', exec_dest_dir ='./'):



    if srcfn.endswith('.p'):
        with open(srcfn, 'r') as f: src = f.read()

        filename = os.path.basename(srcfn)
        dirname = os.path.dirname(srcfn)

        dstfn = filename[:-2] + '.s'
        objfn = filename[:-2] + '.o'
        binfn = filename[:-2]
        error = compileString(src, asm_dest_dir + dstfn)
        if error:
            print('There are errors in the source file. Could not compile.')
            sys.exit(0)

        os.system('nasm -f elf64 '+ (asm_dest_dir + dstfn) + ' && gcc -m64 -o ' + (exec_dest_dir +binfn) + ' ' + asm_dest_dir + objfn)
        os.system('rm ' + asm_dest_dir + objfn)

    else: print("'.p' file extension expected")

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
