import UIKit

//Classes
/*Difference btw structs & classes
1.Structs have memberwise initializers, classes don't (if you have properties in a class, you must create an initializer
2.You can inherit among classes, with structs, you can't
3.When copying a struct, both the original and copy are different things. When copying a class, the original & copy point to the same thing
4.Clases have deinitializers (code that runs when an instance of a class is destroyed)
5.With a constant struct and a variable property, the property can't be changed since the struct is constant. With classes, with a constant class and variable property, you can change the property. Hence classes don't need mutating keyword with methods that change properties
 */
class Dog {
    var name: String
    var breed: String
    
    init(name:String, breed:String) {
        self.name = name
        self.breed = breed
    }
    
    //method overriding
    func makeNoise() {
        print("Woof!")
    }
}

let mutina = Dog(name: "Mutina", breed: "Street dog")

print(mutina.breed)

//Class Inheritence
class Mutina: Dog {
    init (name:String) {
        super.init(name: name, breed: "Mutina")
    }
    
    //method overriding
    override func makeNoise() {
        print("Overriden voice!")
    }
}

//Overriding methods
let bosco = Mutina(name: "bosco")
bosco.makeNoise()

//Final classes
// Final classes can't be inherited from
final class Career {
    var occupation: String
    var institution: String
    
    init(occupation:String, institution:String) {
        self.occupation = occupation
        self.institution = institution
    }
}

//Copying objects
class Singer {
    var name = "Kendrick Lamar"
}
//Prints Kendrick Lamar
let kendrick = Singer()
print(kendrick.name)

var kendrickCopy = kendrick
kendrickCopy.name = "2 Pac"
//Prints "2 Pac" since kendrick and kendrickCopy point to the smae object in memory
print(kendrick.name)

//If it were a struct, "kendrick Lamar" would be printed the second time
struct SSinger {
    var name = "Taylor Swift"
}

//Deinitializers
class Person {
    var name = "Leonard Sangoroh"
    
    init(){
        print("\(name) is alive")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

//Mutability - read difference no. 5 at the top
class Footballer {
    var name = "Victor Wanyama"
}

let wanyama = Footballer()
wanyama.name = "Ogada Olunga"
