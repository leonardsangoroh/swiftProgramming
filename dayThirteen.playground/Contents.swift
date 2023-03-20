import UIKit

//Variables vary and constant remain constant
//Variable
var name = "Lee Leonard Sangoroh"
name = "Leonard Sangoroh"
//Constant
let pi = 3.142

//Types of data

//String
var jina:String
jina = "Lee Leonard"

//Integer
var age:Int
age = 21

//Float & Double (Float has a limited size while Double does not)
var latitude:Double
latitude = 45.4444444444444
var longitude:Float
longitude = -175.33333333

//Boolean
var stayOutLate:Bool
stayOutLate = true

//Operators
var a = 10
a = a + 1
a = a - 1
a = a*a

var b = 11
b += 1
b -= 1

b > 1
b >= 1
b <= 1

// == used to check for equality since = is used to assign variables
var names = "Lee"

names == "Lee"

name != "lee"

//String interpolation - combining variables and constants inside a string
"Your name is \(name)"

"Your name is " + name

"Your name is \(name), your age is \(age)"

//Arrays
var evenNumbers:[Int] = [2,4,6,8]

evenNumbers[0]

//Check type of array
type(of: evenNumbers)

//Set array to store more than one data type
var artist:[Any] = ["Khaligraph", "Otile Brown", 50]

//Dictionaries
var person = ["first":"Lee", "last":"Sangoroh", "month":"June"]
person["first"]

//Conditional statements
var action:String
var persons = "Hater"

if persons == "Hater" {
    action = "Hate"
} else if persons == "Player" {
    action = "Play"
} else {
    action = "Cruise"
}

var isAsult = true
var stayOutTooLate = true

if isAsult && stayOutLate {
    print("It is okay")
}

//Loops
//A loop that prints out multiples of 10
for i in 1...10 {
    print("\(i) x 10 is \(i*10)")
}

//If you don't need the index i in the loop
for _ in 1...5 {
    print("Five times")
}

//Half open operator
for _ in 1..<5 {
    print("Four times")
}

//Looping over arrays
var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    print("My favorite song is \(song)")
}

//Half open operator are useful when looping through arrays. Since arrays count from zero
var watu = ["players","haters","fakers"]
var vitendo = ["play","hate","fake"]

for i in 0..<watu.count {
    var str = "\(watu[i]) gonna"

    for _ in 1...3 {
        str += vitendo[i]
    }
}

//While loops
var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}

//continue key word
var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}

//Switch case
let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")

default:
    print("Have you done something new?")
}
