var arrayOfInt:[Int] = [1,56,89,23,4,6]

print(arrayOfInt.sorted())

// prints: [1, 4, 6, 23, 56, 89]

//array of Strings ...

var arrayOfStrings = ["apple", "orange", "pineapple", "a", "b"]

print(arrayOfStrings.sorted())

//prints: ["a", "apple", "b", "orange", "pineapple"]


//function to compare two values to find which if value1 is greater than value2...
func decreasing(value1:Int, value2:Int)->Bool{
    return value1 > value2
}

//sort the array by using the comparator function decreasing...
arrayOfInt.sort(by: decreasing)

print(arrayOfInt)
//prints: [89, 56, 23, 6, 4, 1]

var arrayNew = [34,6,89,56,78,14]
arrayNew.sort(by: { (value1:Int, value2:Int) -> Bool in
    return value1 > value2
})

print(arrayNew)
//prints: [89, 78, 56, 34, 14, 6]


struct User{
    var name: String
    var age: Int
    var city: String
}

var users = [
    User(name: "Alice", age: 12, city: "Boston"),
    User(name: "Bob", age: 21, city: "Charlotte"),
    User(name: "Chris", age: 45, city: "NYC"),
    User(name: "David", age: 23, city: "Boston"),
    User(name: "Dillon", age: 89, city: "San Francisco"),
]

//MARK: sort by name in decreasing order
users.sort(by: { (user1:User, user2:User)-> Bool in
    return user1.name > user2.name
})

for user in users{
    print(user)
}
/*prints:
User(name: "Dillon", age: 89, city: "San Francisco")
User(name: "David", age: 23, city: "Boston")
User(name: "Chris", age: 45, city: "NYC")
User(name: "Bob", age: 21, city: "Charlotte")
User(name: "Alice", age: 12, city: "Boston")
 */

//MARK: sort by age in increasing order
users.sort(by: { (user1:User, user2:User)-> Bool in
    return user1.age < user2.age
})

for user in users{
    print(user)
}
/* prints:
User(name: "Alice", age: 12, city: "Boston")
User(name: "Bob", age: 21, city: "Charlotte")
User(name: "David", age: 23, city: "Boston")
User(name: "Chris", age: 45, city: "NYC")
User(name: "Dillon", age: 89, city: "San Francisco")
*/
