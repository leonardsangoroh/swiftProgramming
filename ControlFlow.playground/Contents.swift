import UIKit

// Control Flow
/*
 the following perform a task multiple times
 - while Loop
 
 the following execute different branches of code based on certain conditions
 - if
 - guard
 - switch
 
 transfer flow of execution to another point in one's code
 - break
 - continue
 
 iterate over collections and ranges
 - for-in
 
 defer statements that wrap code to be executed when leaving the current scope
 */


// For-In Loops
// used to iterate over a sequence
let names = ["Lee", "Leonard", "Sangoroh"]

for name in names {
    print("Hello \(name)")
}

// iterate over a dictionary
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


// use for-in loops with ranges
// the value of the index is set to the first number in the range(1)
// the statements in the loop are executed
// the value of the index is updated to contain the second value in the range (2)
for index in 1...5 {
    print("\(index) times five is \(index*5)")
}

// if there's no need for each value from a sequence, ignore the values by using
// an underscore in place of a variable name
// use closed ranges, which include both endpoints
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
    print(answer)
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"


// half-open operator
/*
 consider drawing the tick marks for every minute on a watch face
 one wants to draw 60 tick marks, starting with minute zero
 inlcude lower bound but not the upper bound
 */
let minutes = 60
for tickMark in 0..<minutes {
    print ("tick mark draw: \(tickMark)")
}

// some might want fewer tick marks on the UI
// e.g. one mark every five minutes
// use stride(from:to:by:) to skip unwanted marks
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("tick mark draw me: \(tickMark)")
    // prints 0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55
}

// closed ranges are also available by using stride(from:through:by:)
let hours = 12
let hourInterval = 3

for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print("tick mark draw: \(tickMark)")
}


// While Loops
// performs a set of statements until a condition becomes false
// best used when the number of iterations is not known before the first iteration begins
/*
 Swift provides two kinds of while loops:
 - while evaluates its conditions at the start of each pass through a loop
 - repeat-while evaluates its condition at the end of each pass through the loop
 */


// While
/*
 evaluates a single condition
 if condition is true, a set of statements is repeated until condition becomes false
 */

// snakes and ladders example
// has 25 boxes
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

/*
 squares are set to have more specific values for the snakes and ladders
 squares with ladder base have a positive number to move a player up the board
 squares with a snake head have a negative number to move back down the board
 */
// e.g. square 3 contains the bottom of a ladder that moves you up to square 11
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare {
    // roll the dice
    // automate dice roll
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    //moved by the rolled amount
    square += diceRoll
    if square < board.count {
        // if still on the board, move up or down for a snake or ladder
        square += board[square]
    }
}

print("Game Over!")


// Repeat-While
// performs a single pass through the loop back first, before considering the loop's condition
// it then continues to repeat the loop until the condition is false

