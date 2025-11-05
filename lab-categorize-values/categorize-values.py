# Enhanced version with additional analysis
myMixedTypeList = [45, 290578, 1.02, True, "My dog is on the bed.", "45"]

print("Mixed Type List Analysis:")
print("=" * 50)
print("Original list:", myMixedTypeList)
print("List length:", len(myMixedTypeList))
print("=" * 50)

# Analyze each item with index
for index, item in enumerate(myMixedTypeList):
    print("Item {}: {:<25} -> Data Type: {}".format(
        index, 
        repr(item), 
        type(item).__name__
    ))

print("=" * 50)
print("Note: Python allows mixing different data types in lists!")
print("This includes: int, float, bool, str, and many others.")