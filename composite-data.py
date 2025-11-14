import csv
import copy

# Define the vehicle template as a dictionary
myVehicle = {
    "vin": "<empty>",
    "make": "<empty>",
    "model": "<empty>",
    "year": 0,
    "range": 0,
    "topSpeed": 0,
    "zeroSixty": 0.0,
    "mileage": 0
}

# Print the initial template
print("=== VEHICLE TEMPLATE ===")
for key, value in myVehicle.items():
    print("{} : {}".format(key, value))
print()

# Create empty list for inventory
myInventoryList = []

# Read and process the CSV file
print("=== READING CSV DATA ===")
with open('car_fleet.csv') as csvFile:
    csvReader = csv.reader(csvFile, delimiter=',')
    lineCount = 0
    
    for row in csvReader:
        if lineCount == 0:
            # This is the header row
            print(f'Column names: {", ".join(row)}')
            lineCount += 1
        else:
            # This is a data row
            print(f'Processing: {row[0]} {row[1]} {row[2]}')
            
            # Create a deep copy of the template
            currentVehicle = copy.deepcopy(myVehicle)
            
            # Fill in the data from CSV
            currentVehicle["vin"] = row[0]
            currentVehicle["make"] = row[1]
            currentVehicle["model"] = row[2]
            currentVehicle["year"] = int(row[3])
            currentVehicle["range"] = int(row[4])
            currentVehicle["topSpeed"] = int(row[5])
            currentVehicle["zeroSixty"] = float(row[6])
            currentVehicle["mileage"] = int(row[7])
            
            # Add to inventory list
            myInventoryList.append(currentVehicle)
            lineCount += 1
    
    print(f'Processed {lineCount - 1} vehicles\n')

# Print the final inventory
print("=== CAR INVENTORY ===")
for i, car in enumerate(myInventoryList, 1):
    print(f"Car #{i}:")
    for key, value in car.items():
        print("{} : {}".format(key, value))
    print("-----")