// implementation of the snakes and ladders game using repeat-while
repeat {
    //check for ladder base or snake heads
    // move up or down for a snake or ladder
    square += board[square]
    
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game Over!")


// Conditional Statements
// execute different blocks of code based on certain conditions
// there are two ways to add conditional code blocks;
// - if statements - used to evaluate simple conditions with few possible outcomes
// - switch statements - suited to complex conditions with multiple possible permutations and it useful in situations where pattern matching can help select an appropriate code branch/block to execute

// If
// if executes a set of statements only if that condition is true
// if a condition is met, the code block is executed, otherwise code execution continues after the if statement's closing brace
let temperature = 24
if temperature <= 25 {
    print("It might get cold and you might need a sweater")
}

/*
 the if statement can provide an alternative set of statements, knows as the else clause
 for situations when the if condition is false
 */
if temperature <= 25 {
    print("It might get cold and you might need a sweater")
} else {
    print("You don't need a sweater")
}

// one can chain multiple if statement
// the final else clause is optional, however, and could be excluded if the set of conditions does not need to be complete
var temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

// Swift provides a shorthand spelling of 'if' that you can use when setting values
// available on later versions of Swift
/*
 each branch/block contains a single value
 every if branch/block has a corresponding else if branch or else branch, ensuring that one or the branches always matches and that the if expression always produces a value, regardless of which conditions are true
 all of the branches/blocks of an if expression need to contain values of the same type.
 Because Swift checks the type of each branch separately, values like nil that can be used with more than one type prevent Swift from determining the if expression’s type automatically. Instead, you need to specify the type explicitly
 */
//var temperatureInCelsius = 27
//let weatherAdvice = if temperatureInCelsius <= 0 {
//    "It's very cold. Consider wearing a scarf."
//} else if temperatureInCelsius >= 30 {
//    "It's really warm. Don't forget to wear sunscreen."
//} else {
//    "It's not that cold. Wear a T-shirt."
//}
//
//print(weatherAdvice)

/*
 one branch of the if expression has a string value and the other branch has a nil value. The nil value could be used as a value for any optional type, so you have to explicitly write that freezeWarning is an optional string
 */

//let freezeWarning: String? = if temperatureInCelsius <= 0 {
//    "It's below freezing. Watch for ice!"
//} else {
//    nil
//}

// an alternative way to provide this type of info is to provide an explicit type for nil
// instead of providing an explicit type for freezingWarning
//let freezeWarning = if temperatureInCelsius <= 0 {
//    "It's below freezing. Watch for ice!"
//} else {
//    nil as String?
//}

// an if expression can respond to unexpected failures by throwing an error or calling a function like fatalError(_:file:line:) that never returns
//let weatherAdvice = if temperatureInCelsius > 100 {
//    throw TemperatureError.boiling
//} else {
//    "It's a reasonable temperature."
//}

/*
 NB: in addition to using if expressions on the right-hand side of an assignment (as shown above),
 one can also use them as the value that a function or closure returns
 */


// Switch
/*
 considers a value and compares it against several possible matching patterns
 it executes an appropriate block of code, based on the first pattern that matches successfully
 a switch statement provides an alternative to the if statement for responding to multiple potential states
 
 a switch statement must be exhaustive
 to make a switch statement exhaustive, you typically include a case for each possible value of the expression being switched over. You can also use a default case to handle any remaining cases that are not explicitly listed.
 */
let someCharacter: Character = "z"

switch someCharacter {
case "a":
    print("The first letter of the Latin alphabet")
case "z":
    print("The last letter of the Latin alphabet")
default:
    print("Some other character")
}

// like if expressions, switch statements also have an expression form:
//let anotherCharacter: Character = "a"
//let message = switch anotherCharacter {
//case "a":
//    "The first letter of the Latin alphabet"
//case "z":
//    "The last letter of the Latin alphabet"
//default:
//    "Some other character"
//}
//
//
//print(message)

/*
 like if expressions, you can throw an error or call a function like fataError(_:file:line:)
 that never returns instead of providing a value for a given case
 */


// No Implicit Fallthrough
/*
 in contrast with switch statements in C and objective-c, switch statements in Swift don't fall through the bottom of each case and into the next one by default.
 instead, the entire switch statement finishes its execution as soon as the first matching switch case is completed, without requiring an explicit break statement
 */

/*
 the body of each case must contain at least one executable statement.
 an empty case is not accepted
 */


// Compound Cases
/*
 checks whether the case matches either of the values
 */
let anotherCharacter: Character = "a"

switch anotherCharacter {
case "a", "A":
    print("The letter a or A")
default:
    print("Not the letter A")
}

// to explicitly fall through at the end of a particular switch case, use the fallthrough keyword


// Interval Matching
/*
 values in switch cases can be checked for their inclusion in an interval
 approximateCount is evaluated in a switch statement
 each case compares that value to a number of interval
 */

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)")


// Tuples
/*
 one can use tuples to test multiple values in the same switch statement
 each element of the tuple can be tested against a different value or interval of values
 alternatively, use '_' underscore to match any possible value
 */

// (x,y) points example
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin")
case (_,0):
    print("\(somePoint) is on the x-axis")
case (0,_):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}


// Value Binding
/*
 a switch case can name the value or values it matches to temporary constants or variables that are bound within the respective cases' body
 the switch statement determines whether the point is on the x-axis, on the y-axis, or elsewhere
 the three switch cases declare placeholder constants x and y, which temporarily take on one or both
 tuple values from anotherPoint. The first case, case (let x, 0), matches any point with a y value of 0
 and assigns the point’s x value to the temporary constant x. Similarly, the second case, case (0, let y),
 matches any point with an x value of 0 and assigns the point’s y value to the temporary constant y.
 */
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// prints "on the x-axis with an x value of 2"


// Where
/*
 used to check for additional conditions
 */
// the switch case matches the current value of point only if the where clause's conidition evaluates to true for that value
let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {
case let (x,y) where x == y:
    print("(\(x), \(y) is on the line x == y")
case let (x,y) where x == -y:
    print("(\(x), \(y) is on the line x == -y")
case let (x,y):
    print("(\(x), \(y) is just some arbitrary point")
}


