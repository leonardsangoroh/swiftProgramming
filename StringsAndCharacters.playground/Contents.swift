import UIKit

// a string is a series oc cahracters


// String Literals
// one can include predefined String values within your code as String literals.
// a string literal is a sequence of characters surrounded by double quotation marks
let someString = "Some string literal value"


// Multiline String Literals (includes line breaks)
let quotation = """
The white rabbit put on his spectacles. "Where
please your Magesty?"
"Begin at the beginning," the Kind said gravely,
till you come to the end; then stop."
"""

print(quotation)

/*
OUTPUT
 The white rabbit put on his spectacles. "Where
 please your Magesty?"
 "Begin at the beginning," the Kind said gravely,
 till you come to the end; then stop."
 */

// Multiline String Literals (includes line breaks)
let qquotation = """
The white rabbit put on his spectacles. "Where \
please your Magesty?"
"Begin at the beginning," the Kind said gravely, \
till you come to the end; then stop."
"""

print(qquotation)

/*
 OUTPUT
 The white rabbit put on his spectacles. "Where please your Magesty?"
 "Begin at the beginning," the Kind said gravely, till you come to the end; then stop."

 */


// to make a multiline string literal that begins or ends with a line feed, write a black line as the first or last line
let lineBreaks = """

This string starts with a line break
It also ends with a line break

"""
print(lineBreaks)

let indentedLineBreaks = """
    This string starts at the right place
        This string has whitespace on its left side
    """


// Special Characters in String Literals
// string literals can include the following special characters
// - \0 => null character
// - \\ => backslash
// - \t => horizontal tab
// - \n => line feed
// - \r => carriage return
// - \" => double quotation mark
// - \' => single quotation mark

let wiseWords = "\" Imagination is more important than knowledge\""
// OUTPUT
// Imagination is more important that knowledge
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496


// Extended String Delimiters
// one can place a string literal withing extended delimiters to include special characters in a string without invoking their effect

let noExternalDelimiter = "Line 1\nLine 2"

print(noExternalDelimiter)

//Line 1

//Line 2

let withExternalDelimiter = #"Line 1\nLine 2"#

print(withExternalDelimiter)

//Line 1\nLine 2

let withExternalDelimiterBreakLine = #"Line 1\#nLine 2"#

print(withExternalDelimiterBreakLine)

//Line 1

//Line 2

// string literals created using extended delimiters can also be multiline string literals.
// One can use extended delimiters to include the text """ in a multiline string
// overriding the default behaviour that ends the literal
let threeMoreDoubleQuotes = #"""
Here are three more double quotes: """
"""#

// OUTPUT
// Here are three more double quotes: """


// Initializing an empty String
var emptyString = ""
var anotherEmptyString = String()

// check if string is empty
if emptyString.isEmpty {
    print("String is empty")
}


// String Mutability
// var - can be mutated
// let - can't be mutated
var variableString = "Horse"
variableString += " and a carriage"


// Strings are Value Types
/*
 if you create a new String value, that String value is copied when passed to a function or method,
 or when its assigned to a constant or variable.
 In each case, a new copy of the existing String value is created, and the new copy is passed or assigned,
 not the original version
 Swift's copy-by-default String behavious ensures that when a function or method passes you a String value,
 it is clear you own that exact String value, regardless of where it came from.
 Hence the string passed won't be modified unless you modify it yourself
 */


// Working with Characters

// one can access the individual Character values for a String by iterating over the string with a for-in loop
for character in "Kenyan" {
    print(character)
}

// create a stand-alone character variable or constant
var period: Character = "."

// string values can be constructed by passing an array of Character values as an argument to its initializer
let catCharacters: [Character] = ["C","a","t"]
let catString = String(catCharacters)
print(catString) // prints "Cat"


// Concatinating String and Characters
var stringOne = "hello"
let stringTwo = " world"
var welcomeToTheWorld = stringOne + stringTwo

// one can also append a String value to an existing String variable with addition assignment operator
stringOne += stringTwo
// stringOne = "hello world"

// one can append a Character value to a String variable with the String type's append() method
let exclamationMark: Character = "!"
welcomeToTheWorld.append(exclamationMark)


// String interpolation
/*
 string interpolation is a way to construct a new String value from a mix of
 constants, variables, literals, and expressions by including their values inside a string literal.
 one can use string interpolation in both single-line and multi-line comments
 */
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// one can use extended string delimiters to create strings containing characters that would otherwise be treated as a string interpolation
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."

print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."


// Unicode
// it is an international standard for encoding, representing, and processing text in different writing systems
// it enables one to represent almost any character from any language in a standardized form, and to read and write those characters to and from an external source such as a text file or web page
// Swift's String and Character types are fully Unicode-compliant


// Unicode Scalar Values
/*
 behind the scenes, Swift's native String type is built from Unicode scalar values.
 a unicode scalar value is a unique 21-bit number for a character or modifier,
 such as U+0061 for LATIN SMALL LETTER A ("a"), or U+1F425 for FRONT-FACING BABY CHICK ("🐥").
 
 not all 21-bit unicode scalar values are assigned to a character - some are reserved for future assignment or for use in UTF-16 encoding
 */


// Extended Grapheme Clusters
/*
 every instance of Swift's Character type represents a single extended grapheme cluster
 an extended grapheme cluster is a sequence of one or more unicode scalars that when combined produce a single human-readable character
 */

// in both cases below, the letter é is represented as a single Swift Character value that represents an extended grapheme cluster.
// in the first case, the cluster contains a single scalar; in the second case, it’s a cluster of two scalars:
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é

