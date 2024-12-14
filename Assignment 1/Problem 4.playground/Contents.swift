import UIKit

//MARK: Question 4, Remove the First and Last Characters

/*
 Create a function that removes the first and last characters from a string.
 
 removeFirstLast("hello") ➞ "ell"

 removeFirstLast("maybe") ➞ "ayb"

 removeFirstLast("benefit") ➞ "enefi"

 removeFirstLast("a") ➞ "a"
 
 Borrowed from: edabit.com
 
 HINT: remove(at: index)
 */

//Calling the function
// let removedFirstAndLast = removeFirstLast(...)
// print(removedFirstAndLast)

func removeFirstLast(inputString input:String) -> String {
    if input.count == 1{
        return input
    }
    
    var modifiedString = input
    
    if modifiedString.count != 0 {
        modifiedString.remove(at: modifiedString.startIndex)
        modifiedString.remove(at: modifiedString.index(before: modifiedString.endIndex))
    }
    return modifiedString
}


//Test Case - 1
let modifiedString1 = removeFirstLast(inputString: "hello")
print("The result string after removing the first and last characters is - \(modifiedString1)")

//Test Case - 2
let modifiedString2 = removeFirstLast(inputString: "maybe")
print("The result string after removing the first and last characters is - \(modifiedString2)")

//Test Case - 3
let modifiedString3 = removeFirstLast(inputString: "benefit")
print("The result string after removing the first and last characters is - \(modifiedString3)")

//Test Case - 4
let modifiedString4 = removeFirstLast(inputString: "a")
print("The result string after removing the first and last characters is - \(modifiedString4)")

//Test Case - 5
let modifiedString5 = removeFirstLast(inputString: "ab")
print("The result string after removing the first and last characters is - \(modifiedString5)") //Should give an empty string

//Test Case - 6
let modifiedString6 = removeFirstLast(inputString: " ")
print("The result string after removing the first and last characters is - \(modifiedString6)") //Should give an empty string

//Test Case - 7
let modifiedString7 = removeFirstLast(inputString: "bet")
print("The result string after removing the first and last characters is - \(modifiedString7)")
