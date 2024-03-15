import UIKit

//functions and closures

//function
func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

print(add(num1:22,num2:33))

//closure
let addClosure = { (num1: Int, num2: Int) -> Int in
    return num1 + num2
}

print(addClosure(22,33))

//rewriting closures
let addClosureTwo: (Int, Int)-> Int = { (num1, num2) in
        return num1 + num2
}

//rewriting closures
let addClosureThree: (Int, Int)-> Int = {
        return $0 + $1
}

// Closures can also be put in an array, provided they are of same data type

let functions = [
addClosure,
addClosureTwo,
addClosureThree
]

let addFunc = functions[0]
print(addFunc(22,33))

//closure as a parameter to a function
func addClosureParameter(num1: Int, num2: Int, result: (Int, Int)->Void) {
    let add = num1 + num2
    let sub = num2 - num1
    result(add, sub)
}

addClosureParameter(num1: 22, num2: 33) { (add, sub) in
    print("Addition: \(add)")
    print("Subtraction: \(sub)")
}

//Trailing closures
addClosureParameter(num1: 22, num2: 33) { (add, sub) in
    print("Addition: \(add)")
    print("Subtraction: \(sub)")
}

/*function that accepts a closure as a parameter
 and the closure accepts a string
 */

func travel(action: (String)-> Void) {
    print("Getting ready")
    action("Lee")
    print("Done")
}

//Using the trailing closure syntax
travel{ (place: String) in
    print("I'm going to \(place) in my car")
}

/* A function that passes closure as a parameter
 The closure also has a parameter and returns a value*/

