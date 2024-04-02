import UIKit

// Functions
/*
 functions are self-contained chunks of code that perform a specific task.
 every function in Swift has a type, consisting of the function's parameter types and return type
 one can use this type like any other type in Swift, which makes it easy to pass functions as parameters to other functions, and to return functions from functions
 functions can also be written within other functions to encapsulate useful functionality within a nested function scope
 */


// Defining and Calling Functions
/*
 parameter - a named, typed value that a function takes as input
 return type - type of value a function will pass back as output
 */

// input paramter - person, return type - String
func greet(person:String) -> String {
    let greeting = "Hello " + person + "!"
    return greeting
 }

// call function
greet(person: "Leonard")


// Function Parameters and Return Values

// functions without parameters
/*
 functions are not required to define input paramters
 */
func sayHelloWorld() -> String{
    return "Hello World"
}
print(sayHelloWorld())


// Functions With Multiple Parameters
/*
 functions can have multiple parameters, written withing the function's parentheses, separated by commas
 */
func greetAgain(person: String) -> String{
    return "Hello once again \(person)!"
}
func salimu(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(salimu(person: "Leonard", alreadyGreeted: true))


// Functions Without Return Values
/*
 functions aren't required to define a return type
 strictly speaking, the function below still returns a value,
 even though no return value is defined.
 functions without a defined return type return a special value of type Void
 this is simply an empty typle, which is written as ()
 */
func greetWithoutReturn(person: String){
    print("Hello \(person)!")
}

/*
 return value(s) of a function van be ignored, but a function that says it will return a value must always do so
 a function with a defined return type can't allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error
 */
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but doesn't return a value


// Functions with Multiple Return Values
/*
 use a tuple type as the return type for a function to return multiple values as part of one compound return value
 the function below defines a function which finds the smallest and largest numbers in an array of Int values
 */
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[1]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}
/*
 since the tuple's member values are named as part of the function's return type, they can be accessed using dot syntax to retrieve the minimum and maximum found values
 */
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"


// Optional Tuple Return Types
/*
 If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.
 The minMax(array:) function above returns a tuple containing two Int values. However, the function doesn’t perform any safety checks on the array it’s passed. If the array argument contains an empty array, the minMax(array:) function, as defined above, will trigger a runtime error when attempting to access array[0].

 To handle an empty array safely, write the minMax(array:) function with an optional tuple return type and return a value of nil when the array is empty
 */
