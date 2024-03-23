import UIKit

// Basic Operators

// operator - a special symbol or phrase that you use to check, change, or combine values

// Terminology
// unary - they operate on a single target e.g. -a
//       - unary prefix operators appear immediately before their tagret e.g. !b
//       - unary postfix operators appear immediately after their targets e.g. b!


// binary - they operate on two targets e.g. 2 + 3
//        - they are infix as they appear btw their two targets


// ternary - operate on 3 targets
//         - ternary conditional operator ( a ? b : c)


// Assignment Operator
// initializes of updates the value of a variable
let b = 10
var a = 5

a = b

// if the right side of the assignment is a tuple, its elements can be decomposed into multiple constants or variables at once
let (x, y) = (1, 2)
// x is equal to 1, y is equal to 2


// Arithmetic Operators
1 + 1
7 - 4
3 * 5
10 / 4

// Swift arithmetic operators don't allow values to overflow by default
// an integer or value overflow occurs when you attempt to store inside an integer/value variable a value that is larger than the maximum value the variable can hold.


// the addition operator is also supported for String concatination
"hello" + "world"


// Remainder operator
20000%3
// % works out how many multiples of 3 fit in 2000 and returns the value that's left over
// 2000 = ( 3 * someMultiplier) + remainder
// returns remainder

// also works with negative numbers
-9 % 4
// returns -1 since;
// -9 = (4 * -2) + -1

// the sign of the right hand side value is always ignored.
// meaning a % b and a % -b results in the same answer


// Unary Minus Operator
// the unary minus operator is prepended directly before the value it operates on, without any whitespace
let three = 3
let minusThree = -three
let plustThree = -minusThree // +3


// Unary Plus Operator
// the unary plus operator simply returns the value it operates on, without any change
// honestly, you're better off without this knowledge
let minusSix = -6
let alsoMinusSix = +minusSix


// Compound Assignment Operators
// Swift provides compound assignment operators that combine assignment (=) with another operation

// addition assignment operator (+=)
var aa = 1
aa += 2
// aa = 3


// Comparison Operators
// each comparison operators returns a Bool value to indicate whether or not the statement is true
1 == 1 // equal to
2 != 1 // not equal to
2 > 1 // greater than
1 < 2 // less than
1 >= 1 // greater or equal to
2 <= 1 // less than or equal to


// Identity operators
// Swift provides identity operators (=== and !==)
// test whether 2 object references both refer to the same object instance


// one can compare 2 tuples if they have the same type and the same number of values.
// tuples are compared from left to right, one value at a time, until the comparison finds two values that aren't equal
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"


// ternary conditional operator
// it's a special operator with three parts, which takes the form question ? answerOne : answerTwo
// and returns a value
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


// Nil-Coalescing Operator
// it unwraps an optional; if it contains a value return it otherwise return the furthest-right value

// a ?? b
// the expression a is always of type optional.
// the expression b must match the type that's stored inside a
let defaultColorName = "gray"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName


// Range Operators
// these are shortcuts for expressing a range of values

// Closed Range Operator (a...b)
// it defines a range that runs from a to b, and includes the values a and b.
// the value of a must not be greater than b
// used when iterating over a range in which you want all of the values to be used
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Half-Open Range Operator (a..<b)
// defines a range that runs from a to b, excluding b
// the value of a must not be greater than b
// used when working with zero-based lists such as arrays
let names = ["Lee", "Leonard", "Sangoroh"]
let count = names.count

for i in 0..<count {
    print("Person \(i+1) is called \(names[i])")
}


// One-Sided Ranges
// continue as far as possible in one direction e.g. a range that includes all the elements of an array from index 1 to the end of the array
for name in names[2...] {
    print(name)
}

// half open range operator
for name in names[..<2] {
    print(name)
}

// check whether a range contains a certain value
let range = ...5
range.contains(7)
range.contains(-1)


// Logical Operators
// they modify or combine the Boolean logic values true and false

// Logical NOT Operator (!a)
// it inverts a Boolean value
// it is a prefix operator, and appears immediately before the value it operates on
let allowedEntry = false

if !allowedEntry {
    print("ACCESS DENIED")
}

// Logical AND Operator (a && b)
// creates logical expressions where both values must be true for the overall expression to also be true
// it either is false, the overall expression will be false
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome")
} else {
    print("Access Denied")
}


// Logical OR Operator (a || b)
// only one of the two avlues has to be true for the overall expression to be true
if enteredDoorCode || passedRetinaScan {
    print("Welcome")
} else {
    print("Access Denied")
}


// Combining Logical Operators
// one can combine multiple logical operators to create longer compound expressions:
let hasDoorKey = false
let knowsOverridePassword = false
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// If we’ve entered the correct door code and passed the retina scan, or if we have a valid door key, or if we know the emergency override password, then allow access.


// Explicit Parentheses
// It's sometimes useful to include parentheses when they're when they are not strictly needed
// to make the intention of a complex expression easier to read.
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// the parentheses make it clear that the first two values are considered as part of a separate possible state in the overall logic.
// the output of the compound expression doesn’t change, but the overall intention is clearer to the reader.
// readability is always preferred over brevity; use parentheses where they help to make your intentions clear.
