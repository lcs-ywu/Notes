import Cocoa

var str = "Hello, playground"

//DAY 1

//1. Variables and Constants
var name = "Tim McGraw"
name = "Romeo"

let name1 = "Tim McGraw" //Cannot be changed
//variable and constant names must be unique in your code. You'll get an error if you try to use the same variable name twice, like this:

//2. Types of Data
//String
var name2: String //type annotations
//var name : String is are Wrong!
name2 = "Tim McGraw"
//Int
var age: Int
age = 25
//Float and Double
var latitude: Double //Double has the highest accuracy.
latitude = 36.166667
var longitude: Float
longitude = -86.783333
//Boolean
var stayOutTooLate: Bool
stayOutTooLate = true //use camel case
var nothingInBrain: Bool
nothingInBrain = true
var missABeat: Bool
missABeat = false
//Using type annotations wisely
var name4: String = "Tim McGraw"

//3. Operators
//+ to add, - to subtract, * to multiply, / to divide, = to assign value
var a = 10
a = a + 1
a = a - 1
a = a * a
//+= is an operator that means "add then assign to." In our case it means "take the current value of b, add 10 to it, then put the result back into b." As you might imagine, -= does the same but subtracts rather than adds
var b = 10
b += 10
b -= 10
//When it comes to strings, + will join them together.
var name5 = "Tim McGraw"
var name6 = "Romeo"
var both = name5 + " and " + name6
//Comparison operators
//That shows off greater than (>), greater than or equal (>=), and less than (<)
var d = 1.1
var e = 2.2
var f = d + e
f > 3
f >= 3
f > 4
f < 4
//If you want to check for equality, you can't use = because it already has a meaning: it's used to give a variable a value. So, Swift has an alternative in the form of ==, meaning "is equal to.
var stayOutTooLate1 = true //not operator: !, != not equal
stayOutTooLate1
!stayOutTooLate1

//4. String Interpolation
"Your name is " + name5 //+
"You are \(age) years old. In another \(age) years you will be \(age * 2)."//\()

//5. Arrays

//6. Dictionaries
//Dictionaries are another common type of collection, but they differ from arrays because they let you access values based on a key you specify.
var person = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]

person["middle"]
person["month"]

//7. Conditional statements
var action: String
var person1 = "hater"
//A "block" of code is just a chunk of code marked with an open brace – { – at its start and a close brace – } – at its end
if person1 == "hater" {
    action = "hate"
} else if person1 == "player" {
    action = "play"
} else {
    action = "cruise"
}
//Evaluating multiple conditions
var action1: String
var stayOutTooLate2 = true
var nothingInBrain1 = true

if stayOutTooLate2 && nothingInBrain1 { //and operator: &&
    action1 = "cruise"
}
if !stayOutTooLate2 && !nothingInBrain1 {
    action1 = "cruise"
}
//8. Loops

//9. Switch case


//DAY 2

//Functions

//Optionals
//we wanted to tell Swift that this function might return a value or it might not
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil //In Swift, this "no value" has a special name: nil
    } else {
        return "Hate"
    }
}
var status: String? //in case the function returns nothing
status = getHaterStatus(weather: "rainy")

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}// These if let statements check and unwrap in one succinct line of code, which makes them very common
var items = ["James", "John", "Sally"]
func position(of string: String, in array: [String]) -> Int {
    for i in 0 ..< array.count {
        if array[i] == string {
            return i
        }
    }

    return 0
}
let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items) //not found
//Force unwrapping optionals
func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return nil
}

var year = yearAlbumReleased(name: "Red")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")//Note the exclamation mark: it means "I'm certain this contains a value, so force unwrap it now."
}
//Implicitly unwrapped optionals
//A regular variable must contain a value. Example: String must contain a string, even if that string is empty, i.e. "". It cannot be nil.
//An optional variable might contain a value, or might not. It must be unwrapped before it is used. Example: String? might contain a string, or it might contain nil. The only way to find out is to unwrap it.
//An implicitly unwrapped optional might contain a value, or might not. But it does not need to be unwrapped before it is used. Swift won't check for you, so you need to be extra careful. Example: String! might contain a string, or it might contain nil

//Optional chaining
//optional chaining lets you run code only if your optional has a value.
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}
//Note that there's a question mark in there, which is the optional chaining: everything after the question mark will only be run if everything before the question mark has a value
let album = albumReleased(year: 2006)?.uppercased()
print("The album is \(album)")
//Your optional chains can be as long as you need
//Swift will check them from left to right until it finds nil, at which point it stops.
//The nil coalescing operator
//If A is optional and has a value, it gets used (we have a value.) If A is present and has no value, B gets used (so we still have a value)
let album1 = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album1)")
//That double question mark is the nil coalescing operator, and in this situation it means "if albumReleased() returned a value then put it into the album variable, but if albumReleased() returned nil then use 'unknown' instead."

//Enumerations
//Enumerations – usually just called "enum" and pronounced "ee-num" - are a way for you to define your own kind of value in Swift.
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    if weather == .sun {
        return nil
    } else {
        return "Hate"
    }
}
getHaterStatus(weather: .cloud)

func getHaterStatus1(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
    case .snow:
        return "hate hate hate"
    }
}
//Enums with additional values
enum WeatherType1 {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}
func getHaterStatus2(weather: WeatherType1) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getHaterStatus2(weather: WeatherType1.wind(speed: 5))
//Swift evaluates switch/case from top to bottom, and stops as soon as it finds a match. This means that if case .cloud, .wind: appears before case .wind(let speed) where speed < 10: then it will be executed instead – and the output changes.
//Swift’s optionals are actually implemented using enums with associated values. There are two cases: none, and some, with some having whatever value is inside the optional.

//Structs

//Classes
