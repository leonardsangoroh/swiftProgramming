// Variables

// creating a variable using 'var' makes it changeable
var favoriteShow = "Family guy"

favoriteShow = "Rick and Morty"

// Swift is type safe - data types are determined by swift

// Multi line strings

var lee = """
Name is Lee Leonard 
Currently Learning swift
Finally taking a single roadmap this year
"""

//Organize code without multi line strings
var leonard = """
    Name \
    is \
    Lee \
    Leonard. 

"""
print(lee)

//Doubles and Booleans

//Double - decimal numbers
var pi = 3.142

//Boolean
var truth = true

//String interpolation
var goals = 2

var result = "Manchester United \(goals)"

//Constants
let pi = 3.142

// Type annotations
/* Swift infers data types depending on the data
    a variable has been assigned. However, one can decide
    decide to explicitly declare the variable types.
*/
let album: String = "Be rich or die trying"
let year: Int = 2001
let height: Double = 1.78
let fiftyCent: Bool = true
