let range = 1...10

for number in range{
    print(number)
}


var carMakesSecond = ["Toyota", "Honda", "Mazda", "Chevy"]

for item in carMakesSecond{
    print(item)
}

for _ in 1...10{
    print("Doing the task!")
}

var targetNum = 1
while targetNum <= 50{
    //code block
    print(targetNum)
    targetNum += 1
}


var myNum = 1

repeat{
    //code block
    print(myNum)
    myNum += 1
} while myNum <= 50

let breakPoint = 4
var countDown = 1
while breakPoint >= 0 {
    print("I will run!")
    
//  activating break point
    if countDown == breakPoint{
        print("I am tired now!")
        break
    }
    countDown += 1
}

for number in 1...10 {
    //skipping the even numbers
    if number%2 == 0{
        continue
    }
    
    print("This an odd number:\(number)")
}
