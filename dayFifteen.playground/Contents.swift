import UIKit

//Properties

//struct Person {
//    //Properties
//    var clothes: String
//    var shoes: String
//
//    func describe() {
//        print("I like wearing \(clothes) with \(shoes)")
//    }
//}
//
//let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
//let other = Person(clothes: "short skirts", shoes: "high heels")
//taylor.describe()
//other.describe()


//Property observers
//Code that runs when a property is about to be changed or has been changed
struct Person {
    var clothes:String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    
}

func updateUI(msg:String) {
    print(msg)
}

//Computed properties
struct Mtu {
    var age:Int
    
    var ageInDogYears: Int {
        //get {
            return age * 7
        //}
    }
}

//Static properties and methods
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"

    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)

// N/B: Since static methods belong to the struct itself and not the instanct/object of the struct, you can't use it to acces non-static properties from the struct

//Access Control
// public, Internal, File Private, Private
//Public: this means everyone can read and write the property.
//Private: this is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.
//File Private: this means that only Swift code in the same file as the type can read and write the property.
//Internal: this means only your Swift code can read and write the property. If you ship your code as a framework for others to use, they won’t be able to read the property.

//Polymorphism & typecasting

//Polymorhism
class Album {
    var name: String

    init(name: String) {
        self.name = name
    }

    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}


var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
}

//Typecasting - skipped this part of day 15 (will learn when necessary)

for album in allAlbums {
    print(album.getPerformance())

    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

//Closures
let message = "Button pressed"

Button("Press Me", action: {
    print(message)
})

//Trailing closures
let message = "Button pressed"

Button("Press Me") {
    print(message)
}

//A function can have multiple trailing closures if needed (common in swiftUI)
