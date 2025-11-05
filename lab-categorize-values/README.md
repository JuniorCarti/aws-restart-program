# Categorizing Values Lab

## Lab Overview
- **Course**: Introduction to Programming
- **Lab**: Categorizing Values
- **Environment**: AWS Cloud9 IDE
- **Python Version**: 3.6.12

## Learning Objectives
- Create lists with mixed data types
- Use for loops to iterate through lists
- Identify data types using type() function
- Format output using .format() method
- Understand Python's dynamic typing in lists

## Key Concepts

### Mixed-Type Lists
- Python allows different data types in the same list
- Unlike many other programming languages
- Provides flexibility in data storage
- Each element maintains its own data type

### For Loops
- Used to iterate through each item in a collection
- Syntax: `for item in collection:`
- Automatically handles iteration
- No need to manage indexes manually

### Data Type Identification
- `type()` function returns the data type of any object
- Combined with string formatting for clear output
- Essential for debugging and data analysis

## Code Example
```python
myMixedTypeList = [45, 290578, 1.02, True, "My dog is on the bed.", "45"]

for item in myMixedTypeList:
    print("{} is of the data type {}".format(item, type(item)))
Data Types Demonstrated
int - Integer numbers (45, 290578)

float - Floating point numbers (1.02)

bool - Boolean values (True)

str - String values ("My dog is on the bed.", "45")

Important Notes
The string "45" is different from the integer 45

Python preserves the original data type of each element

This flexibility is unique to Python compared to statically-typed languages

Files
categorize-values.py - Python program demonstrating mixed-type lists

categorize-values-enhanced.py - Optional enhanced version with additional features

How to Run
bash
cd lab-categorize-values
python categorize-values.py
Expected Output
text
Mixed Type List Analysis:
========================================
45 is of the data type <class 'int'>
290578 is of the data type <class 'int'>
1.02 is of the data type <class 'float'>
True is of the data type <class 'bool'>
My dog is on the bed. is of the data type <class 'str'>
45 is of the data type <class 'str'>
Concepts Demonstrated
List creation with mixed data types

For loop iteration

Data type checking with type()

String formatting with .format()

Python's dynamic typing capabilities
