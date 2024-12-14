func printHelloWorld(){
    print("Hello World!")
}

printHelloWorld()

//function definition...
func printDetails(name:String, age:Int){
    print(
        """
        The user's name is: \(name).
        The user's age is: \(age).
        \(name) is awesome!
        """
    )
}


//calling the function...
printDetails(name: "Donald", age: 25)

func sumOf(array:[Int]) -> Int{
    var sum = 0
    for item in array{
        sum += item
    }
    
    //returns the value...
    return sum
}

//calling the function with an integer array
print(sumOf(array: [1,2,3,4,5]))


//function definition...
func navigate(with vehicle:String, from source:String, to destination:String) -> String{
    return "The user will use a \(vehicle) to travel from \(source) to \(destination)."
}

//calling the function
print(navigate(with: "car", from: "Boston", to: "NYC"))


//function definition...
func printHello(_ name:String){
    print("Hello \(name)!")
}

//Calling the function...
printHello("Sameer")


//function definition
func printHello2(_ name:String = "Unknown"){
    print("Hello \(name)!")
}
//calling function...
printHello2()
