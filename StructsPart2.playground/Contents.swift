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

//Static Properties and Methods
//You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
let ed1 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize)

//Access control
//Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly, for example.
//We could create a Person struct that has an id property to store their social security number:
//Once that person has been created, we can make their id be private so you can’t read it from outside the struct – trying to write ed.id simply won’t work.
//Just use the private keyword
//Now only methods inside Person can read the id property. For example:
struct Person2 {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}
let ed2 = Person2(id: "12345")
//Another common option is public, which lets all other code use the property or method.

//Struct Summary
//You can create your own types using structures, which can have their own properties and methods.
//You can use stored properties or use computed properties to calculate values on the fly.
//If you want to change a property inside a method, you must mark it as mutating.
//Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
//Use the self constant to refer to the current instance of a struct inside a method.
//The lazy keyword tells Swift to create properties only when they are first used.
//You can share properties and methods across all instances of a struct using the static keyword.
//Access control lets you restrict what code can use properties and methods.
