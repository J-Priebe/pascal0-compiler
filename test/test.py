import unittest
from subprocess import call, Popen, PIPE

import os, sys

# add path to compile function
sys.path.insert(0, "../")
from compile import compile_nasm
from x86test import *#runall

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



class SelectorTestCase(unittest.TestCase):
	def test_errors(self):
		print('Selector syntax: It should return selector syntax errors')
		expected_errors = range(1,8)
		actual_errors = testSelectorCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))


class FactorTestCase(unittest.TestCase):
	def test_errors(self):
		print('Factor syntax: It should return factor syntax errors')
		expected_errors = range(8,13)
		actual_errors = testFactorCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))


class TermTestCase(unittest.TestCase):
	def test_errors(self):
		print('Term syntax: It should return term syntax errors')
		expected_errors = [13]
		actual_errors = testTermCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))

class ExpressionTestCase(unittest.TestCase):
	def test_errors(self):
		print('Expression syntax: It should return expression syntax errors')
		expected_errors = [14,15, 16]
		actual_errors = testExpressionCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))

class CompoundStatementTestCase(unittest.TestCase):
	def test_errors(self):
		print('Compound statement syntax: It should return compound statement syntax errors')
		expected_errors = [17,18,19]
		actual_errors = testCompoundStatementCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))

class AssignmentStatementTestCase(unittest.TestCase):
	def test_errors(self):
		print('Assignment statement syntax: It should return assignment statement syntax errors')
		expected_errors = [20, 22, 23, 24, 36]
		actual_errors = testAssignmentStatementCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))


class ProcedureCallTestCase(unittest.TestCase):
	def test_errors(self):
		print('Procedure call  syntax: It should return procedure call errors')
		expected_errors = range(25,32)
		actual_errors = testProcCallCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))


class ConditionalStatementTestCase(unittest.TestCase):
	def test_errors(self):
		print('Conditional statement syntax: It should return conditional statement syntax errors')
		expected_errors = range(32,36)
		actual_errors = testConditionalStatementCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))



class LevelTestCase(unittest.TestCase):
	def test_errors(self):
		print('Level: It should return level syntax error')
		expected_errors = [103]
		actual_errors = testLevelCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))


class MaxValueTestCase(unittest.TestCase):
	def test_errors(self):
		print('Max Value: It should return value too large error')
		expected_errors = [200]
		actual_errors = testMaxValueCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))


class BooleanParamTestCase(unittest.TestCase):
	def test_errors(self):
		print('Boolean Value Param: It should return incorrect parameter type error')
		expected_errors = [104]
		actual_errors = testBooleanParamMode()
		self.assertTrue(set(expected_errors) <= set(actual_errors))



class ProcDecTestCase(unittest.TestCase):
	def test_errors(self):
		print('Procedure Declarations: It should return procedure declaration syntax errors')
		expected_errors = range(50, 64)
		actual_errors = testProcedureDeclarationsCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))


class ProgramDecTestCase(unittest.TestCase):
	def test_errors(self):
		print('Program Declaration: It should return program declaration syntax errors')
		expected_errors = range(64,67)
		actual_errors = testProgramDeclCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))



class CharTestCase(unittest.TestCase):
	def test_errors(self):
		print('Character parsing: It should return unrecognized character error')
		expected_errors = [202]
		actual_errors = testGetChar()
		self.assertTrue(set(expected_errors) <= set(actual_errors))



class PassByValueTestCase(unittest.TestCase):
	def test_errors(self):
		print('Array passing: It should return pass by value error')
		expected_errors = [102]
		actual_errors = testPassByValueCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))





class TypesTestCase(unittest.TestCase):
	def test_errors(self):
		print('Type declarations: It should return type declarations syntax errors')
		expected_errors = range(37, 48)
		actual_errors = testTypeCheck()
		self.assertTrue(set(expected_errors) <= set(actual_errors))


class TypedIdsTestCase(unittest.TestCase):
	def test_errors(self):
		print('Typed identifiers: It should return typed identifier syntax errors')
		expected_errors = [48,49]
		actual_errors = testTypedIdsCheck()

		self.assertTrue(set(expected_errors) <= set(actual_errors))






# class FileExtTestCase(unittest.TestCase):

# 	def test_output(self):
# 		print('File Ext: It should throw an error when trying to compile file without .p ext')

# 		with self.assertRaises(Exception) as context:
# 		    compile_nasm('myfile.py')

# 		self.assertEqual(".p' file extension expected", str(context.exception))



# class ArithmeticTestCase(unittest.TestCase):

# 	def test_output(self):
# 		print('Arithmetic: It should peform compound division, mod, multiplication, addition, and subtraction')
# 		expected = '5\r\n5\r\n0\r\n\r\n5\r\n1\r\n10\r\n30\r\n\r\n\r\n0\r\n20\r\n\r\n'
# 		result = run_exec('arithmetic')

# 		self.assertEqual(result, expected)


# class FactorialTestCase(unittest.TestCase):

# 	def test_output(self):
# 		print('Arithmetic: It should print the factorial of numbers 1-10')
# 		expected = '5\r\n5\r\n0\r\n\r\n5\r\n1\r\n10\r\n30\r\n\r\n\r\n0\r\n20\r\n\r\n'
# 		result = run_exec('factorial', 10)

# 		self.assertEqual(result, result)

if __name__ == '__main__':

	#compileAll()
	#runall()
	unittest.main()



# missing coverage
# mark('semicolon expected')
# exceptions in codegen