//Arrays

var carManufacturers = [String]()

var secondListOfManufacturers = ["BMW", "Audi"]

carManufacturers.append("Hyundai")
carManufacturers.append("Mazda")
carManufacturers.append("Toyota")

print("The first list of car manufacturers -", carManufacturers)
print("The second list of car manufacturers -", secondListOfManufacturers)
print("No.of car maufacturers in first list -", carManufacturers.count)

print("The first element of carManufacturers: \(carManufacturers[0])")
print("The second element of secondListOfManufacturers: \(secondListOfManufacturers[1])")

carManufacturers.remove(at: 2)
print("After removing:", carManufacturers)


//Sets

var colors = Set<String>()
colors.insert("black")

print(colors)


colors.insert("blue")
colors.insert("red")

// prints the current Set...
print(colors)

let Colors = Set(["blue", "black", "red"])
colors.remove("black")
print(colors)


//Tuples

// Simple tuple
var myTuple = ("Mark", 20)
// We can also define the names of the elements
var yourTuple = (name:"Julie", age:24)

//print tuples
print("myTuple: \(myTuple), yourTuple: \(yourTuple)")
// accessing tuple elements
print("yourTuple's elements:\n first element = \(yourTuple.0),\n second element = \(yourTuple.age)")

yourTuple.age = 34
// or, yourTuple.1 = 34
print("yourTuple: \(yourTuple)")

//Dictionaries

var carCounts = [String : Int]()
var CarCounts = [
    "Toyota": 2,
    "Mazda": 4,
    "Honda": 3
]

print(CarCounts)

carCounts.updateValue(4, forKey:"Chevy")
print(carCounts)

CarCounts.updateValue(2, forKey: "Honda")

carCounts["Subaru"] = 10

print(carCounts)
print(CarCounts)
