//Functions

func printHelp() {
    let message = """
    Welcome to this application!

    Run it inside a dir of images and
    it will resize them into thumbnails
    """

    print(message)
}

printHelp()

//Why use functions
/* 
- When using a functionality in many places
- When breaking up code into small digestable ones
- In swift, one can combine small functions into one big one
*/

//Accepting parameters
func square (num: Int) {
    print(num*num)
}

square(num: 8)

//Returning values
func squareReturn (num: Int) -> Int {
    return num*num
}

let result = squareReturn(num: 8)
print(result)

//What's the difference btw a statement and an expression

//Return 2 > values from a function
// We can use a tuple or a collection e.g. array or dictionary

//With array
func getUserArray() -> [String] {
    ["Taylor", "Swift"]
}

let userOne = getUserArray()
print(user[0])

//with dictionary
func getUserDic() -> [String: String] {
    ["first": "Lee", "last": "Swift"]
}

let userTwo = getUserDic()
print(userTwo["first"])

//with tuple
func getUserTup() -> (first: String, last: String) {
    (first: "Lee", last: "Leonard")
}

let userThree = getUserTup()
print(userThree.first)

/* 

- Our data must be returned first name first and last name second.
- If we insert a middle name it will not affect the position of other values.
- We can’t make case-sensitive mistakes while reading values.
- There's no way we won’t get back a first name or last name – if someone only uses one name then we’ll get back an empty string.
- There is no optionality.

*/

//Parameter labels
/*
Swift lets us give a parameter 2 names, one for internal use and the other for external use
     external (to) then internal (name)
*/
func sayHello (to name: "String") {
    print("Hello, \(name)!")
}

let jina = sayHello( to: "Leonard")

//Omitting parameter labels
//Omitting enables to pass aguments without stating their parameter name
func greet ( _ person: String) {
    print("Hello, \(person)! ")
}

greet("Lee")

//Default parameters
/*
print() function has a default parameter that creates a linebreak
when the print() function is called.
We can also set defualt values to our parameters
*/

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello \(person)")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

/* 
Because we already set a default, on the 'nicely' parameter,
we can call the function in 2 ways
*/
greet("Lee")
// or
greet("leonard", nicely: false)

/*
An example where default parameters can be used is when 
writing a function to find the shortest rout btw 2 points
Parameters are; to, from, route, avaidHighways
One can set route to 'fastest' and avaidHighways to false 
*/

//Variadic functions
/*
These are functions that recieve any numbers
number of input of the same data type
An example is the print() function
*/
print("Lee", "Leonard", "Sangoroh")

/*
Parameters are made variadic by writing ...
after its type
*/

func squareVariadic(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number*number)")
    }
}

//calling it 
squareVariadic(numbers: 1, 2, 3, 4, 5)

//Variadic functions can be used when the input length is indefinite

//Writing throwing functions

//Helps in throwing errors

/*
We first need to define an enum that describes the errors
we can throw. The enum is based on Swift existing Error type
*/
enum PasswordError: Error {
    case obvious
}

/*
checkPassword() function that throws error if something 
goes wrong
*/
func checkPassword(_ Password: String) throws -> Bool {
    if Password == "password" {
        throw PasswordError.obvious
    }

    return true
}

//Running throwing functions

do {
    try checkPassword("password")
    print("The password is good")
} catch {
    print("You can't use that password")
}

// inout parameters
/*
All parameters passed into a Swift function are constants
However, you can pass 1 or more parameters as inout, meaning
they can be changed inside the function and those changes can
reflect in the original value outside the function
*/

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)