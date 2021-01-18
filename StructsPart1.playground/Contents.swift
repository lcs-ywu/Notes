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

//Property observers
//Property observers let you run code before or after any property changes.
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
//We can now create an instance of that struct and adjust its progress over time:
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
//What we want to happen is for Swift to print a message every time amount changes, and we can use a didSet property observer for that. This will run some code every time amount changes:
//You can also use willSet to take action before a property changes, but that is rarely used.

//Methods
//Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods, but they still use the same func keyword.
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()
//The only real difference is that methods belong to a type, such as structs, enums, and classes, whereas functions do not

//Mutating Methods
//If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the struct is constant, so all its properties are also constant regardless of how they were created.
//Swift won’t let you write methods that change properties unless you specifically request it.
//When you want to change a property inside a method, you need to mark it using the mutating keyword, like this:
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous()
