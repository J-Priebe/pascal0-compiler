# Pascal0-to-Assembly Compiler
Compiles Pascal0 to 64-bit NASM assembly code. Started as my final project for McMaster course 4TB3: Syntax-based Tools and Compilers. I've since expanded upon it with a full test suite, refactoring, optimizations, and and usability improvements.

### Pascal0
A simplified  and fully compatible subset of Pascal (i.e., works with any regular Pascal compiler), created by Dr. Emil Sekerinski for McMaster 4TB3.

## Usage
Compile a Pascal0 source file with 

`python3 compile.py /path/to/my_p0_code.p [options]`

There are example Pascal0 programs under `test/test_programs`.

### Requirements
Requires Python 3+ to compile to assembly. 
64-bit Linux with `gcc` and `nasm` is required to compile an executable file.

### Compiler Options
`-a` or `--asm`: directory to save generated assembly file (default: current directory)

`-e` or `--exec` : directory to save the executable (default: current directory)

## Testing
Testing is split into parsing/compiler-time error catching as well as behavior-driven testing of compiled executables. The latter is done by compiling the programs in `test/test_programs`, which cover all of the structures of the Pascal0 grammar and check for specific behaviors (e.g., passing arguments to procedures, local and global variable scope, code optimizations).

The test suite can be run by navigating to the `test` directory and running `python3 test.py`. I suggest using [Coverage](https://coverage.readthedocs.io/en/coverage-4.4.1/) to verify test completeness. As is, tests cover 100% of code in the parser and code generator.


## Further Reading

To learn more about the code generated, calling conventions, register usage, etc., you can [view the original documentation here.](https://github.com/J-Priebe/pascal0-compiler/blob/master/docs/README.ipynb)
