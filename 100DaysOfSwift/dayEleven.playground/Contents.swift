import UIKit

//Protocol & protocol oriented programming
//Protocols are a way of describing what properties and methods something must have
protocol Identifiable {
    var id: String {get set}
}
//creating a struct that conforms to the protocol
struct User: Identifiable {
    var id: String
}
// a function that accepts any Identifiable object
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

//Protocol Iinheritence
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}
//protocols allows one to inherit from more than one protocol
protocol Employee: Payable, NeedsTraining, HasVacation {
    
}

//Extension
//Extensions enable us to add methods to existing types
extension Int {
    func squared()-> Int {
        return self * self
    }
}

let number = 8
number.squared()

//Swift doesn’t let you add stored properties in extensions, so you must use computed properties instead.
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

//Protocol extensions
// Swift's arrays and sets both conform to a protocol called 'Collection', we can write an extesntion to add a summarize() method to print the collection neatly
extension Collection {
    func Summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

//Both arrays and sets have this function added to them

//PROTOCOL-ORIENTED PROGRAMMING
protocol Discoverable {
    var id: String {get set}
    func identifiable ()
}

//Protocol extensions helps us make a default identify() function
extension Discoverable {
    func identifiable() {
        print("My ID is \(id).")
    }
}

//When we create a type that conforms to Identifiable, it gets identify() automatically
struct Users: Discoverable {
    var id: String
}

let lee = Users(id:"Lee")
lee.identifiable()

/*
1.Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
2.You can build protocols on top of other protocols, similar to classes.
3.Extensions let you add methods and computed properties to specific types such as Int.
4.Protocol extensions let you add methods and computed properties to protocols.
5.Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
*/
