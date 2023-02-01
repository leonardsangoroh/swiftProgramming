//Functions

func printHelp() {
    let message = """
    Welcome to this application!

    Run it inside a dir of images and
    it will resize them into thumbnails
    """

    print(message)
}

printHelp()

//Why use functions
/* 
- When using a functionality in many places
- When breaking up code into small digestable ones
- In swift, one can combine small functions into one big one
*/

//Accepting parameters
func square (num: Int) {
    print(num*num)
}

square(num: 8)

//Returning values
func squareReturn (num: Int) -> Int {
    return num*num
}

let result = squareReturn(num: 8)
print(result)

//What's the difference btw a statement and an expression

//Return 2 > values from a function
// We can use a tuple or a collection e.g. array or dictionary

//With array
func getUserArray() -> [String] {
    ["Taylor", "Swift"]
}

let userOne = getUserArray()
print(user[0])

//with dictionary
func getUserDic() -> [String: String] {
    ["first": "Lee", "last": "Swift"]
}

let userTwo = getUserDic()
print(userTwo["first"])

//with tuple
func getUserTup() -> (first: String, last: String) {
    (first: "Lee", last: "Leonard")
}

let userThree = getUserTup()
print(userThree.first)

/* 

- Our data must be returned first name first and last name second.
- If we insert a middle name it will not affect the position of other values.
- We can’t make case-sensitive mistakes while reading values.
- There's no way we won’t get back a first name or last name – if someone only uses one name then we’ll get back an empty string.
- There is no optionality.

*/

//Parameter labels