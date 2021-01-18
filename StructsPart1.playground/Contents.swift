import Cocoa

var str = "Hello, playground"

//Create a Struct
//Swift lets you design your own types in two ways, of which the most common are called structures, or just structs. Structs can be given their own variables and constants, and their own functions, then created and used however you want.

//struct Sport {
//    var name: String
//}
//var tennis = Sport(name: "Tennis")
//print(tennis.name)
//tennis.name = "Lawn tennis"

//Computed Properties
//The name property that stores a String is called stored properties, \Swift has a different kind of property called a computed property – a property that runs code to figure out its value.

//We’re going to add another stored property to the Sport struct, then a computed property. Here’s how that looks:
struct Sport {
    var name: String  //stored property
    var isOlympicSport: Bool  //stored property

    var olympicStatus: String { //computed property
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)
