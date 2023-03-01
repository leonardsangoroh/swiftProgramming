import UIKit

//structs let us create our own data types out of several small data types
struct Sport {
    //Stored property
    var name: String
    //Stored property
    var isOlympicSport: Bool
    //Computed property
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

//create and use Sport instance
//var tennis = Sport(name: "Tennis")

//print(tennis.name)

//changing variable contents
//tennis.name = "Lawn Tennis"
//print(tennis.name)

//Another instance
let chessBoxing = Sport(name:"ChessBoxing", isOlympicSport: false)

print(chessBoxing.olympicStatus)

//Property observers
struct Progress {
    var task: String
    var amount: Int {
        //For every change in amount property, this code will be run
        didSet {
            print("\(task) is now \(amount) complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//Structs can have functions
//functions inside structs are called methods
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

/* If a struct has a variable property but the instance of the struct
 was created as a constant, that property can't be changed - the struct is constant*/
let london = City(population: 235)
print(london.collectTaxes())

//Mutating methods - used to change properties of a struct
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Lee")
print(person.name)
person.makeAnonymous()
print(person.name)

//Properties and methods of strings
//STRINGS ARE STRUCTS!!!!! since they have their own methods and properties
let string = "Boys just wanna have fun"

//count number of cahracters
print(string.count)
//check if it begins with some letters
print(string.hasPrefix("Bo"))
//convert string to uppercase
print(string.uppercased())

//Properties and methods of arrays
//ARRAYS ARE STRUCTS!!!
var teams = ["Leicester"]

print(teams.count)

//Add a new item
teams.append("WestHam")

//Locate an item within an array
teams.firstIndex(of: "Westham")

//Sort items inside an array
print(teams.sorted())

//Remove item in an array
teams.remove(at: 1)
