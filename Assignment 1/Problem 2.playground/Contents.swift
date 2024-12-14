import UIKit

//MARK: Question 2, Sort and Array by String length

/* Create a function that takes an array of strings and return an array, sorted from shortest to longest.
 
 sortByLength(["Google", "Apple", "Microsoft"])
 ➞ ["Apple", "Google", "Microsoft"]

 sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])
 ➞ ["Raphael", "Leonardo", "Donatello", "Michelangelo"]

 sortByLength(["Turing", "Einstein", "Jung"])
 ➞ ["Jung", "Turing", "Einstein"]
 
 Borrowed from: edabit.com
 */


//Calling the function
// let sortedArray = sortByLength(...)
// print(sortedArray)

func sortByLength(inputArray input:[String]) -> [String]{
    let result:[String] = input.sorted(by: { (value1:String, value2: String) -> Bool in
        return value1.count < value2.count
    })
    return result
}

// Test Case - 1
let sortedArray1 = sortByLength(inputArray: ["Google", "Apple", "Microsoft"])
print("Sorted Array - \(sortedArray1)")

// Test Case - 2
let sortedArray2 = sortByLength(inputArray: ["Leonardo", "Michelangelo", "Raphael", "Donatello"])
print("Sorted Array - \(sortedArray2)")

// Test Case - 3
let sortedArray3 = sortByLength(inputArray: ["Turing", "Einstein", "Jung"])
print("Sorted Array - \(sortedArray3)")

// Test Case - 4
let sortedArray4 = sortByLength(inputArray: [])
print("Sorted Array - \(sortedArray4)")

// Test Case - 5
let sortedArray5 = sortByLength(inputArray: ["Sameer", "sameer", "sAmeer"])
print("Sorted Array - \(sortedArray5)")
