# Exercise 1: List Data Type
print("=== LISTS ===")
myFruitList = ["apple", "banana", "cherry"]
print(myFruitList)
print(type(myFruitList))

# Accessing list by position
print(myFruitList[0])
print(myFruitList[1])
print(myFruitList[2])

# Changing list values
myFruitList[2] = "orange"
print(myFruitList)

# Exercise 2: Tuple Data Type
print("\n=== TUPLES ===")
myFinalAnswerTuple = ("apple", "banana", "pineapple")
print(myFinalAnswerTuple)
print(type(myFinalAnswerTuple))

# Accessing tuple by position
print(myFinalAnswerTuple[0])
print(myFinalAnswerTuple[1])
print(myFinalAnswerTuple[2])

# Exercise 3: Dictionary Data Type
print("\n=== DICTIONARIES ===")
myFavoriteFruitDictionary = {
  "Akua": "apple",
  "Saanvi": "banana", 
  "Paulo": "pineapple"
}
print(myFavoriteFruitDictionary)
print(type(myFavoriteFruitDictionary))

# Accessing dictionary by key
print(myFavoriteFruitDictionary["Akua"])
print(myFavoriteFruitDictionary["Saanvi"])
print(myFavoriteFruitDictionary["Paulo"])