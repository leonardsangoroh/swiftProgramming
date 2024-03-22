import UIKit

print("Hello, world")

// Swift used variables to store and refere to values by an identifying name
// Swift has optional types, which handle the absence of a value

// Swift is a type-safe language, meaning;
// - the language ensures you're clear about the data type respective code can work with ( can't pass a string where an int is required)
// - you can't accidentally pass an optional String where a non-optional String is required


// Constants & Variables
// both must be assigned a value before the first time it is called
let yearOfManufacture = 1994
var mileage = 444999

// declare multiple variables or constants
var x = 0.0, y = 0.0, z = 0.0


// Type Annotations
// helps to be clear about the kind of values the constant or variable can store
var welcomeMessage: String
welcomeMessage = "Niaje"


// Printing Constants & Variables
print(welcomeMessage)

print("The car's year of manufacture is \(yearOfManufacture)")


// Comments
// include non-excexutable text in code

//This is a comment

/*
 This is
 a multiline
 comment
 */


// Semicolons
// used when writing multiple separate statements on a single line
let name = "Lee"; print(name)


// Integers
// whole numbers with no fractional component
// they can be signed or unsigned
// has same size as the current platform's native word size (32, 64)

let year: Int = 2024

// Unsigned Integer
// has same size as the current platform's native word size
let decemberMonth: UInt = 12

// Floating-Point Numbers
// numbers with a fractional component
// Double - 64 bit (15 decimal digits)
// Float - 32 bit  (6 decimal digits)


// Type Safety and Type Inference
// Swift is a type-safe language; meaning it encourages one to be clear about the types of values one's code can work with
// Type Inference enables a compiler to deduce the type of a particular expression automatically by examining provided values


// Numeric Literals
//Literal value - a value that appears directly in the source code e.g. 2024 on line 51
let decimalInteger = 17
let binaryInteger = 0b10001 //17 in binary
let octalInteger = 0o21 //17 in octal
let hexadecimalInteger = 0x11 // 17 in hex


// Numeric literals can contain extra formatting to make them easier to read.
// Can be padded with zeros and can contain underscores to help with readability
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


// Numeric type conversion
// to convert one specific number type to another, you intialize a new number of the desired type with the existing value.
// However UInt8 and UInt16 can't be added directly
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


// Integer and floating point conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// addition btw Int and Double is not allowed
//let total = three + pointOneFourOneFiveNine

// convert double to integer
// they are converted through truncation & not rounding off
let integerPi = Int(pi)


// Type Aliases
// they define an alternative name for an existing type.
typealias AudioSample = UInt16

var maxAmplitude: AudioSample = AudioSample.max
var amplitude: AudioSample = 12


// Booleans
// Boolean values are referred to as logical because they can only ever be true or false.
let orangesAreOrange = true
let turnipsAreDelicious = false

// prints Eww, turnips are horrible
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible")
}


// Tuples
// Tupes group multiple values into a single compound value
// The values can be of any type and don't have to be of the same type as each other
// http404Error is of type (Int, String)
let http404Error = (404, "Not Found")

// decompose tuple contents into separate constants or variables, which can then be accessed as usual
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// Alternatively access individual element values using index numbers
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// One can also name individual elements in a tuple when it's being defined
let http200Status = (statusCode: 200, description: "OK")
// hence can be accessed using element names
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


// Optionals
// used in situations where a value may be absent
// An optional represents 2 possibilities:
// - Either there is a value of a specified type, and you can unwrap the optional to access that value
// - Or there isn't a value at all

let possibleNumber = "123"
// the type of convertedNumber is 'Optional Int'
let convertedNumber = Int(possibleNumber)

// Because the initializer in the code might fail, it returns an optional Int, rather than Int


// nil
// one can set an optional variable to a valueless state by assigning it a special value nil
var serverResponse: Int? = 404
// serverResponse now contains an actual Int value of 404
serverResponse = nil
// has now been set to nil


// If one defines an optional value without providing a default value, the variable is automatically set to nil
var surveyAnswer: String?


