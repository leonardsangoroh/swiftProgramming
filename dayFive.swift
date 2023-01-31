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

//Why use funtions
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