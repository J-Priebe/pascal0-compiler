import unittest
from cStringIO import StringIO
from subprocess import call, Popen, PIPE
import os

# TODO
# Use compileFile directly instead of call
# implement assertion structure for code gen checks (check the error code)
# make sure the compile script fails and throws a warning if there is an error
# change arbitrary newlines in read, write functions. Expected outputs should be straightforward

# add destination folder parameters for compiled files and assembly intermediates
# fix gitignore
# add HELP and dest params to compile.py

COMPILER_DIR = os.path.realpath("../")



# class ArithmeticTestCase(unittest.TestCase):

# 	def test_output(self):
# 		print('Arithmetic: It should peform compound division, mod, multiplication, addition, and subtraction')
# 		expected = '5\r\n5\r\n0\r\n\r\n5\r\n1\r\n10\r\n30\r\n\r\n\r\n0\r\n20\r\n\r\n'
# 		call("python3 compile.py test/test_programs/arithmetic.p", cwd=COMPILER_DIR, shell=True)
# 		process = Popen("script -c './test_programs/arithmetic' -q", stdout=PIPE, shell=True)
# 		result = process.communicate()[0]

# 		self.assertEquals(result, expected)

# # class ArrayRecordsTestCase(unittest.TestCase):

# # 	def test_output(self):
# # 		expected = '5\r\n5\r\n0\r\n\r\n5\r\n1\r\n10\r\n30\r\n\r\n\r\n0\r\n20\r\n\r\n'
# # 		call("python3 compile.py test/test_programs/arrays_records.p", cwd=COMPILER_DIR, shell=True)
# # 		process = Popen("script -c './test_programs/arrays_records' -q", stdout=PIPE, shell=True)
# # 		result = process.communicate()
# # 		print result

# # 		self.assertTrue(result[0] == expected)


# class ConditionsTestCase(unittest.TestCase):

# 	def test_output(self):
# 		print('Conditions: It should evaluate boolean expressions and execute conditional statements')
# 		expected = '7\r\n9\r\n7\r\n9\r\n9\r\n7\r\n7\r\n7\r\n7\r\n9\r\n7\r\n9\r\n9\r\n9\r\n\r\n3\r\n5\r\n7\r\n3\r\n5\r\n5\r\n3\r\n5\r\n\r\n9\r\n8\r\n7\r\n6\r\n5\r\n4\r\n3\r\n\r\n7\r\n'
# 		call("python3 compile.py test/test_programs/conditions.p", cwd=COMPILER_DIR, shell=True)
# 		process = Popen("script -c './test_programs/conditions' -q", stdout=PIPE, shell=True)
# 		result = process.communicate()[0]

# 		self.assertEquals(result, expected)

# class FactorialTestCase(unittest.TestCase):

# 	def test_output(self):
# 		print('Factorial: It should read n=12 as input and print out the numbers from 1 to 12 and their factorials')
# 		expected = 'Enter an integer: 1\r\n1\r\n\r\n2\r\n2\r\n\r\n3\r\n6\r\n\r\n4\r\n24\r\n\r\n5\r\n120\r\n\r\n6\r\n720\r\n\r\n7\r\n5040\r\n\r\n8\r\n40320\r\n\r\n9\r\n362880\r\n\r\n10\r\n3628800\r\n\r\n11\r\n39916800\r\n\r\n12\r\n479001600\r\n\r\n'
# 		call("python3 compile.py test/test_programs/factorial.p", cwd=COMPILER_DIR, shell=True)
# 		process = Popen("script -c 'echo 12 | ./test_programs/factorial' -q", stdout=PIPE, shell=True)
# 		result = process.communicate()[0]

# 		self.assertEquals(result, expected)

# class OrderTestCase(unittest.TestCase):

# 	def test_output(self):
# 		print('Order: It should print out the numbers 1 to 4')
# 		expected = '1\r\n2\r\n3\r\n4\r\n'
# 		call("python3 compile.py test/test_programs/order.p", cwd=COMPILER_DIR, shell=True)
# 		process = Popen("script -c './test_programs/order' -q", stdout=PIPE, shell=True)
# 		result = process.communicate()[0]

# 		self.assertEquals(result, expected)

# class ParamsTestCase(unittest.TestCase):

# 	def test_output(self):
# 		expected = '5\r\n5\r\n0\r\n\r\n5\r\n1\r\n10\r\n30\r\n\r\n\r\n0\r\n20\r\n\r\n'
# 		call("python3 compile.py test/test_programs/params.p", cwd=COMPILER_DIR, shell=True)
# 		process = Popen("script -c './test_programs/params' -q", stdout=PIPE, shell=True)
# 		result = process.communicate()
# 		print result

# 		self.assertTrue(result[0] == expected)

class ReadTestCase(unittest.TestCase):

	def test_output(self):
		print('Read: It should read n=5 and print out 3*n, 3*5*n')
		expected = 'Enter an integer: 15\r\n75\r\n'
		#call("python3 compile.py test/test_programs/readwrite.p", cwd=COMPILER_DIR, shell=True)
		process = Popen("script " + os.devnull + " -c 'echo 5 | ./test_programs/readwrite' -q", stdout=PIPE, shell=True)
		result = process.communicate()[0]

		self.assertEquals(result, expected)


def run_exec(input, program_name):
	cmd = "echo " + str(input) + " | ./test_programs/" + program_name
	process - Popen("script " + os.devnull + " -c '" + cmd + "' -q", stdout=PIPE, shell=True)
	output = process.communicate()[0]
	return output  

if __name__ == '__main__':

	unittest.main()

