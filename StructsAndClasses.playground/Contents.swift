import Cocoa

var str = "Hello, playground"

//struct Location {
//    var x : Int
//    var y : Int
//}
//Change the structure to a class
class Location {
    var x : Int
    var y : Int
    
    init(x:Int, y:Int) { //Must add an initializer fo a class
        self.x = x
        self.y = y
    }
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
//For a structure, changing the original instance, home, does nt change school
//For a class, changing the original instance does change its copy
//school.y = 50
//school.x = 50
////Where is home?
//home.x
//home.y
////Where is school?
//school.x
//school.y