// Compound Cases
/*
 multiple switch cases that share the same body can be combined by writing several patterns after a case
 with a comma between each of the patterns
 if any of the patterns match, then the case is considered to match
 */
let someCharacterr: Character = "e"
switch someCharacterr {
case "a", "e", "i", "o", "u":
    print("\(someCharacterr) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacterr) is a consonant")
default:
    print("\(someCharacterr) isn't a vowel or a consonant")
}
// Prints "e is a vowel"

// compound cases can also include value bindings
/*
 all the patterns of a compund case must have the same set of value bindings
 and each binding has to get a value of the same type from all of the patterns in the compound case
 this ensures that no matter which part of the compound case matched, the code in the body of the case can always access a value for the bindings and that the value always has the same type
 */
let stillAnotherPoint = (9,0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not an axis")
}


// Control Transfer Statements
// they change the order in which code is executed by;
// transferring congrol from one piece of code to another,
/*
 Swift has five control transfer statements:
 - continue
 - break
 - fallthrough
 -return
 -throw
 */

// continue
// it says "i am done with the current loop iteration" without leaving the loop altogether

// program to remove all vowels from a string
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u"]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)

// break
/*
 break statement ends execution of an entire control flow statement immediately
 
 break in a loop statement
 when used inside a loop, break ends the loop's execution immediately and transfers control to the code after the loop closing brace (})
 no further code from the current iteration is executed, and no further iterations of the loop are started
 
 break in a switch statement
 inside a switch statement, it causes the switch statement to end its execution immediately and to transfer control to the code after the switch statement's closing brackets (})
 
 this behavior can be used to match and ignore one or more cases in a switch statement. Because Swift’s switch statement is exhaustive and doesn’t allow empty cases, it’s sometimes necessary to deliberately match and ignore a case in order to make your intentions explicit
 you do this by writing the break statement as the entire body of the case you want to ignore
 when that case is matched by the switch statement, the break statement inside the case ends the switch statement’s execution immediately
 */
let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value couldn't be found for \(numberSymbol).")
}
// Prints "The integer value of 三 is 3."

// fallthrough
/*
 in Swift, switch statements don't call through the bottom of each case and into the next one.
 one can however implement this using 'fallthrough'
 
 the fallthrough keyword does not check the case conditions for the switch case
 */
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."


// Labeled Statements
// used to break from a specific loop when there is nesting  of loops or conditional statements
// since there's not nesting in the example below, labelling the while loop is not mandatory for it to break from it
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")


// Early Exit
/*
 a guard statement executes statements depending on the Boolean value of an expression
 use a guard statement to require that a condition must be true in order for the code after the guard to be executed
 a guard statement always has an else clause, which is executed if the condition is not true
 if the guard statement’s condition is met, code execution continues after the guard statement’s closing brace
 any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in
 */

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    print("I hope the weather is nice in \(location)")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."


// Deferred Actions
/*
 defer lets you control when a piece of code is executed. You use a defer block to write code that will be executed when the program reaches the end of the current scope
 in the example below, the code inside of the defer block is executed before exiting the body of the if statement. First, the code in the if statement runs, which increments score by five
 then, before exiting the if statement’s scope, the deferred code is run, which prints score.
 
 the code inside the defer always runs, regardless of how the program exits that scope
 this behavior makes defer useful for operations where you need to guarantee a pair of actions happen — like manually allocating and freeing memory, opening and closing low-level file descriptors, and beginning and ending transactions in a database — because you can write both actions next to each other in your code
 if you write more than one defer block in the same scope, the first one you specify is the last one to run
 */
var score = 1
if score < 10 {
    defer {
        print(score)
    }
    score += 5
}
// Prints "6"

/*
 if your program stops running — for example, because of a runtime error or a crash — deferred code doesn’t execute
 however, deferred code does execute after an error is thrown
 */


// Checking API Availability
/*
 the availability condition above specifies that in iOS, the body of the if statement executes only in iOS 10 and later; in macOS, only in macOS 10.12 and later. The last argument, *, is required and specifies that on any other platform, the body of the if executes on the minimum deployment target specified by your target
 */
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs or later on iOS, and use macOS 10.12 APIs or later on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}

// using guard stattement
@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}


func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
       return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}


/*
 in addition to #available, Swift also supports the opposite check using an unavailability condition.
 */
if #available(iOS 10, *) {
} else {
    // Fallback code
}


if #unavailable(iOS 10) {
    // Fallback code
}
