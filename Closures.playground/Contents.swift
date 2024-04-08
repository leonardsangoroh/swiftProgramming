import UIKit

// Closures
/*
 group code that executes together, without creating a named function
 
 closures can capture and store references to any constants and variables from the context in which they are defined
 
 global and nested functions are actually special cases of closures.
 closures can take one of three forms;
 - global functions are closures that have a name and don't capture any values
 - nested functions are closures that have a name and can capture values from their enclosing function
 - closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding text
 
 */



// Nested Function Example
/*
 counter variable is declared withing outerFunction(), meaning it is a local variable of outerFunction()
 each time it is called, a new instance 'counter' is initialized to zero
 however, because the innerFunction captures and retains a reference to the 'counter' variable, it keeps track of its state across multiple invocations of outerFunction
 */
func outerFunction() -> () -> Int {
    var counter = 0

    func innerFunction() -> Int {
        counter += 1
        return counter
    }

    return innerFunction
}

let myFunction = outerFunction()
print(myFunction())  // Output: 1
print(myFunction())  // Output: 2


// Closure Expressions
/*
 closure expressions are a way to write inline closures in a brief, focused syntax
 closure expressions provide several syntax optimizations for writing clousres in a shortened form without loss of clarity or intent
 
 the closure expresion examples below illostrate these optmizations by refining a single example of the sorted(by:) method over several iterations, each of which espresses the same functionality in a more succinct way
 */

/*
 Swift's standard library provides a method called sorted(by:), which sorts an array of values based on the output of a sorting closure that you provide
 once the process is complete, sorted(by:) returns a new array of the same type and size as the old one, with its elements in the correct sorted order
 the original array is not modified by sorted(by:)
 
 the sorted(by:) method accepts a closure that takes two arguments of the same type as the array's contents, and returns a Bool value to say whether the first value should appear before or after the second value once the values are sorted
 it needs to return true if the first value should appear before the second value, and false otherwise
 
 for sorting an array of String values, the sorting closure needs to be a function of type (String, String) -> Bool
 */

let names = ["Lee", "Leonard", "Sangoroh", "Rachael", "Joan", "Allan"]

// METHOD 1: WRITE FUNCTION OF THE CORRECT TYPE, AND PASS IT AS AN ARGUMENT TO THE SORTED(BY:)
func backward(_ sOne: String, _ sTwo: String) -> Bool {
    return sOne > sTwo
}

var reversedNameUsingFunction = names.sorted(by: backward(_:_:))


// Closure Expression Syntax
/*
 paramters in closure expression syntax can be in-out paramters, but they can't have a default value
 variadic paramters can be used if you name the variadic parameter
 tuples can also be used as parameter types and return types
 */
var reversedNamesClosures = names.sorted(by: { (sOne: String, sTwo: String) -> Bool in
    return sOne > sTwo
})


// Inferring Type From Context
/*
 since the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns
 
 */
reversedNamesClosures = names.sorted(by: { sOne, sTwo in return sOne > sTwo})

/*
 it is always possible to infer the parameter types and return type when passing a closure to a function or method as an inline closure expression
 as a result, one never needs to write an inline closure in its fulest form when the closure is used as a function or method argument
 */


// Implicit Returns from Single-Expression Closures
/*
 single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration
 */
reversedNamesClosures = names.sorted(by: { sOne, sTwo in sOne > sTwo })


// Shorthand Argument Names
/*
 Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure's arguments by the names $0, $1, $2, and so on
 
 if you use the shorthand argument names within your closure expression, one can omit the closure's argument list from its definition
 the type of the shorthand argument names is inferred from the expected function type, and the highest numbered shorthand used determines the number of arguments that the closure takes
 
 the 'in' keyword can also be omitted, since the closure expression is made up entirely of its body
 */

/*
 here, $0 and $1 refer to the closure's first and second String arguments
 because $1 is the shorthand argument with the highest number, the closure is understood to take two arguments
 because sorted(by:) function expects a closure whose arguments are both strings, the shorthand arguments $0 and $1 are both of type String
 */
