import Cocoa

var str = "Hello, playground"

//Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.
let driving1 = {
    print("I'm driving in my car")
}
driving1()


//When you create closures, they don’t have a name or space to write any parameters. That doesn’t mean they can’t accept parameters, just that they do so in a different way: they are listed inside the open braces.
//
//To make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting.
let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}
driving2("London")

//Closures can also return values, and they are written similarly to parameters: you write them inside your closure, directly before the in keyword.
//
//To demonstrate this, we’re going to take our driving() closure and make it return its value rather than print it directly. Here’s the original:

//We want a closure that returns a string rather than printing the message directly, so we need to use -> String before in, then use return just like a normal function:
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)

//Closures as Parameters
//Because closures can be used just like strings and integers, you can pass them into functions.
let driving = {
    print("I'm driving in my car")
}
//If we wanted to pass that closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void. That means “accepts no parameters, and returns Void” – Swift’s way of saying “nothing”.
//
//So, we can write a travel() function that accepts different kinds of traveling actions, and prints a message before and after:
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)

//Trailing closure syntax
//If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.
func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel2() {
    print("I'm driving in my car")
}
