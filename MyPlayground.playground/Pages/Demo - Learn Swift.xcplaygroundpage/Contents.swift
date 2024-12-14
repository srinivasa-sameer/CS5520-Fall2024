import UIKit

var greeting = "Hello, playground"
greeting = "Hello Sameer"

var count = 123
count = 100_000

var multiline = """
Hello I am a multiline string.
I am weird.
But I am useful when writing long paragraphs.
"""

print(multiline)

var myNum: Float = 12
print(myNum)
print(type(of: myNum))


//var myString = """
//This is my int \(count).
//This is my float \(myNum).
//This is my multiline \(multiline).
//"""
print("This is my int \(count).\nThis is my float \(myNum).\nThis is my multiline:\n\(multiline).")

let myConstant = 20
print("My constant is \(myConstant)")

let myName: String = "Srinivasa Sameer Addepalli"
var myAge: Int = 24
let iUseIPhone: Bool = true

print("My Details - Name: \(myName), Age - \(myAge), Do I use an iPhone - \(iUseIPhone)")
