class Vehicle{
    var type:String
    
    //mandatory init() method
    init(type:String){
        self.type = type
    }
    
    //method describing a Vehicle...
    func describe(){
        print("This is a \(type).")
    }
    
}

var veh1 = Vehicle(type: "Car")
var veh2 = Vehicle(type: "Truck")
var veh3 = Vehicle(type: "Minivan")

veh1.describe()


// defining a new class inheriting Vehicle class
class Car:Vehicle{
    var make:String
    var model:String
    
    init(type:String, make:String, model:String) {
        //initializing this instance's properties...
        self.make = make
        self.model = model
        
        //Calling super class's initializer...
        super.init(type: type)
    }
    
    //overriding super.describe()...
    override func describe() {
        print(
                """
                This is a \(type).
                It is a \(make) \(model).
                """
        )
    }
}

//creating an instance of Car...
var car = Car(type: "Car", make: "Toyota", model: "Rav4")

car.describe() //prints: This is a Car.
