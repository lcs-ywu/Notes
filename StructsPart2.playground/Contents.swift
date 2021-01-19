import Cocoa

var str = "Hello, playground"

//Initializer
//Initializers are special methods that provide different ways to create your struct. All structs come with one by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct.
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user = User()
user.username = "twostraws"

//Referring to the current instance
//Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used. This self value is particularly useful when you create initializers that have the same parameter names as your property.
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

//Lazy properties
//As a performance optimization, Swift lets you create some properties only when they are needed.
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
struct Person1 {
    var name: String
    lazy var familyTree = FamilyTree() //If we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed

    init(name: String) {
        self.name = name
    }
}

var ed = Person1(name: "Ed")
ed.familyTree
