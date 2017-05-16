import unittest
from subprocess import call, Popen, PIPE

import os, sys

# add path to compile function
sys.path.insert(0, "../")
from compile import compile_nasm
from x86test import *


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






class FileExtTestCase(unittest.TestCase):

	def test_output(self):
		print('File Ext: It should throw an error when trying to compile file without .p ext')

		with self.assertRaises(Exception) as context:
		    compile_nasm('myfile.py')

		self.assertEqual(".p' file extension expected", str(context.exception))



class ArithmeticTestCase(unittest.TestCase):

	def test_output(self):
		print('Arithmetic: It should peform compound division, mod, multiplication, addition, and subtraction')
		expected = '5 5 0  5 0 10 30   0 20 '
		result = run_exec('arithmetic').replace('\r\n', ' ')

		self.assertEqual(result, expected)


class FactorialTestCase(unittest.TestCase):

	def test_output(self):
		print('Arithmetic: It should print the factorial of numbers 1-10')
		expected = '1 1 2 2 3 6 4 24 5 120 6 720 7 5040 8 40320 9 362880 10 3628800 '
		result = run_exec('factorial').replace('\r\n', ' ')

		self.assertEqual(result, expected)


class ArraysAndRecordsTestCase(unittest.TestCase):

	def test_output(self):
		print('Arrays and records: It should access and write to array and record indices and fields')
		expected = '5 3 9  5 3 9  7 7  7 7 '
		result = run_exec('arrays_records').replace('\r\n', ' ')

		self.assertEqual(result, expected)

class ConditionsTestCase(unittest.TestCase):

	def test_output(self):
		print('Conditionals: It should execute branching conditional statements and while loops')
		expected = '7 9 7 9 9 7 7 7 7 9 7 9 9 9  3 5 7 3 5 5 3 5  9 8 7 6 5 4 3  7 '
		result = run_exec('conditions').replace('\r\n', ' ')

		self.assertEqual(result, expected)

class ArgumentOrderTestCase(unittest.TestCase):

	def test_output(self):
		print('Argument Order: It should print the arguments in the order they were passed')
		expected = '1 2 3 4 '
		result = run_exec('order').replace('\r\n', ' ')

		self.assertEqual(result, expected)

class ParameterScopeTestCase(unittest.TestCase):
	def test_output(self):
		print('Parameter Scope: It should read/write local and global parameters passed by value and by reference')
		expected = '6 5 7  5 5  7 5  5 7  5 '
		result = run_exec('params').replace('\r\n', ' ')

		self.assertEqual(result, expected)



if __name__ == '__main__':

	python_version = sys.version_info[0]
	if python_version < 3:
		print("Python %s.x is not supported. Please use Python 3+." % (str(python_version)) )
		sys.exit(0)

	compileAll()
	unittest.main()

