import Cocoa

var str = "Hello, playground"

//Closures with Parameters
//a closure you pass into a function can also accept its own parameters.
//We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can go ahead and fill the () with the types of any parameters that your closure should accept.
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
travel { (place: String) in
    print("I'm going to \(place) in my car")
}

//Using closures as parameters when they accept parameters

// This is where the travel function is defined
func travel1(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

// Call site – this is where the "travel" is called

// This is trailing closure syntax
travel1 { (place: String) in
    print("I'm going to \(place) in my car")
}
print("====")

// Alterate approach – don't use trailing closure syntax
travel1(action: { (somewhere: String) in
    print("We went to \(somewhere) on our bicycle.")
})

//We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can replace that Void with any type of data to force the closure to return a value.
//the closure accepts a string and returns string here
func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

//Shorthand parameter names

//Swift knows the parameter to that closure must be a string, so we can remove it:

//travel { place -> String in
//    return "I'm going to \(place) in my car"
//}
//It also knows the closure must return a string, so we can remove that:

//travel { place in
//    return "I'm going to \(place) in my car"
//}
//As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too:
//travel { place in
//    "I'm going to \(place) in my car"
//}
//Rather than writing place in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.
func travel3(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel3 {
    "I'm going to \($0) in my car"
}

//Closures with multiple parameters
//This time our travel() function will require a closure that specifies where someone is traveling to, and the speed they are going. This means we need to use (String, Int) -> String for the parameter’s type:
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
//We’re going to call that using a trailing closure and shorthand closure parameter names. Because this accepts two parameters, we’ll be getting both $0 and $1:
travel {
    "I'm going to \($0) at \($1) miles per hour."
}

//Returning closures from functions
//In the same way that you can pass a closure to a function, you can get closures returned from a function too.
//The syntax for this is a bit confusing a first, because it uses -> twice: once to specify your function’s return value, and a second time to specify your closure’s return value.

//To try this out, we’re going to write a travel() function that accepts no parameters, but returns a closure. The closure that gets returned must be called with a string, and will return nothing.
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
//We can now call travel() to get back that closure, then call it as a function:
let result = travel()
result("London")
//It’s technically allowable – although really not recommended! – to call the return value from travel() directly:
let result2 = travel()("London")

//Capturing values
//If you use any external values inside your closure, Swift captures them – stores them alongside the closure, so they can be modified even if they don’t exist any more.
func travel4() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
//We can call travel() to get back the closure, then call that closure freely:
let result3 = travel4()
result3("London")
//Closure capturing happens if we create values in travel() that get used inside the closure. For example, we might want to track how often the returned closure is called:
func travel5() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
//Even though that counter variable was created inside travel(), it gets captured by the closure so it will still remain alive for that closure.
//So, if we call result("London") multiple times, the counter will go up and up:
let result4 = travel5()
result4("London")
result4("London")
result4("London")
result4("London")

//Closures Summary
//You can assign closures to variables, then call them later on.
//Closures can accept parameters and return values, like regular functions.
//You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.
//If the last parameter to your function is a closure, you can use trailing closure syntax.
//Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
//If you use external values inside your closures, they will be captured so the closure can refer to them later.
