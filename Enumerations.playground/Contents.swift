import UIKit

// Enumerations
/*
 an enum defines a common type for a group of related values and enables one to work with those values in a type-safe way within your code
 
 enumerations in Swift are flexible, they do not have to provide a value for each case of the enumeration
 
 if a value is provided (known as a raw value) for each enumeration case, the value can be a string, a character, or a value of any integer or floating-point type
 
 enumeration in Swift are first-class types in their own right
 they adopt many features traditionally supported only by classes, such as computed properties to provide additional info about the enumeration's current value, and instance methods to provide functionality related to the values the enums represents
 enumerations can also define initializers to provide an initial case value; can be extended to expand their functionality beyond their original implementation; and can conform to protocols to provide standard functionality
 */


// Enumeration Syntax
/*
 the different enumeration cases are values in their own right, with an explicitly defined type of CompassPoint
 
 each enum definition defines a new type
 like other types in Swift, their names start with a capital letter
 give enumeration types sungular rather than plural names, so that they read as self-evident
 */
enum CompassPoint {
    case north
    case south
    case east
    case west
}


// Multiple cases can appear on a single line, separated by commas
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
