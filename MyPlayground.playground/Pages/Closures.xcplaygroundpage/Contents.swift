
let printHello = {
    print("Hello World!")
}

//calling closure...
printHello()


let sayHelloTo = { (name:String) in
    print("Hello \(name)!")
}

//calling closure with parameter...
sayHelloTo("Donald")

let sumOfArray = {(array:[Int]) -> Int in
    var sum = 0
    for item in array{
        sum += item
    }
    
    //returns the value...
    return sum
}

//calling the closure with an integer array
print(sumOfArray([1,2,3,4,5]))

let drive = {
    print("I am driving!")
}

let fly = {
    print("I am taking a flight!")
}

//taking a closure as the parameter 'how'
func travel(from source:String, to destination:String, how: ()->Void){
    
    print("I have to travel from \(source) to \(destination).")
    how()
}

//calling the function
travel(from: "San Francisco", to: "Boston", how: fly)


//defining three closures to add, subtract, and multiply two numbers
let add = {(num1:Int, num2:Int) -> Int in
    return num1+num2
}

let subtract = {(num1:Int, num2:Int) -> Int in
    return num1-num2
}

let multiply = {(num1:Int, num2:Int) -> Int in
    return num1*num2
}

// calculate function...
func calculate(operation: (_:Int, _:Int)-> Int, num1:Int, num2:Int) -> Int{
    
    let result = operation(num1, num2)
    
    return result
}

//calling function to multiply...
print(calculate(operation: multiply, num1: 2, num2: 23))
