//Operators and conditions

let firstScore = 12
let secondScore = 3

let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore/secondScore
let remainder = 13 % secondScore

//Operator overloading
/*
Enables an operator perform more than one action 
e.g. + is used to add in arithmetic operations,
and used to join strings and arrays at the same time
 */

//Compound assignment operators
//They assign the result to the respective variable being used
var score = 100
score += 5
//output is 105

var statement = "It is "
statement += "Friday"

//Comparison operators
let x = 6
let y = 4

x == y
x != y

x < y
x >= y

//Strings also work since srtings have a natural alphabetical order
"Taylor" <= "Swift"

//Conditions

let firstCard = 11
let secondCard = 10

//if condition
if firstCard + secondCard == 2 {
    print("Aces - lucky")
} /*else if */ else if firstCard + secondCard == 21{
    print("Blackjack!")
}
/*if...else */ else {
    print("Regular cards")
}

//combining operators

// && operator
let ageOne = 12
let ageTwo = 21

if ageOne > 18 && ageTwo > 18 {
    print("Both are over 18")
}

// || operator

if ageOne > 18 || ageTwo > 18 {
    print("Both are over 18")
}

//Ternary operator
/*
It works with 3 values at once
It checks a condition specified in the first value,
if true, return second value,
if false, return third value
*/

//Refer to variables on line 43 & 44
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

//The above code is same as 
if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}

//Switch statements

let weather = "rain"

switch weather {
    case "rain":
        print("Carry an umbrellla")
    case "snow":
        print("Stay indoors")
    case "sunny":
        print("Wear sunscreen")
    default:
        print("Enjoy your day!")
    
}

//Range operators
/*
 ..< creates ranges up to but excluding the final value (1..<5) = 1,2,3,4
 ... creates range up to and including the final value (1...5) = 1,2,3,4,5
 */

let total = 15

switch total {
case 0..<10:
    print("You are a poor striker")
case 10..<20:
    print("You had a decent season")
case 20..<30:
    print("Are you Haaland!!!!")
default:
    print("How many goals you got?")
}

//Summary