// One can use an if statement to find out whether an optional contains a value by comparing the optional against nil
let possibleInteger = "123"
let convertedInteger = Int(possibleInteger)

if convertedNumber != nil {
    print("converted number contains an integer")
}


// Optional Binding
// used to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.
// Optional binding can be used with if, guard, and while statements to check for a value inside an optional, and to extract that value into a constant or variable
/*
if let <#constantName#> = <#someOptional#> {
   <#statements#>
}
*/


// it the optional Int returned bu Int(possibleNumber) contains a value, set a new constant called actualNumber to the value contained in the optional
if let actualNumber = Int(possibleInteger) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}


// if there's no need to refer to the original optional constant or variable after accessing the value it contains, one can use the same name for the new constant or variable
// inside the body of the if statement, writing covertedInteger refers to the new non-optional constant
// before or after the if statement, convertedInteger refers to the original optional integer constant
if let convertedInteger = convertedInteger {
    print ("The converted integer is \(convertedInteger)")
}

// shorter spelling to unwrap an optional value
// works on newer versions of Swift
//if let convertedNumber {
//    print(convertedNumber)
//}


// one can include as many optional bindings and Boolean conditions in a single if statement.
// if any ot the values in the optional bindings are nil or any Boolean conditions evaluates to false, the whole if statement's condition is considered to be false
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

// same as
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}


// Providing a fallback value
// can provide a default value using nil-coalescing operator(??)
let majina: String? = nil
let greeting = "Hello, " + (majina ?? "Friend") + "!"
print(greeting)


// Force Unwrapping
// when force unwrapping a non-nil value, the result is its unwrapped value
// force unwrapping a nil value triggers a runtime error
let pNumber = "123"
let cNumber = Int(pNumber)

// NB: The ! is a shorter spelling of fatalError(_:file:line:)
let number = cNumber!

// same as
guard let number = cNumber else {
    fatalError("The number was invalid")
}


// Implicitly unwrapped optionals
// they are usefule when an optional's value is confirmed to exist immediately after the optional is first defined and can be assumed to exist at every point thereafter
// primary use - during class initialization

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // Requires explicit unwrapping

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // Unwrapped automatically


// Error Handling
// one uses error handling to respond to error conditions the program may encounter during execution

func eatASandwich(){
    
}

func washDishes(){
    
}

func buyGroceries(){
    
}

enum SandwichError {
    case outOfCleanDishes
    case missingIngredients(ingridients: String)
}

// a function indicates it can throw an error by including the trhows keyword in its declaration
func makeASandwich() throws {
    //...
}

// when you call a function that can throw an error, you prepend the try keyword to the expression
// Swift automativally propagates errors out of their current scope until they are handled by a catch clause
// A do statement creates a new containing scope which allows errors to be propagated to one or more catch clauses
do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients){
    buyGroceries()
}


// Assertions & Preconditions
// these are checks that happen at runtime
// used to ensure an essential condition is satisfied before executing any further code.
// If the boolean condition in the assertion or precondition evaluates to true, code execution continues as usual. If the condition evaluates to false, the current state of the program is invalid; code execution ends, and the app is terminated
// Assertions find mistakes and incorrect assumptions during development
// Preconditions detect issues in production
// using them to enforce data and state causes the app to terminate more predictably if an invalid state occurs, and helps make the problem easier to debug


// Debugging with assertions
// one can write an assertion by calling assert(_:_:file:line:)
// pass an expression that evaluates to true or false and a message to display if the result of the condition is false
let age = -3
assert(age>3, "A person's age can't be less than zero")
// this assertion fails because -3 is not >= 0

// one can ommit the assertion message
assert(age>0)

// if the code already checks the condition, you use the assertionFailure(_:file:line:) function to indicate that an assertion has failed
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}


// Enforcing preconditions
// use a precondition whenever a condition has the potential to be false, but must definitely be true for your code to continue execution
// you write a precondition by calling the precondition(_:_:file:line:) function
let index = 1
precondition(index > 0, "Index must be greater than zero.")

// you can also call the preconditionFailure(_:file:line:) function to indicate that a failure has occurred
