# Working with the String Data Type Lab

## Lab Overview
- **Course**: Introduction to Programming
- **Lab**: Working with the String Data Type
- **Environment**: AWS Cloud9 IDE
- **Python Version**: 3.6.12

## Learning Objectives
- Understand and use string data type
- Practice string concatenation
- Get user input with input() function
- Format output strings using .format() method
- Use type() and print() functions with strings

## String Concepts Covered

### 1. String Basics
- Creating string variables
- Using print() function
- Checking data type with type()

### 2. String Concatenation
- Combining strings using + operator
- Creating new strings from multiple parts

### 3. User Input
- Using input() function to get user data
- Storing input in variables
- Interactive programming

### 4. String Formatting
- Using .format() method
- Placeholder syntax with {}
- Creating formatted output messages

## Key Functions & Methods
- `print()` - Output values to console
- `type()` - Get data type of variable
- `str()` - Convert to string for concatenation
- `input()` - Get user input from console
- `.format()` - Format strings with variables

## Files
- `string-data-type.py` - Complete Python program demonstrating string operations

## Program Flow
1. Create and display basic string
2. Check and display string data type
3. Demonstrate string concatenation
4. Get user name input
5. Get user favorite color and animal
6. Display formatted output using all collected information

## How to Run
```bash
cd lab-string-data-type
python string-data-type.py
Example Interaction
text
What is your name? Maria
What is your favorite color? blue
What is your favorite animal? dog
Maria, you like a blue dog!
Code Examples
python
# String creation
myString = "This is a string."

# String concatenation
combined = "water" + "fall"  # Results in "waterfall"

# User input
name = input("What is your name? ")

# String formatting
print("{}, you like a {} {}!".format(name, color, animal))
Concepts Demonstrated
Variable assignment with strings

String manipulation

User interaction

Output formatting

Data type checking
