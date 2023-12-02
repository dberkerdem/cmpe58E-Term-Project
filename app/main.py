from utils import ArithmeticOperations, StringManipulations

# Arithmetic operations
a = 10
b = 5

print(f"Addition: {ArithmeticOperations.add(a, b)}")
print(f"Subtraction: {ArithmeticOperations.subtract(a, b)}")
print(f"Multiplication: {ArithmeticOperations.multiply(a, b)}")

# String manipulations
s = "hello world"

print(f"Capitalized: {StringManipulations.capitalize_string(s)}")
print(f"Reversed: {StringManipulations.reverse_string(s)}")
