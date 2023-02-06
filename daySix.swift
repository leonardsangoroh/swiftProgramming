//Closures part one

/* 
closures are functions that can be assigned to vairables,
passed as parameters in other functions
*/

let driving = {
    print("I'm driving")
}

driving()

//Accepting parameters in a closure

let drivingAgain { (place: String) in
    print("I'm going to \(place)")

}

driving("London")

//Returning values from a closure
let drivingOnceMore { (place: String) -> String in
    return "I'm going to \(place)"

}

let message = driving("London")

print(message)

//Return a value without accepting any parameters
let paymet = { () -> Bool in
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