reversedNamesClosures = names.sorted(by: { $0 > $1})


// Operator Methods
/*
 there’s actually an even shorter way to write the closure expression above.
 Swift’s String type defines its string-specific implementation of the greater-than operator (>) as a method that has two parameters of type String, and returns a value of type Bool
 this exactly matches the method type needed by the sorted(by:) method
 therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation:
 */
reversedNamesClosures = names.sorted(by: >)


// Trailing Closures
/*
 if one needs to pass a closure expression to a function as the function's final argument and the closure expression is long, it is good to write it as a trailing closure instead
 
 once writes a trailing closure after the function call's parentheses, even though the trailing closure is still an argument to the function
 
 when using trailing closure syntax, once does not write the argument label for the first closure as part of the function call.
 
 a function call can include multiple trailing closures
 */
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}


// Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})


// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

// the string-sorting closure can be written outside of the sorted(by:) method's parentheses as a trailing closure
reversedNamesClosures = names.sorted() { $0 > $1 }

/* if a closure expression is provided as a function's only argument and one
 provides the expression as a trailing closre, one does not need to write a pair
 of parentheses
*/
reversedNamesClosures = names.sorted { $0 > $1 }

/*
 trailing closures are most useful when the closure is sufficiently long that it is not possible to write it inline on a single line
 e.g. Swift's array map(_:) method
 
 the call to digitNames dictionary's subscript is followed by an exclamation point, because dictionary subscripts return an optional value to indicate that the dictionary subscripts return an optional value to indicate that the dictionary lookup can fail if the key does not exist
 */
let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six",
    7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

/*
 if a function takes multiple closures, one omits the argument label for the first trailing closure and you label the remaining trailing closures
 the function below loads a picture for a photo gallery
 */
//func loadPicture(from server: Server, completion: (Picture)->Void, onFailure: () -> Void) {
//    if let picture = download("photo.jpg", from: server) {
//        completion(picture)
//    } else {
//        onFailure
//    }
//}
//

/*
 in the example below, the loadPicture() function dispatches its network task into
 the background and calls one of the two completion handlers when the netwwork task
 is finishes
 writing the function this way lets one cleanly separate the code that's responsible for handling a network failure from the code that updates the user interface after a successful download
 instead of using just one closure that handles both circumstance
 */
//loadPicture(from: someServer) {
//    someView.currentPicture = picture
//} onFailure: {
//    print("Couldn't download the next picture")
//}


// Capturing Values
/*
 a closure can capture constants and variable from the surrounding context in which it is defined
 the closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no longer exists
 
 in Swift, the simplest form of a closure that can capture values is a nested function, written within the body of another function
 
 a nested function can capture any of its outer function's arguments and can also capture any constants and variables defined within the outer function
 
 the incrementer() function does not have any parameters, and yet it refers to runningTotal and amount from within its function body
 it does this by capturing a reference to runningTotal and amount from the surrounding function and using them within its own function body
 
 capturing by reference ensures that runningTotal and amount don't disappear when the call to makeIncrementer ends, and also ensures that runningTotal is available the next time the incrementer function is called
 */
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

// function call
/*
 this example sets a constant called incrementByTen to refer to an incrementer function that adds 10 to its runningTotal variable each time it is called
 calling the function multiple times shows this behaviour in action
 */
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen() // 10
incrementByTen() // 20

// creating a second incrementor will make it have its own stored reference to a new, separate runningTotal variable
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven() // 7

/*
 if you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance
 Swift uses capture lists to break these strong reference cycles
 */


// Closures Are Reference Types
/*
 in the example above, incrementBySeven and incrementByTen are constants, but the closures these constants refer to are still able to increment the runningTotal variables that they have captured
 this is because functions and closures are reference types

 whenever you assign a function or a closure to a constant or a variable, you are actually setting that constant or variable to be a reference to the function or closure
 in the example above, it’s the choice of closure that incrementByTen refers to that’s constant, and not the contents of the closure itself

 this also means that if you assign a closure to two different constants or variables, both of those constants or variables refer to the same closure
 
 the example above shows that calling alsoIncrementByTen is the same as calling incrementByTen
 because both of them refer to the same closure, they both increment and return the same running total
 */
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen() // returns a value of 50

