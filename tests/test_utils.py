# test_utils.py
import unittest
from app.utils import ArithmeticOperations, StringManipulations


class TestArithmeticOperations(unittest.TestCase):
    def test_add(self):
        self.assertEqual(ArithmeticOperations.add(1, 2), 3)

    def test_subtract(self):
        self.assertEqual(ArithmeticOperations.subtract(5, 3), 2)

    def test_multiply(self):
        self.assertEqual(ArithmeticOperations.multiply(3, 4), 12)


class TestStringManipulations(unittest.TestCase):
    def test_capitalize_string(self):
        self.assertEqual(StringManipulations.capitalize_string("hello"), "Hello")

    def test_reverse_string(self):
        self.assertEqual(StringManipulations.reverse_string("hello"), "olleh")


if __name__ == "__main__":
    unittest.main()
