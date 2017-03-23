# TODO
# implement assertion structure for code gen checks (check the error code)
# change arbitrary newlines in read, write functions. Expected outputs should be straightforward
# smaller input files, and more of them (e.g., arithmetic -> add, div, mod, ...)

import unittest
from cStringIO import StringIO
from subprocess import call, Popen, PIPE

import os, sys

# add path to compile function
sys.path.insert(0, "../")
from compile import compile_nasm

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
	output = process.communicate()[0]
	return output  


class ArithmeticTestCase(unittest.TestCase):

	def test_output(self):
		print('Arithmetic: It should peform compound division, mod, multiplication, addition, and subtraction')
		expected = '5\r\n5\r\n0\r\n\r\n5\r\n1\r\n10\r\n30\r\n\r\n\r\n0\r\n20\r\n\r\n'
		result = run_exec('arithmetic')

		self.assertEquals(result, expected)


if __name__ == '__main__':

	compileAll()
	unittest.main()
