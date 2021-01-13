import Cocoa

var str = "Hello, playground"

//HOW TO WRITE A FUNCTION
//Functions let us reuse codes and avoid repeated codes
//Swift functions start with the func keyword, then your function name, then open and close parentheses. All the body of your function – the code that should be run when the function is requested – is placed inside braces.
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}
printHelp()

//PARAMETERS
//We can send values into a function to change how it behave
//To make your own functions accept parameters, give each parameter a name, then a colon, then tell Swift the type of data it must be. All this goes inside the parentheses after your function name.
func square(number: Int) {
    print(number * number)
}
square(number: 4)

//RETURNING VALUES
//As well as receiving data, functions can also send back data. To do this, write a dash then a right angle bracket after your function’s parameter list, then tell Swift what kind of data will be returned.
//Inside your function, you use the return keyword to send a value back if you have one. Your function then immediately exits, sending back that value – no other code from that function will be run.
func squareWithReturn(number: Int) -> Int {
    return number * number
}
let result = squareWithReturn(number: 8)
print(result)
//How can you return two or more values from a function?
//Using a tuple, such as (name: String, age: Int)
//Using some sort of collection, such as an array or a dictionary.
func getUser() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

let user = getUser()
print(user.first)

//PARAMETER NAMES
//Swift lets us provide two names for each parameter: one to be used externally when calling the function, and one to be used internally inside the function. This is as simple as writing two names, separated by a space.
func sayHello(to name: String) {
    print("Hello, \(name)!")
}
//The parameter is called to name, which means externally it’s called to, but internally it’s called name. This gives variables a sensible name inside the function, but means calling the function reads naturally:
sayHello(to: "Taylor")

//OMITTING PARAMETER LABELS
//We can make our functions ignore any parameter names by using an underscore, _, for your external parameter name, like this:
func greet(_ person: String) {
    print("Hello, \(person)!")
}
greet("Taylor")

//DEFAULT PARAMETERS
//You can give your own parameters a default value just by writing an = after its type followed by the default you want to give it.
func greetWithDefault(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greetWithDefault("Taylor")
greetWithDefault("Taylor", nicely: false)

//VARIADIC FUNCTION
//Some functions are variadic, which is a fancy way of saying they accept any number of parameters of the same type.
//You can make any parameter variadic by writing ... after its type. So, an Int parameter is a single integer, whereas Int... is zero or more integers – potentially hundreds.
func variadicSquare(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
variadicSquare(numbers: 1, 2, 3, 4, 5)

//WRITING THROWING FUNCTIONS
//Sometimes functions fail because they have bad input, or because something went wrong internally. Swift lets us throw errors from functions by marking them as throws before their return type, then using the throw keyword when something goes wrong.
//First we need to define an enum that describes the errors we can throw. These must always be based on Swift’s existing Error type. We’re going to write a function that checks whether a password is good, so we’ll throw an error if the user tries an obvious password:

// Define an enumeration that lists types of password errors
enum PasswordError: Error {
    case obvious
    case needsUppercase
}

// Perform a security check on a given password
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    } else if password == password.lowercased() {
        // If the password was "secret" then it will equal "secret".lowercased()
        // If the password was "sEcREt" then it will not equal "sEcREt".lowercased()
        throw PasswordError.needsUppercase
    }

    return true
}

//Running throwing functions
// Try out a password to see if it is secure
do {
    try checkPassword("password")
    print("That password is good!")
} catch PasswordError.obvious {
    print("You can't use that password because it is too easy to guess.")
} catch PasswordError.needsUppercase {
    print("You can't use that password because it contains no uppercase characters.")
} catch {
    // NOTE: Not a great error message; we try to be specific
    print("You can't use that password.")
}

//INOUT PARAMETERS
//All parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.
func doubleInPlace(number: inout Int) {
    number *= 2
}
//To use that, you first need to make a variable integer – you can’t use constant integers with inout, because they might be changed. You also need to pass the parameter to doubleInPlace using an ampersand, &, before its name, which is an explicit recognition that you’re aware it is being used as inout.
var myNum = 10
doubleInPlace(number: &myNum)

//SUMMaRIZE
//Functions let us re-use code without repeating ourselves.
//Functions can accept parameters – just tell Swift the type of each parameter.
//Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
//You can use different names for parameters externally and internally, or omit the external name entirely.
//Parameters can have default values, which helps you write less code when specific values are common.
//Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
//Functions can throw errors, but you must call them using try and handle errors using catch.
//You can use inout to change variables inside a function, but it’s usually better to return a new value.
