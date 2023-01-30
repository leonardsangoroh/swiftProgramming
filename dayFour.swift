//Loops

//For Loops
let names = ["Lee", "Leonard", "Sangoroh"]

for name in names {
    print ("\(name) is a footballer")
}


//Using a for loop when output is not needed
let names = ["Lee", "Leonard", "Sangoroh"]

for _ in names {
    print("[CENSORED] is a secret agent!")
}

//output
/* 
[CENSORED] is a secret agent!
[CENSORED] is a secret agent!
[CENSORED] is a secret agent!
*/

//for loop vs while loop
/* 
for loops are used with finite sequences, e.g. no. of items
in an array while while loops can loop untile any arbitrary 
condition becomes false
*/

//while loop syntax

//program to display numbers from 1 to 5
var i = 1, n = 5

while(i<=n) {
    print(i)
    i += 1
}

//repeat loop
// the code runs at least once
let numbers = [1, 2, 3, 4, 5]
var random: [Int]

repeat {
    random = numbers.shuffled()
} while random == numbers

//exit a loop using 'break'
let scores = [1, 8, 4, 3, 0, 5, 2]
var count = 0

for score in scores {
    if score == 0 {
        break
    }

    count += 1
}

print ("You had \(count) scores before you got 0")


//swift labeled statements
// Simple application: finding safe combination
// the labeled statement assists in breaking from 3 loops once
let options = ["up", "down", "left", "right"]

let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

//When to use break & when to use continue
/* 
Use continue when you're done with the current run of the loop
but not the entire loop, it hence goes to the next itereation

Use break when breaking out of the loop completely
*/

//Why make an infinite loop? - did not find it useful
/* 
Examples when infinite loops are used in apps are;
- When checking for user input
- When running any code needed by a user
- When redrawing the screen
*/

//Summary
/* 
- Loops let us repeat code until a condition is false
- The most common loop is for, which assigns each item inside 
  the loop to a temporary constant
- If you don't need the temporary constant that for loops give
  you, use an uderscore instead do Swift can skip that work
- THere are while loops, which you provide with an explicit 
  condition to check
- Although they are similar to while loops, repeat loops always run
  the body of their loop at least once
- You can exit a single loop using break, but if you have nested
  loops you need to use break followed by whatever label you placed
  before your outer loop
- You can skip items in a loop using continue
- INfinite loops don't end until you ask them to, and are made usng
  while true, Make sure you have a condition somewhere to end you infinite
  loops
*/