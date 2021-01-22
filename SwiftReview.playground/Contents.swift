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

//7. Conditional statements

//8. Loops

//9. Switch case


//DAY 2

//Functions

//Optionals

//Optional chaining

//Enumerations

//Structs

//Classes
