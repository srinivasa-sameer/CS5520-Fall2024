var myInt:Int?
print(myInt)

myInt = 10
print(myInt)

//optional binding with if-let...
if let unwrappedMyInt = myInt{
    //value present
    print(unwrappedMyInt)
}else{
    // handling nil
    print("Optional value myInt must be initialized!")
}


//forced unwrapping...
print(myInt!)
// prints 10
