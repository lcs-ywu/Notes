import Cocoa

var str = "Hello, playground"

struct Location {
    var x : Int
    var y : Int
}
//Spetember at LCS
var home = Location(x: 7, y: 10)
var school = home
//Where is home?
home.x
home.y
//Where is school?
school.x
school.y

//Christmas vocation time
home.x = 19
home.y = 10
//Where is home?
home.x
home.y
//Where is school?
school.x
school.y
//Changing the original instance, home, does nt change school
