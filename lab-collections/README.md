# Working with Lists, Tuples, and Dictionaries Lab

## Lab Overview
- **Course**: Introduction to Programming
- **Lab**: Working with Lists, Tuples, and Dictionaries
- **Environment**: AWS Cloud9 IDE
- **Python Version**: 3.6.12

## Learning Objectives
- Understand and use list data type
- Understand and use tuple data type  
- Understand and use dictionary data type
- Access elements by position/index
- Modify mutable vs immutable collections
- Compare different collection types

## Python Collections Covered

### 1. Lists
- **Mutable** ordered collection
- Created with square brackets `[]`
- Elements can be added, removed, or modified
- Accessed by zero-based index

### 2. Tuples
- **Immutable** ordered collection
- Created with parentheses `()`
- Elements cannot be changed after creation
- Accessed by zero-based index

### 3. Dictionaries
- **Mutable** unordered collection of key-value pairs
- Created with curly braces `{}`
- Accessed by keys instead of numerical indices
- Keys must be unique and immutable

## Key Characteristics

| Feature | List | Tuple | Dictionary |
|---------|------|-------|------------|
| Mutability | Mutable | Immutable | Mutable |
| Syntax | `[]` | `()` | `{}` |
| Access | By index | By index | By key |
| Order | Ordered | Ordered | Unordered (Python 3.7+: insertion order) |

## Code Examples

### Lists
```python
# Creating and modifying lists
myList = ["apple", "banana", "cherry"]
myList[2] = "orange"  # Valid - lists are mutable
Tuples
python
# Creating tuples (immutable)
myTuple = ("apple", "banana", "pineapple")
# myTuple[2] = "orange"  # Invalid - tuples are immutable
Dictionaries
python
# Creating and accessing dictionaries
myDict = {"Akua": "apple", "Saanvi": "banana"}
print(myDict["Akua"])  # Access by key
Files
collections.py - Complete Python program demonstrating all three collection types

How to Run
bash
cd lab-collections
python collections.py
Expected Output
text
=== LISTS ===
['apple', 'banana', 'cherry']
<class 'list'>
apple
banana
cherry
['apple', 'banana', 'orange']

=== TUPLES ===
('apple', 'banana', 'pineapple')
<class 'tuple'>
apple
banana
pineapple

=== DICTIONARIES ===
{'Akua': 'apple', 'Saanvi': 'banana', 'Paulo': 'pineapple'}
<class 'dict'>
apple
banana
pineapple
Concepts Demonstrated
Collection creation and initialization

Element access by index and key

Mutability vs immutability

Data type checking with type()

Collection modification (where applicable)
