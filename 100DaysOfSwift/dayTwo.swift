//Array 
/*
In Swift, arrays can either be constants or variables
Arrays hold a series of data
*/

//Sets and arrays
/*
Both hold multiple values inside a single variable.
However, sets are unordered and don't contain duplicate values
while arrays retain their order and can have duplicates 

The difference makes sets more useful when checking if an item 
exists due to faster retrieval unlike an array that has to be 
looped through

To use a set, there must be no duplicates in your data
and you must be seeking faster retrieval
*/

let colors = Set(["red", "Green", "Blue"])

//Tuples and arrays
/*
Tuples hold a fixed set of things that can't be changed
*/
var website = (name: "Apple", url:"www.apple.com")

//one can't add to it, it's only the 2, name and url

var website = ["Apple", "www.apple.com"]

//Tuples combine more than one data type in a single value
var person = (name:"Lee", age:"21", isMarried: false)
person.name

//When to use an array, set, or tuple
/*
Arrays keep the order and can have duplicates, sets are unordered
can't have duplicates, and tuples have fixed sizes of fixed types 
inside them
*/

//Dictionaries
/* 
Dictionaries allow for choosing of a key that identifies
the items we want to add. This optimizes the retrieval time

Unfortunately, one can't be guaranteed that a key in a dictionary exists

user["country"]
*/

let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]

/*
If we want history results and they are not yet uploaded,
we could set a default value
*/
let historyResult = results["geography", default: 0]

//Don't understand how a default value is set for an undeclared dictionary
let historyResult = results["history", default: 0]

//Empty Collection
//Just an empty array (for now)


//Enums
// A special class that represents a group of constants (unchangeable)

enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}

// Enums with associated values enable us to add extra info to an enum case
//(Think of them as adjectives to a noun, as it lets us describe the case in more detail)

//Why Enums have Raw values
enum Mood: Int{
    case happy
    case sad
    case grumpy
    case sleepy
    case hungry
}
