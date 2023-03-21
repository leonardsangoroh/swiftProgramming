import UIKit

//Functions
func theBest () {
    print("I am the best")
}
theBest()

func favAlbum (name:String) {
    print("Favorite: \(name)")
}
favAlbum(name: "Damn")

func countLetters(myString str:String) {
    print("The word(s) has \(str.count) letters")
}

countLetters(myString: "Leonard")

func countLettersInString(_ str:String) {
    print("The word(s) has \(str.count) letters")
}

countLettersInString("Leonard")

//Functions that return values
func nameIsMine(name:String) -> Bool {
    if name == "Lee Leonard" {
        return true
    } else {
        return false
    }
}

//Optionals
//An optional value is one that might have a value, or might not
func getHatuerStatus(weather:String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status:String?
status = getHatuerStatus(weather: "sunny")
// OR
var currentStatus = getHatuerStatus(weather: "rainy")

//Unwrapping optionals
if let unwrappedStatus = status {
    print("\(unwrappedStatus)")
} else {
    print("Variable is empty")
}

func takeHaterStatus(status:String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHatuerStatus(weather: "sunny") {
    takeHaterStatus(status: haterStatus)
}

//Force unwrapping
func yearAlbumRelease(name:String) -> Int? {
    if name == "Damn" {
        return 2010
    }
    if name == "Swimming Pool" {
        return 2016
    }
    return nil
}

var year = yearAlbumRelease(name: "Damn")

if year == nil {
    print("There was an error")
} else {
    print("It was release in \(year!)")
}

//Implicitely unwrapped optionals
var name3: String! = "Leonard"

//Optional chaining
func albumReleased (year:Int) -> String? {
    switch year {
    case 2006: return "The greatest album"
    case 2008: return "Second greatest album"
    default: return nil
    }
}

let album = albumReleased(year: 2006)
print(album?.uppercased())

//Nil coalesching operator
let albumTwo = albumReleased(year: 2008) ?? "Unknown"
print(albumTwo)

//Enumerations

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind (speed: Int)
    case snow
}

//func getLoversWeather(weather: WeatherType) -> String? {
//    if weather == WeatherType.sun {
//        return nil
//    } else {
//        return "Love"
//    }
//}

func getLoversWeather(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
//    case .snow:
//        return "Yaaay"
    default:
        return "default"
    }
}
getLoversWeather(weather: WeatherType.sun)

//Structs

//Structs are just classes without inheritence
struct Person {
    var Clothes:String
    var Shoes:String
}

let Lee = Person(Clothes: "Sweatpants", Shoes: "Vans")
print(Lee.Shoes)

//Classes
class Mtu {
    var Clothes:String
    var Shoes:String
    
    init(clothes:String, shoes:String) {
        self.Clothes = clothes
        self.Shoes = shoes
    }
}

var LeeTwo = Mtu(clothes: "Sweatpants", shoes: "Slippers")

//Inheritence
//Read on classes from its respective day it was taught
//class HeavyMetalSinger:Mtu {
//    var noiseLevel:Int
//
//    init(clothes:String, shoes:String, noiseLevel:Int) {
//        self.noiseLevel = noiseLevel
//        super.init(clothes: clothes, shoes: shoes)
//    }
//
//    func sing() {
//        print("La la la la")
//    }
//}



//Objective C - if you want to have dome part of Apple's OS call your Swift class's methods, you need to mark it with a special attribute @objc
@objcMembers class HeavyMetalSinger:Mtu {
    var noiseLevel:Int
    
    init(clothes:String, shoes:String, noiseLevel:Int) {
        self.noiseLevel = noiseLevel
        super.init(clothes: clothes, shoes: shoes)
    }
    
    @objc func sing() {
        print("La la la la")
    }
}