func minMaxOptional(array: [Int])->(min: Int, max: Int)?{
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[1]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

// one can check whether the returned type is nil using optional binding
if let bounds = minMaxOptional(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}


// Functions With an Implicit Return
/*
 if the entire body of the function is a single expression, the function implicitly returns that expression
 any function written in just one line can have the 'return' ommited
 both of the functions below have the same behaviour
 */
func firstGreeting(for person: String)->String{
    "Hello, " + person + "!"
}

func secondGreeting(for person: String)->String {
    return "Hello, " + person + "!"
}
 // both return "Hello Leonard" when called and argument "Leonard is passed"

/*
 NB: the code one writes as an implicit return value needs to return some value. e.g. once can't use print(13) as an implicit returns value.
 however, one can use a function that never returns like fatalError("Oh no!") as an implicit return value, because Swift knows that the implicit return does not happen
 */


// Function Argument Labels and Parameter Names
/*
 each function parameter has both an argument label and a parameter name.
 the argument label is used when calling the function; each argument is written in the function call with its argument label before it
 the parameter name is used in the implementation of the function.
 by default, parameters use their parameter name as their argument label
 
 all parameters must have unique names
 although it is possible for multiple parameters to have the same argument label, unique argument labels help make your code more readable
 */


// Specifying argument labels
/*
 you can write an argument label before the parameter name, separated by space
 the use of argument labels allows function(s) to be called in an expressive, sentence-like manner, while still providing a function body that's readable and clear in intent
 */
func someFunction (argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}


// Omitting Argument Labels
/*
 if one does not want an argument label for a parameter, one can write an underscore(_) instead of an explicit argument label for that parameter
 if a parameter has an argument label, the argument must be labeled when you call the function
 */
func someFunctionWithNoArgument(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunctionWithNoArgument(1, secondParameterName: 2)


// Default Parameter Values
/*
 one can define a default value for any parameter in a function by assigning a value to the parameter after that parameter's type
 if a default value is defined, you can omit that arameter when calling the function
 place parameters that don’t have default values at the beginning of a function’s parameter list, before the parameters that have default values. Parameters that don’t have default values are usually more important to the function’s meaning — writing them first makes it easier to recognize that the same function is being called, regardless of whether any default parameters are omitted.


 */
func someFunctionWithOneDefaultParameter(parameterWithoutDefault: Int, parameterWithDefault: Int = 12){
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}


// Variadic Parameters (...)
/*
 a variadic parameter accepts zero or more values of a specific type
 they can be used to specify that a parameter can be passed a varying number of input values when the function is called
 
 the values passed to a variadic parameter are made available withing the function's body as an array of the appropriate type
 
 a function can have multiple variadic parameters
 the first parameter that comes after a variadic parameter must have an argument label
 this makes it unambiguous which arguments are passed to the variadic parameter and which arguments are passed to the parameters that come after the variadic parameter
 */
func arithmeticMean(_ numbers: Double...)->Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers


// In-Out Parameters
/*
 function parameters are constants by default, hence trying to change it within the body results in a compile-time error
 if one wants a function to modify a parameter's value, and one wants those changes to persist after the function call has ended, define that parameter as an in-out parameter
 an in-out parameter has a value passed in to the function, is modified by the function, and is passed back out of the function to replace the original value
 one can only pass a variable as the argument for an in-out parameter. You can't pass a constant or a literal value as an argument since constants and literals can't be modified
 in-out parameters can't have default values, and variadic parameters can't be marked as in-out
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"


// Function Types
/*
 every function has a specific function type, made up of the parameter types and the return type of the function
 the type of the function below is (Int, Int) -> Int, which can be read as;
 a function has two parameters, both integers, and that returns a value of type integer
 */
func addTwoInts(_ a: Int, _ b: Int)->Int {
    return a + b
}

/*
 the function below has a function type () -> Void
 */
func printHelloWorld() {
    print("Hello World!")
}


// Using Function Types
/*
 one can use function types just like any other types in Swift
 e.g. one can define a constant or variable to be of a function type and assign an appropriate function to that variable
 the assignment below can be read as "define a variable known as mathFunction, which has a type of 'a function that takes two Int values, and returns an Int value.'
 set this new variable to refer to the function called addTwoInts
 */
var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(4,6))")

// a different variable with the same matching type can be assigned to the same variable, in the same way as for non-function types

// as with any other type, one can leave it to Swift to infer the function type when one assigns a function to a constant or variable
let mathFunctionInferred = addTwoInts


// Function Types as Parameter types
/*
 one can use a function type such as (Int, Int) -> Int as a parameter type for another function
 this enables once to leave some aspects of a function's implementation for the function's caller to provide when the function is called
 in short, some functionality can be left for another function (passed in as a parameter) to perform
 */

// an example to print the results of the math functions from above
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 5, 9)
// prints 14


// Function Types as Return Types
/*
 one can use a function type as a return type of another function by writing a complete function type immediately after the return arrow (->) of the returning function
 */
// normal functions to be returned
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

/*
 Here’s a function called chooseStepFunction(backward:), whose return type is (Int) -> Int. The chooseStepFunction(backward:) function returns the stepForward(_:) function or the stepBackward(_:) function based on a Boolean parameter called backward:
 */
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

// now that moveNearerToZero refers to the correct function, it can be used to count to zero
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// Nested Functions
/*
 simply, functions inside functions
 
 nested functions are hidden from the outside world by default, but can still be called by their enclosing function
 an enclosing function can also return one of its nested functions to allow the nested function to be used in another scope
 */

// rewriting the chooseStepFunction(backward:)
func chooseStepFunctionNested(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValueNested = -4
let moveNearerToZeroNested = chooseStepFunctionNested(backward: currentValueNested > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValueNested != 0 {
    print("\(currentValueNested)... ")
    currentValueNested = moveNearerToZeroNested(currentValueNested)
}
print("zero!")
