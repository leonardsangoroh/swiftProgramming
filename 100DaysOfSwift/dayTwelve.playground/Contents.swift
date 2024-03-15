import UIKit

//Optionals
//Optionals - Swift's solution to null references
// Optionals are used to handle missing data

//Making a type optional
var age: Int? = nil
//age holds nothing but can hold data afterwards
age = 21

//Unwrapping optionals
var jina: String? = nil

//using if...let to unwrap optionals
// if jina holds a string, it will be placed in unwrapped as a regular string and its count can be read
if let unwrapped = jina {
    //Run if jina has a value inside
    print("\(unwrapped.count) letters")
} else {
    print("Missing name")
}

//Unwrapping with guard
// An alternative for if...let
func greet(_ name: String?) {
    
    guard let unwrapped = jina else {
        //Runs if jina does not have a value inside
        print("Name not provided")
        return
    }
    
    print("Hello \(unwrapped)")
}

//Force unwrapping
// Used only when you're sure that an optional is not empty
let str = "8"
//This converts it to an optional int
let num = Int(str)
//This converts it to an integer forcefully
let numTwo = Int(str)!

//Implicitely unwrapped optionals
//For implicitely unwrapped optionals, you don't need to unwrap them. Use them as is
//They behave as if they were already unwrapped
let miaka: Int! = nil

//Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Leonard Sangoroh"
    } else {
        return nil
    }
}

let user = username(for: 12) ?? "Anonymous"

//Optional Chaining
let teams = ["Real Madrid", "Barcelona", "Valencia"]
//Swift checks whether first has a value, ir nil, the rest of the line will be ignored
//Swift will return nil immediately. If it has a value, it will be unwrapped the execution will continue
let outcome = teams.first?.uppercased()

//Optional try

//Failable initializers

//Typecasting
