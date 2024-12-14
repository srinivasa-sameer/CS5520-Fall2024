import UIKit

//MARK: Question 3, Find the Largest Numbers in a Group of Arrays

/*
 Create a function that takes an array of arrays with numbers. Return a new (single) array with the largest numbers of each.

 findLargest([[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]]) ➞ [7, 90, 2]

 findLargest([[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]]) ➞ [-34, -2, 7]

 findLargest([[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]]) ➞ [0.7634, 9.32, 9, 4]
 
 It is OK, if your returning array is [Double]
 
 Borrowed from: edabit.com
 */

//Calling the function
// let arrayOfLargests = findLargest(...)
// print(arrayOfLargests)


func findLargest(inputArrayOfArrays inputArray:[[Double]]) -> [Double]{
    var maxArray:[Double] = []
    for array in inputArray{
        var max: Double?
        max = array.max()
        maxArray.append(max!)
    }
    return maxArray
}

// Test Case - 1
let arrayOfLargests1  = findLargest(inputArrayOfArrays: [[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]])
print("The largest value array in the given arrays - \(arrayOfLargests1)")

// Test Case - 2
let arrayOfLargests2  = findLargest(inputArrayOfArrays: [[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]])
print("The largest value array in the given arrays - \(arrayOfLargests2)")

// Test Case - 3
let arrayOfLargests3  = findLargest(inputArrayOfArrays: [[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]])
print("The largest value array in the given arrays - \(arrayOfLargests3)")
