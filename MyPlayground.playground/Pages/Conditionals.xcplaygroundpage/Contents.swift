let myNum = 3
//condition myNum==5 returns either true or false...
if myNum == 5 {
    //This code block executes if true...
    print("It is 5!")
}

//if-else-if-else chain ...
if myNum == 1 {
    print("It is \(myNum)!")
}else if myNum == 3{
    print("It is \(myNum)!")
}else if myNum == 5{
    print("It is \(myNum)!")
}else{
    print("Not 1, 3, or 5!")
}

//switch statements...
let day = 5
switch day {
case 1:
    print("Sunday")
case 2:
    print("Monday")
case 3:
    print("Tuesday")
case 4:
    print("Wednesday")
case 5:
    print("Thursday")
case 6:
    print("Friday")
case 7:
    print("Saturday")
default:
    print("Invalid day")
}

let myAge = 24

if myAge >= 18 && myAge <= 65 {
    print("Eligible for the user study!")
}

if myAge < 18 || myAge > 65 {
    print("Not eligible!")
}


let today = 7

switch today{
    case 1...5:
        print("Weekday!")
    case 6..<8:
        print("Weekend!")
    default:
        print("Invalid day!")
}