incrementByTen() // returns a value of 60


// Escaping Closures
/*
 a closure said to escape a function is passed as an argument to the function but is called after the function returns
 
 when aone declares a function that takes a closure as one of its parameters, one can write @escaping before the parameter's type to indicate the closure is allowed to escape
 
 the someFunctionWithEscapingClosure(_:) function takes a closure as its argument and adds it to an array that's declared outside the function
 if you did not mark the parameter of the function below as @escaping, you would get a compile-time error
 
 in Swift, by default, closures passed as arguments to functions are considered non-escaping, meaning they are expected to be executed within the lifetime of the function call. This default behavior ensures memory safety because the closure is guaranteed to finish execution before the function returns.

 however, in cases where you want to store a closure for later execution, such as adding it to an array or assigning it to a property, you must explicitly declare the closure as escaping. This informs the compiler that the closure may outlive the function call and can be stored for later execution. If you attempt to capture a non-escaping closure in such a scenario, you'll encounter a compile-time error.
 */
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

/*
 the someFunctionWithEscapingClosure(_:) function takes a closure as its argument and adds it to an array that’s declared outside the function. If you didn’t mark the parameter of this function with @escaping, you would get a compile-time error.

 an escaping closure that refers to self needs special consideration if self refers to an instance of a class. Capturing self in an escaping closure makes it easy to accidentally create a strong reference cycle. For information about reference cycles, see Automatic Reference Counting.

 normally, a closure captures variables implicitly by using them in the body of the closure, but in this case you need to be explicit. If you want to capture self, write self explicitly when you use it, or include self in the closure’s capture list. Writing self explicitly lets you express your intent, and reminds you to confirm that there isn’t a reference cycle. For example, in the code below, the closure passed to someFunctionWithEscapingClosure(_:) refers to self explicitly. In contrast, the closure passed to someFunctionWithNonescapingClosure(_:) is a nonescaping closure, which means it can refer to self implicitly.
 */
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
// Prints "100"


/*
 capture self by including it the closure's capture list
 */
class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

/*
 if self is an instance of a structure or an enumeration, you can always refer to self implicitly. However, an escaping closure can’t capture a mutable reference to self when self is an instance of a structure or an enumeration. Structures and enumerations don’t allow shared mutability
 */
struct SomeStruct {
    var x = 10
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 }  // Ok
        //someFunctionWithEscapingClosure { x = 100 }     // Error
    }
}


// Autoclosures
/*
 an autoclosure is a closure that's automatically created to wrap an expression that's being passed as an argument to a function
 it does not take any arguments, and when called, it returns the value of the expression that is wrapped inside it
 
 an autoclosure lets one delay evaluation, because the code inside is not run until one calls the closure
 */

/*
 Even though the first element of the customersInLine array is removed by the code inside the closure, the array element isn’t removed until the closure is actually called. If the closure is never called, the expression inside the closure is never evaluated, which means the array element is never removed. Note that the type of customerProvider isn’t String but () -> String — a function with no parameters that returns a string.

 You get the same behavior of delayed evaluation when you pass a closure as an argument to a function.
 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"


let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"


print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"

/*
 the serve(customer:) function in the listing above takes an explicit closure that returns a customer’s name. The version of serve(customer:) below performs the same operation but, instead of taking an explicit closure, it takes an autoclosure by marking its parameter’s type with the @autoclosure attribute. Now you can call the function as if it took a String argument instead of a closure. The argument is automatically converted to a closure, because the customerProvider parameter’s type is marked with the @autoclosure attribute.
 */
// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"


//If you want an autoclosure that’s allowed to escape, use both the @autoclosure and @escaping attributes.
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"

/*
 In the code above, instead of calling the closure passed to it as its customerProvider argument, the collectCustomerProviders(_:) function appends the closure to the customerProviders array. The array is declared outside the scope of the function, which means the closures in the array can be executed after the function returns. As a result, the value of the customerProvider argument must be allowed to escape the function’s scope.


 */
