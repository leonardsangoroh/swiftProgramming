import UIKit

//Initializers are special methods that provide different ways to create your struct

struct User {
    var username: String
}
//memberwise initializer
var user = User(username: "Lee")

//creating our own initializer
struct Person {
    var username: String
    
    //all properties must have values b4 the initializer ends
    //CAN'T WRITE A FUNCTION BEFORE AN INITIALIZER
    init(){
        username = "Anonymous"
        print("Creating a new user")
    }
}

var Lee = Person()
Lee.username = "Leonard Sangoroh"
print(Lee.username)

//Referring to current instance
struct Mtu {
    var name: String
    
    init(name:String){
        print("Creating a new person \(name)")
        self.name = name
    }
}

var Leonard = Mtu(name:"Leonard")

//Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree")
    }
}

//using FamilyTree struct as a property inside the Persons struct
struct Persons {
    var name: String
    //Lazy variable means the property is only called when needed
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var Ted = Persons(name:"Ted")
print(Ted.name)

Ted.familyTree

//Static properties and methods
//Specific properties and methods of a struct can be used across all instances
//of the struct by declaring them as static
struct Student {
    var name:String
    static var classSize = 0
    
    init(name:String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

//Since classSize property belongs to the struct itself and not the instances of
//the struct, it is read using Student.classSize
print(Student.classSize)

//Access Control
// AC let's one restrict which code can use properties and methods
struct Personss {
    //private variables can't be read outside the struct
    private var id: String
    
    init(id:String) {
        self.id = id
    }
    
    func identify() -> String {
        return "Social Security Number: \(id)"
    }
}
