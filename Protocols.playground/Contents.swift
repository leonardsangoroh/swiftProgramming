import UIKit

// Protocols
/*
 a protocol defines a blueprint of methods, properties, and other requirements that suit a particular task
 the protocol can be adopted by a class, structure or enumeration to provide an actual implementation for those requirements
 
 in addition to specifyiing requirements that conforming types must implement, one can extend a protocol to implement some requirements or additional functionality that conforming types can take advantage of
 */


// Protocol syntax
protocol SomeProtocol {
    // protocol definition
}

/*custom types state that they conform to a protocol by placing protocol's name after the type's name, separated by a colon
 */
struct someStructure: SomeProtocol {
    
}

/*
 if a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma
 */
class SuperClass {
    
}
class someClass: SuperClass, SomeProtocol {
    
}

//NB: because protocols are types, begin their names with a capital letter to match the names of other types in Swift


// Property Requirements
/*
 a protocol can require any conforming type to provide an instance property or type property with a particular name and type
 a protocol also specifies whether each property must be gettable and settable
 */
protocol SomeOtherProtocol {
    var mustBeSettable: Int { get set}
    var doesNotNeedToBeSettable: Int { get}
}

/*
 always prefix type property requirements with the static keyword when you define them in a protocol
 */
protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
}

// example of a protocol with a single instance property requirement
protocol FullyNamed {
    var fullName: String { get }
}

/*
 below is a simple structure that adopts and conforms to the FullyNamed protocol
 it defines a structure called Person
 it states that it adopts FullyNamed protocol
 each instance of Person has a sinlge stored property called fullName
 meaning Person correctly conforms to the protocol
 */
struct Person: FullyNamed {
    var fullName: String
}
 
let lee = Person(fullName: "Lee Leonard Sangoroh")
lee.fullName

// more complex class that adopts and conforms FullyNamed protocol
/*
 this class implements the fullName property requirement as a computed read-only property for a starship
 each Starship class instance stores a mandatory name and an optional prefix. The fullName property uses the prefix value if it exists, and prepends it to the beginning of name to create a full name for the starship
 */
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + "" : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")


// Method requirements
/*
 protocols can require specific instance methods and type methods to be implemented by conforming types
 always prefix type method requirements with the static keyword when defining them in protocols
 */
protocol YAnotherProtocol {
    static func someTypeMethod()
}

// protocol with a single instance method requirement
protocol RandomNumberGenerator {
    func random() -> Double
}

/*
 an implementation of a class that adopts and conforms to the RandomNumberGenerator protocol
 the class implements a pseudorandom number generator algorithm known as a linear congruential generator
 */
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c  = 29573.0
    
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
                        .truncatingRemainder(dividingBy: m))
        return lastRandom/m
    }
}


// Mutating Method Requirements
/*
 it is sometimes necessary for a method to modify the instance it belongs to
 for instance methods on value types (that is, structures and enums) you place the mutating keyword before a method's 'func' keyword to indicate the method is allowed to modify the instance it belongs to and any properties of that instance
 */
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle() // lightSwitch is now equal to .on


// Initializer Requirements
/*
 protocols can require specific intializers by conforming types
 */
protocol SomeOtherOtherProtocol {
    init(someParameter: Int)
}

// class implementation of Protocol initializer requirements
/*
 the use of 'required' modifier ensures one provides an explicit or inherited implementation of the initializer reauirement on all subclasses of the conforming class, so that they also conform to the protocol
 */
class SomeOtherOtherClass: SomeOtherOtherProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

/*
 if a subclass overrides a designated initializer from a superclass, and also implements a matching initializer requirement from a protocol, mark the initializer implementation with both the required and override modifiers
 */
protocol ThisProtocol {
    init()
}


class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}


class SomeSubClass: SomeSuperClass, ThisProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}


// Failable Initializer Requirements - will learn this later after i go through classes and structs


// Protocols as Types - will learn this later after interacting with generic functions
/*
 protocols don't implement any functionality themselves
 regardless, one can use protocol as a type in their code
 */


//Delegation
/*
 delegation - a design pattern that enables a class of structure to hand off (or delegate) some of its responsibilities to an instance of another type
 this design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities , such that a conforming type (known as delegate) is guaranteed to provide the functionality that has been delegated
 delegation can be used to respond to a particular action, or retrieve data from an external source without needing to know the underlying type of that source
 
 the example below defines a dice game and a nested protocol for a delegate that tracks the games progress
 */

protocol Delegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didEndRound round: Int, winner: Int?)
    func gameDidEnd(_ game: DiceGame)
}

class DiceGame {
    
    let sides: Int
    let generator = LinearCongruentialGenerator()
    weak var delegate: Delegate?


    init(sides: Int) {
        self.sides = sides
    }


    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }


    func play(rounds: Int) {
        delegate?.gameDidStart(self)
        for round in 1...rounds {
            let player1 = roll()
            let player2 = roll()
            if player1 == player2 {
                delegate?.game(self, didEndRound: round, winner: nil)
            } else if player1 > player2 {
                delegate?.game(self, didEndRound: round, winner: 1)
            } else {
                delegate?.game(self, didEndRound: round, winner: 2)
            }
        }
        delegate?.gameDidEnd(self)
    }

}

// this example below shows a class called DiceGameTracker, which adopts Delegate protocol
class DiceGameTracker: Delegate {
    var playerScore1 = 0
    var playerScore2 = 0
    func gameDidStart(_ game: DiceGame) {
        print("Started a new game")
        playerScore1 = 0
        playerScore2 = 0
    }
    func game(_ game: DiceGame, didEndRound round: Int, winner: Int?) {
        switch winner {
            case 1:
                playerScore1 += 1
                print("Player 1 won round \(round)")
            case 2: playerScore2 += 1
                print("Player 2 won round \(round)")
            default:
                print("The round was a draw")
        }
    }
    func gameDidEnd(_ game: DiceGame) {
        if playerScore1 == playerScore2 {
            print("The game ended in a draw.")
        } else if playerScore1 > playerScore2 {
            print("Player 1 won!")
        } else {
            print("Player 2 won!")
        }
    }
}

let tracker = DiceGameTracker()
let game = DiceGame(sides: 6)
game.delegate = tracker
game.play(rounds: 3)


// Adding Protocol Conformance with an Extension
/*
 one can add an existing type to adopt and conform to a new protocol, even if you don't have access to the source code for the existing type
 */
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension DiceGame {
    var textualDescription: String {
        return "A \(sides) - sided dice"
    }
}


let gameTwo = DiceGame(sides: 6)
game.delegate = tracker
gameTwo.play(rounds: 3)
gameTwo.textualDescription
