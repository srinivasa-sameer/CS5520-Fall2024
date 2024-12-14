import UIKit

//MARK: Question 1, Concatenating Two Integers

/* Create a function to concatenate two integer arrays.
 concatenate([1, 3, 5], [2, 6, 8]) ➞ [1, 3, 5, 2, 6, 8]

 concatenate([7, 8], [10, 9, 1, 1, 2]) ➞ [7, 8, 10, 9, 1, 1, 2]

 concatenate([4, 5, 1], [3, 3, 3, 3, 3]) ➞ [4, 5, 1, 3, 3, 3, 3, 3]
 
 Do not forget to return the resulting array.
 
 Borrowed from: edabit.com
 */

//Calling the function
// let concatenatedArray = concatenate(array1:[...], array2:[...])
// print(concatenatedArray)


func concatenate(array1: [Int], array2: [Int]) -> [Int]{
    return array1 + array2
}

let result1 = concatenate(array1: [1, 3, 5], array2: [2, 6, 8])
print("Result 1 - \(result1)")

let result2 = concatenate(array1: [7, 8], array2: [10, 9, 1, 1, 2])
print("Result 2 - \(result2)")

let result3 = concatenate(array1: [4, 5, 1], array2: [3, 3, 3, 3, 3])
print("Result 3 - \(result3)")

let result4 = concatenate(array1: [], array2: [])
print("Result 4 - \(result4)")

