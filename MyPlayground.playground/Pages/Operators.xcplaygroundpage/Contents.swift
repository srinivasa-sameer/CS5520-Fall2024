let num1 = 5
let num2 = 33

//Addition...
let sum = num1 + num2

//Subtraction...
let difference = num2 - num1

//Multiplication...
let product = num1 * num2

//Division (and remainder)...
let divided = num2 / num1
let remainder = num2 % num1

print(
    """
    Results:
    Sum = \(sum)
    Difference = \(difference)
    Product = \(product)
    Division result = \(divided)
    Division remainder = \(remainder)
    """
)


let firstName = "Srinivasa Sameer"
let lastName = "Addepalli"
let fullName = firstName + " " + lastName
print(fullName)

let listNumOne = [1,2,3]
let listNumTwo = [4,5,6]
let listNum = listNumOne + listNumTwo
print(listNum)


//Increment...
var count = 0
count += 1
// count = 1

//Multiply...
var number = 5
number *= 4
// number = 20

//Divide...
var number2 = 10
number2 /= 2
// number2 = 5

//String operations (concatenation)...
var name = "Mark"
var surname = "Webber"
name += surname
// name = "MarkWebber"

// Comparison operators and Booleans...
let a = 10
let b = 12

let isEqual = a == b

print(isEqual)
print(type(of: isEqual))
