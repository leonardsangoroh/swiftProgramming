# Swift String Basics

This repository contains basic Swift code examples demonstrating the usage of strings, including string literals, multiline strings, special characters, extended string delimiters, string mutability, working with characters, string interpolation, Unicode, and more.
<br>
**The readMe file contains a summary while the Contents.swift file is more detailed.**

## String Literals

Strings in Swift are sequences of characters enclosed in double quotation marks.

### String Literals

One can include predefined String values within code as String literals. For instance:

```swift
let someString = "Some string literal value"
```

### Multiline String Literals

Multiline String literals can be used to include line breaks. For example:

```swift
let quotation = """
The white rabbit put on his spectacles. "Where
please your Majesty?"
"Begin at the beginning," the King said gravely,
"and go on till you come to the end; then stop."
"""
```

### Special Characters in String Literals

String literals can include special characters such as \0, \\, \t, \n, \r, \", and \'. For instance:

```swift
let wiseWords = "\"Imagination is more important than knowledge\""
```

### Extended String Delimiters

Extended delimiters can be used to include special characters in strings without invoking their effect. For example:

```swift
let withExternalDelimiter = #"Line 1\nLine 2"#
```

## String Mutability

Strings can be mutable (`var`) or immutable (`let`). For instance:

```swift
var variableString = "Horse"
variableString += " and a carriage"
```

## Working with Characters

One can access individual Character values in a String using a for-in loop. For example:

```swift
for character in "Kenyan" {
    print(character)
}
```

## Concatenating Strings and Characters

Strings and Characters can be concatenated using the `+` operator or `append()` method. For instance:

```swift
var stringOne = "hello"
let stringTwo = " world"
var welcomeToTheWorld = stringOne + stringTwo
```

## String Interpolation

String interpolation allows constructing a new String value from a mix of constants, variables, literals, and expressions. For example:

```swift
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
```

## Unicode

Swift's String and Character types are fully Unicode-compliant. Unicode enables representing characters from different languages in a standardized form.

## Accessing and Modifying Strings

Strings can be accessed and modified using indices and methods like `insert(_: at:)` and `remove(at:)`.

## Substrings

Substrings are part of an existing string, but they refer to the original string they were cut out from until converted.

## Comparing Strings

Strings can be compared for equality, prefix, and suffix using appropriate methods like `==`, `hasPrefix(_:)`, and `hasSuffix(_:)`.

## Unicode Representations of Strings

Strings can be represented in different Unicode forms such as UTF-8, UTF-16, and UTF-32.

### UTF-8
<img width="707" alt="image" src="https://github.com/leonardsangoroh/swiftProgramming/assets/61079370/394d9d3a-8d3b-4d30-87b4-0b8346556628">

### UTF-16
<img width="572" alt="image" src="https://github.com/leonardsangoroh/swiftProgramming/assets/61079370/be571c30-a360-4c96-bb72-b770e551ccac">

### UTF-32
<img width="488" alt="image" src="https://github.com/leonardsangoroh/swiftProgramming/assets/61079370/80068c1a-e00c-4dbd-a000-b6eefa3784d6">
