import UIKit

//MARK: Question 6, Divide and conquer
/*
 First, create a function that returns the number of times an integer can be divided by another integer without a remainder. The function should return nil if the division doesn’t produce a whole number. Name the function divideIfWhole.

 Then, write code that tries to unwrap the optional result of the function. There should be two cases: upon success, print "Yep, it divides \(answer) times", and upon failure, print "Not divisible :[".

 Finally, test your function:
 
 Call divideIfWhole(10, by: 2) -> 5. Since, the returned value is not nil, print: "Yep, it divides 5 times."
 divideIfWhole(10, by: 3) -> nil. Since, the returned value is nil, print: "Not divisible :[."
 
 
 
 borrowed from: https://www.kodeco.com/
 */

func divideIfWhole(numerator dividend: Int, by divisor: Int) -> Int? {
    var quotient:Int?
    
    if divisor == 0 {
        return nil
    }
    
    if dividend % divisor == 0 {
        quotient = dividend / divisor
    } else {
        quotient = nil
    }
    return quotient
}

func display(_ number:Int?){
    if let number = number{
        print("Yep, it divides \(number) times")
    }else{
        print("Not divisible :[")
    }
}

//Test Case - 1
let answer1:Int? = divideIfWhole(numerator: 10, by: 2)
display(answer1)

//Test Case - 2
let answer2:Int? = divideIfWhole(numerator: 10, by: 3)
display(answer2)

//Test Case - 3
let answer3:Int? = divideIfWhole(numerator: 10, by: 0)
display(answer3)

