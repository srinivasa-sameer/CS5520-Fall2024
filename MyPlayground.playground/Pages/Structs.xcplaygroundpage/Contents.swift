struct Person{
    var name:String
    var age:Int
    var city:String
    
    //    initializer method...
    init() {
        name = "Unknown"
        age = 18
        city = "Not Given"
    }
    
    //    computed property .....
    var isMinor:Bool{
        if age < 18{
            return true
        }else{
            return false
        }
    }
    //    method printProfile...
    
    func printProfile(){
        print(
            """
            Hi! I am \(name).
            I am \(age) years old.
            And I live in \(city)!
            Happy coding!
            """
        )
    }
}

//Creating an instance using the init()
var newPerson = Person()

//modifying the properties of newPerson...
newPerson.name = "Bob Smith"
newPerson.age = 36
newPerson.city = "Boston"

//print the variable person of type Person...
print(newPerson)
//print newPerson's name...
print(newPerson.name)

//modifying the inner variables of newPerson
newPerson.age = 36
//printing newPerson after changing the age...
print(newPerson)


if(newPerson.isMinor){
    print("\(newPerson.name) is a minor!")
}else{
    print("\(newPerson.name) is an adult!")
}

newPerson.printProfile()


var randomPerson = Person()
print(randomPerson)


struct Car{
    var make:String
    var model:String
    var year:Int?
    
    init(){
        make = "Not set"
        model = "Not set"
        year = 0
    }
    
    //custom init...
    init(make:String, model:String) {
        self.make = make
        self.model = model
    }
}

//creating an instance of Car...
var car = Car()

//printing the instance...
print(car)


//creating an instance of Car using the custom init()...
var car2 = Car(make: "Toyota", model: "Corolla")
print(car2)

//creating an instance of Car...
var car3 = Car(make: "Honda", model: "Civic")
print(car3)
//prints: Car(make: "Honda", model: "Civic", year: nil)

//Assigning a value of year after we create the instance
car3.year = 2022
print(car3)
//prints: Car(make: "Honda", model: "Civic", year: Optional(2022))

