//Closures part one

/* 
closures are functions that can be assigned to variables,
passed as parameters in other functions
*/

let driving = {
    print("I'm driving")
}

driving()

//Accepting parameters in a closure

let drivingAgain = { (place: String) in
    print("I'm going to \(place)")

}

driving("London")

//Returning values from a closure
let drivingOnceMore = { (place: String) -> String in
    return "I'm going to \(place)"

}

let message = driving("London")

print(message)

//Return a value without accepting any parameters
let payment = { () -> Bool in
    print("Paying is an anonymous person...")
    return true

}

//Closures as parameters
func travel(action: () -> void) {
    print("Getting ready")
    action()
    print("Arrived")
}

//Calling the driver function
travel(action: driving)

//Trailing closure syntax
//If the last parameter to a function is a closure, Swift lets you use special syntax
//called trailing closure syntax. Rather than pass your closure as a parameter, you pass
//it directly after the function inside braces

//Because the last parameter is a closure, we can call travel() using trailing closure syntax:
travel() {
    print("I'm driving in my car")
}
//In fact, since there aren't any other parameters, we can eliminate the parentheses entirely:
travel {
    print("I'm driving in my car")
}