// extended grapheme clusters are a flexible way to represent many complex script characters as a single Character value e.g. Hangul syllables from the Korean alphabet
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

// Unicode scalars for regional indicator symbols can be combined in pairs to make a single Character value, such as this combination of REGIONAL INDICATOR SYMBOL LETTER U (U+1F1FA) and REGIONAL INDICATOR SYMBOL LETTER S (U+1F1F8):
let regionalIndiactorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸


// Counting Characters
// to retrieve a count of the Character values in a string, use the count property of the string
// it also counts the whitespaces
let myNameCombined = "Lee, Leonard, Sangoroh"
print(myNameCombined.count) // output is 22

/*
 Swift's use of extended grapheme clusters for Character values means that string modification may not always affect a string's character count.
 e.g. initialize a string with 4 character count, then append a COMBINING ACUTE ACCENT (U+0301) to the end of the string, the resulting string will still have a character cound of 4, with a fourth character of é, not e
 */
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"


word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301


print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"


/*
Extended grapheme clusters can be composed of multiple Unicode scalars. This means that different characters —
 and different representations of the same character — can require different amounts of memory to store. Because
 of this, characters in Swift don’t each take up the same amount of memory within a string’s representation. As
 a result, the number of characters in a string can’t be calculated without iterating through the string to
 determine its extended grapheme cluster boundaries. If you are working with particularly long string values, be
 aware that the count property must iterate over the Unicode scalars in the entire string in order to determine
 the characters for that string.
 */


// Accessing and Modifying a String


// String Indices
/*
 Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string
 Since different characters require different amounts of memory because of extended grapheme clusters, in order to determine which Character is at a particular position, one must iterate over each Unicode scalar from the start or end of that String.
 For this reason, Swift strings can't be indexed by integer values
 */
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

// one can use the indices property to access all of the indices of individual characters in a string
for index in greeting.indices {
    //print("\(index)") // prints Index type that holds the internal representation of the character index
    print("\(greeting[index])", terminator: " ")
}


// all above properties such as startIndex can be used on any type that conforms to the Collection protocol
// This includes String, as well as collection types such as Array, Dictionary, and Set


// Inserting and Removing
// to insert a single character into a string at a specified index, use insert(_: at: )
// to insert contents of a string at a specified index, use insert(contentsOf: at: )
var karibuNyumbani = "Welcome"

karibuNyumbani.insert("!", at: karibuNyumbani.endIndex)
karibuNyumbani.insert(contentsOf: " Lee", at: karibuNyumbani.index(before: karibuNyumbani.endIndex))

// to remove a single character from a string at a specified index, use remove(at: )
// to remove a substring at a specified range, use removeSubrange(_:)
karibuNyumbani.remove(at: karibuNyumbani.index(before: karibuNyumbani.endIndex))

let range = karibuNyumbani.index(karibuNyumbani.endIndex, offsetBy: -6)..<karibuNyumbani.endIndex
karibuNyumbani.removeSubrange(range)

// all above properties such as startIndex can be used on any type that conforms to the RangeReplaceableCollection protocol
// This includes String, as well as collection types such as Array, Dictionary, and Set


// Substrings
// this is part of an existing string
// similar to strings, with one major difference
// they refer to the original string they were cut out from until they are assigned converted from substriing to an instance of String
let gggreeting = "Hello, world!"
let iiindex = gggreeting.firstIndex(of: ",") ?? gggreeting.endIndex
let beginning = gggreeting[..<iiindex]
// beginning is "Hello"


// Convert the result to a String for long-term storage.
let newString = String(beginning)

// substrings aren’t suitable for long-term storage — because they reuse the storage of the original string, the entire original string must be kept in memory as long as any of its substrings are being used.


// Comparing Strings

// there are three ways to compare textual values;
/*
 string and character equality
 prefix equality
 suffix equality
 */

// String & Character Equality
// it is checked with the equal to operator(==) and the not equal to operator (!=)
let qqquotation = "wagwan"
let quotationTwo = "helloo"

if qqquotation == quotationTwo {
    print("Guess what, we are equal!")
} else {
    print("We are not equal")
}
// OUTPUT
// We are not equal

// strings are considered equal if there extended grapheme clusters are canonically equivalent.
// extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they are composed from unicode scalars behind the scenes
// For example, LATIN SMALL LETTER E WITH ACUTE (U+00E9) is canonically equivalent to LATIN SMALL LETTER E (U+0065) followed by COMBINING ACUTE ACCENT (U+0301). Both of these extended grapheme clusters are valid ways to represent the character é, and so they’re considered to be canonically equivalent

// Prefix and Suffix Equality
// to check whether a string has a particular string prefix or suffix, call the string’s hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value.
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"

// the hasPrefix(_:) and hasSuffix(_:) methods perform a character-by-character canonical equivalence comparison between the extended grapheme clusters in each string


// Unicode Representations of Strings

/*
 When a Unicode string is written to a text file or some other storage, the Unicode scalars in that string are
 encoded in one of several Unicode-defined encoding forms. Each form encodes the string in small chunks known as
 code units. These include the UTF-8 encoding form (which encodes a string as 8-bit code units), the UTF-16
 encoding form (which encodes a string as 16-bit code units), and the UTF-32 encoding form (which encodes a
 string as 32-bit code units).
 */

/*
 A collection of UTF-8 code units (accessed with the string’s utf8 property)

 A collection of UTF-16 code units (accessed with the string’s utf16 property)

 A collection of 21-bit Unicode scalar values, equivalent to the string’s UTF-32 encoding form (accessed with the string’s unicodeScalars property)
 */
let dogString = "Dog‼🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶
