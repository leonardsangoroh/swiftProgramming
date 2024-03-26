import UIKit

// Collection Types
// they store a collection of values
/*
 // REFER TO 'ArraySetDict' IMAGE IN RESOURCES FOLDER
 The three main collection types are
 - arrays - ordered collection of values
 - sets - unordered collection of unique values
 - dictionaries - unordered collections of key-value associations
 */


// Mutability of Collections
/*
 all can be changed or mutated after its creation.
 this change can be through adding, removing, or changing items in the collection
 if assigned to a constant (using let), then the collection is unmutatable
*/


// Arrays
/*
 stores values of the same type in an ordered list
 the same value can appear in an array multiple times at different positions
 
 Swift's Array type is bridged to Foundation's NSArray class
 the statement above means that when you use Swift's native array type (Array), it can be automatically
 converted to an NSArray object when interacting with Objective-C APIs that expect an NSArray. This
 seamless bridging allows Swift code to work with Objective-C APIs that use arrays without needing
 explicit conversions, making interoperability between Swift and Objective-C smoother and more natural.
 Similarly, Objective-C arrays (NSArray) can be automatically bridged to Swift arrays when imported into
 Swift code.
 */


// Creating an Empty Array

var someInts: [Int] = []
var someMoreInts:Array <Int> = []

// Creating an Array with a Default Value
// pass the initializer a default value of the appropriate type(called repeating)
// and the number of times that value is repeated in the new intialized array (called count)
var threeStrings = Array(repeating: "Hellow", count: 3)
print(threeStrings) // Output: ["Hellow", "Hellow", "Hellow"]

// it also works with arrays (collections)
var threeArrays = Array(repeating: threeStrings, count: 3)
print(threeArrays)


// Creating an Array by Adding Two Arrays Together
/*
 one can create a new array by adding two existing arrays with compatible types with the addition operator
 the new array type is inferred from the type of the two arrays you add together
 */
var twoDoubles = [3.5, 5.4]
var oneDouble = [8.9]

var threeDoubles = twoDoubles + oneDouble


// Creating an Array with an Array Literal
// an array literal is written as a list of values, separated by commas, surrounded by a pair of square brackets
// shoppingList below has been initialized with two initial items
let shoppingList: [String] = ["Eggs", "Milk", "Butter", "Coconut Oil", "Hair Food"]

// thanks to Swift's type inference, one doesn't have to write the type of the array when initializing the array with an array literal containing values of the same type
var inferedShoppingList = ["Eggs", "Milk"]


// Accessing and Modifying an Array

// find out number of items in an array
print(inferedShoppingList.count)

// one can also use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to zero
if inferedShoppingList.isEmpty {
    print("Empty")
} else {
    print("There are things to be shopped")
}

// add item to the end of the array
inferedShoppingList.append("Flour")

// append an array of one or more compatible items with the addition assignment operator (+=)
inferedShoppingList += ["Nutella", "Groundnuts"]

// retrieve a value from the array by using subscript syntax,
// passing the index of the value you want to retrieve within the square brackets immediately after the name of the array
var firstItem = inferedShoppingList[0]

// use subscript index to change an existing value
inferedShoppingList[0] = "Quail Eggs"

// use subscript index to change a range of values at once, even if the replacement set of values has a different length than the range being replaced.
// used in a later version of Swift
//shoppingList[1...3] = ["Spoon", "Blueband"]

// insert item into array at a specified index
// call the insert(_:at:) method
inferedShoppingList.insert("Mashmellow", at: 3)


// remove an item from the array with remove(at:) method
// removes item at specified index, and returns removed item
let removedMashmellow = inferedShoppingList.remove(at: 3)

// remove last item from an array
let removedLastItem = inferedShoppingList.removeLast()


// Iterating over an array
// one can iterate over an array with the for-in loop
for item in shoppingList {
    print(item)
}

// if one needs the integer index of each item as well as its value, use the enumerated() method
for (index, value) in shoppingList.enumerated() {
    print ("Item \(index + 1): \(value)")
}


// Sets
/*
 a set stores distinct values of the same type in a collection with no defined ordering.
 one can use a set instead of an array when order of items is not important, or when each item in a collection needs to appear only once
 Swift's Set type is bridged to Foundation's NSSet class
 */

// Hash Values for Set Types
/*
 a type must be hashable in order to be stored in a set
 hashable - the type must provide a way to compute a hash value for itself.
 a hash value is an Int value that's the same for all objects that compare equally
 all of Swift's basic types (String, Int, Double, Bool) are hashable, hence can be used as set value types or dictionary key types. Enumeration case values without associated values are also hashable by default
 
 one can also use their own custome types as set value types or dictionary key types by making them conform to the Hashable protocol from the Swift Standard Library
 */


// Set Type Syntax
/*
 Set<Element> where Element is the type that the set is allowed to store
 */

// creating and initializing an Empty Set
// initializer syntax
// the type of the letters variable is inferred to be Set<Character>, from the type of the initializer
var letters = Set<Character>()


// Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Afrobeats", "Kenyan Music", "Bongo"]
// since all values in the aray literal are of the same type, Swift can infer that Set<String> is the correct type to use for the set below
var favGenres: Set = ["Afrobeats", "Kenyan Music", "Bongo"]


// Accessing and Modifying a Set
// one can access and modify a set through its methods and properties

// check number of items in a set
print(favGenres.count)

// use Boolean isEmpty property to check whether count property is equal to zero
if favGenres.isEmpty {
    print("There's not genre I like")
} else {
    print("I enjoy these genres")
}

// add a new item into a set by calling the insert(_:) method
favGenres.insert("Benga")

// remove an item from a set by calling remove(_:) method, which removes the item if it is a member of the set
// and returns nil if the set did not contain it.
// one can also remove all items using removeAll() method
if let removedGenre = favGenres.remove("Benga") {
    print("Removed: \(removedGenre)")
} else {
    print("I wasn't a fan in the first place")
}

// check if a set contains a particular item
if favGenres.contains("Benga") {
    print("You've got good taste in music")
} else {
    print("I'd recommend some music genre diversification")
}

// iterating over a set
for genre in favGenres {
    print(genre)
}

// Swift's Set type does not have a defined ordering. To iterate over the values of a set in a specific order, use the sorted() method, which returns the set's elements as an array sorted using the < operator
for genre in favGenres.sorted() {
    print(genre)
}


// Performing Set Operations
/*
 one can perform fundamental set operations, such as combining two sets together, determiining which values two sets have in common, or determining whether two sets contain all, some or none of the same values
 */

// Fundamental Set Operations
// REFER TO "SetOperations" IMAGE FOR A VISUAL REPRESENTATION

let oddDigits: Set<Int> = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]

// use intersection(_:) method to create a new set with only values common to both sets
let intersection = oddDigits.intersection(evenDigits).sorted()
// use symmetricDifference(_:) method to create a new set with values in either set, but not both
let symmetricalDifference = oddDigits.symmetricDifference(evenDigits).sorted()
// use the union(_:) method to create a new set with all of the values in both sets
let union = oddDigits.union(evenDigits).sorted()
// use the subtracting(_:) method to create a new set with values not in the specified set
let inoddNumbersOnly = oddDigits.subtracting(evenDigits).sorted()


// Set Membership and Equality
/*
 use 'is equal' operator(==) to check if two sets contain all of the same values
 use isSubset(of:) method to determine whether all of the values of a set are contained in a specified set
 use isSuperset(of:) method to determine whether a set contains all of the values in a specified set
 use isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set
 use isDisjoint(with:) method to determine whether two sets have no values in common
 */
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]


houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true


// Dictionaries
// it stores associations between keys of the same type and values of the same type in a collection with no defined ordering
// Swift's Dictionary type is bridged to Foundation's NSDictionary class


// Creating an empty dictionary
var varnamesOfNumbers: Dictionary<Int, String> = [:]
var namesOfIntegers: [Int: String] = [:]


// Creating a Dictionary with a Dictionary Literal
var airpots: Dictionary<String, String> = ["JKIA": "Jomo Kenyatta International Airport", "Wilson": "Wilson Airport"]
var moreAirports: [String:String] = ["KIA": "Kisumu International Airport"]

// you don't have to write the type of the dictionary if you're initializing it with a dictionary literal whose keys and values have consistent types
var viwanjaVyaNdege = ["JKIA": "Jomo Kenyatta International Airport", "Wilson": "Wilson Airport"]


// Accessing and Modifying a DIctionary

// check number of items in a dictionary
print(airpots.count)

// use the Boolean isEmpty property to check whether the count property is equal to zero
if airpots.isEmpty {
    print("No airports in this country!!!!!")
}

// add a new item to a dictionary using subscript syntax.
// use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type
airpots["MIA"] = "Mimi Iko Airport"

// use subscript syntax to change the value associated with a particular key
airpots["MIA"] = "Moi International Airport"

// an alternative to subscripting is using the dictinary's updateValue(_:forKey:) method to set or update the value for a particular key. The method sets a value if none exists, or updates the value if that key already exists.
// the method returns the old value after performing an update unlike a subscript which enables you to check whether an update took place or not
// the method returns an optional value fo the dictionary's value type which contains the old value for that key if one existed before the update, or nil if no value existed
if let oldValue = airpots.updateValue("Wilson Local Airpot", forKey: "Wilson") {
    print(oldValue)
}

/*
 one can use subscript syntax to retrieve a value from a dictionary for a particular key. Since its possible to request a key for which no value exists, a dictionary's subscript returns an optional value of the dictionary's value type. If the key exists, the subscript returns an optional value, if not it returns nil
 */
if let airportName = airpots["DUB"] {
    print(airportName)
} else {
    print("You might have to build your own airport and name it that")
}

// remove a key-value pair from a dictionary by assigning a value of nil for the key
airpots["APL"] = "Apple International"
airpots["APL"] = nil

// alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method.
// it removes the key-value pair it it exists and returns the removed value, or returns nil if no value existed
if let removedValue = airpots.removeValue(forKey: "APL") {
    print(removedValue)
} else {
    print("no airport was removed")
}


// Iterating over a Dictionary

// returned as a key-value pair
for (airpotJargon, airportName) in airpots {
    print("\(airpotJargon) : \(airportName)")
}

// retrieve an iterable collection of a dictionary's keys
for airpotJargon in airpots.keys {
    print(airpotJargon)
}

// retrieve an iterable collection of dictionary's values
for airportNames in airpots.values {
    print(airportNames)
}

// if there's need to use a dictionary's keys or values with an API that takes an Array instance, initialize a new array with the keys or values properties
let airportJargon = [String](airpots.keys)
let airportNames = [String](airpots.values)

// dictionaries don't have defined ordering. to iterate over the keys or values of a dictionary in a specific order, use the sorted() method on its keys or values property
