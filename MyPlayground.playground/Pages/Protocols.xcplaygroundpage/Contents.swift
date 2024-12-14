protocol USBMad{
    var id:Int{get}
    var supportsDisplayAdapter:Bool{get}
    var supportsAudio:Bool{get}
    func chargeAccessories()
    func transferData()
}

struct MyLaptop: USBMad{
    //struct's own properties
    var name:String
    var architecture:String
    
    //adopted/conformed variables and methods
    var id: Int
    var supportsDisplayAdapter: Bool
    var supportsAudio: Bool
    
    //adopted and to be implemented methods
    func chargeAccessories() {
        //MyLaptop's implementation of adopted method
        print("I am able to charge the accessories!")
    }
    func transferData() {
        //MyLaptop's implementation of adopted method
        print("You can send/receive data to/from me!")
    }
    
    //MyLaptop's own method...
    func describe(){
        print(
                """
                My name is \(name).
                I use \(architecture) architecture.
                I have a USBMad interface with id: \(id).
                """
        )
        self.chargeAccessories()
        self.transferData()
    }
}

let myLaptop = MyLaptop(
    name: "Sameer's Macbook",
    architecture: "ARM64",
    id: 1,
    supportsDisplayAdapter: true,
    supportsAudio: true
)

myLaptop.chargeAccessories()
//prints: I am able to charge the accessories!

myLaptop.transferData()
//prints: You can send/receive data to/from me!


//protocol for payment...
protocol Payment{
    func biweeklyPayment() -> Double
}

//protocol for TA training...
protocol TATraining{
    func completeTraining()
}

//protocol for TA rating...
protocol RatedByProfessor{
    func rate() -> Int
}

// Some code//consolidating to a single protocol...
protocol TeachingAssistant: Payment, TATraining, RatedByProfessor{
    //properties and methods for TeachingAssistant protocol...
}
