import unittest
from subprocess import call, Popen, PIPE

import os, sys

# add path to compile function
sys.path.insert(0, "../")
from compile import compile_nasm
from x86test import runall

import sys
if sys.version_info[0] < 3:
    from cStringIO import StringIO
else:
	from io import BytesIO as StringIO


SRC_DIR = os.path.realpath("./test_programs/") + '/'
ASM_DIR = os.path.realpath("./test_programs/asm/") + '/'
EXEC_DIR = os.path.realpath("./test_programs/exec/") + '/'

def compileAll():

	filenames = os.listdir(SRC_DIR)

	for fname in filenames:

		filepath = SRC_DIR + fname
		if os.path.isfile(filepath):
			compile_nasm(filepath, ASM_DIR, EXEC_DIR)


def run_exec(src, input=""):

	src = EXEC_DIR + src

	if input != "":
		cmd = "echo " + str(input) + " | " + src
	else:
		cmd = src

	process = Popen("script " + os.devnull + " -c '" + cmd + "' -q", stdout=PIPE, shell=True)
	output = process.communicate()[0].decode("utf-8") 
	return output  


class FileExtTestCase(unittest.TestCase):

	def test_output(self):
		print('File Ext: It should throw an error when trying to compile file without .p ext')

		with self.assertRaises(Exception) as context:
		    compile_nasm('myfile.py')

		self.assertEqual(".p' file extension expected", str(context.exception))



class ArithmeticTestCase(unittest.TestCase):

	def test_output(self):
		print('Arithmetic: It should peform compound division, mod, multiplication, addition, and subtraction')
		expected = '5\r\n5\r\n0\r\n\r\n5\r\n1\r\n10\r\n30\r\n\r\n\r\n0\r\n20\r\n\r\n'
		result = run_exec('arithmetic')

		self.assertEqual(result, expected)


class FactorialTestCase(unittest.TestCase):

	def test_output(self):
		print('Arithmetic: It should print the factorial of numbers 1-10')
		expected = '5\r\n5\r\n0\r\n\r\n5\r\n1\r\n10\r\n30\r\n\r\n\r\n0\r\n20\r\n\r\n'
		result = run_exec('factorial', 10)

		self.assertEqual(result, result)

if __name__ == '__main__':

	compileAll()
	runall()
	#unittest.main()



# missing coverage
# mark('semicolon expected')
# exceptions in codegen