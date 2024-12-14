import UIKit

//MARK: Question 5, Four Passengers and a Driver

/*
 A typical car can hold four passengers and one driver, allowing five people to travel around. Given n number of people, return how many cars are needed to seat everyone comfortably.

 carsNeeded(5) ➞ 1

 carsNeeded(11) ➞ 3

 carsNeeded(0) ➞ 0
 
 Borrowed from: edabit.com
 */

//Calling the function
// let numberOfCars = carsNeeded(...)
// print(numberOfCars)


func carsNeeded(numberOfPassengers input:Int) -> Int{
    var numberOfCarsNeeded:Double = Double(input)/5
    
    numberOfCarsNeeded = ceil(numberOfCarsNeeded)
    
    return Int(numberOfCarsNeeded)
}

//Test Case - 1
let numberOfCarsNeeded1 = carsNeeded(numberOfPassengers: 5)
print("No.of cars needed - \(numberOfCarsNeeded1)")

//Test Case - 2
let numberOfCarsNeeded2 = carsNeeded(numberOfPassengers: 11)
print("No.of cars needed - \(numberOfCarsNeeded2)")

//Test Case - 3
let numberOfCarsNeeded3 = carsNeeded(numberOfPassengers: 0)
print("No.of cars needed - \(numberOfCarsNeeded3)")
