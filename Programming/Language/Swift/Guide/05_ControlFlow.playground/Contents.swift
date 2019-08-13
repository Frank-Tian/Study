import UIKit

// Control Flow
// 控制流

// For-In Loops
// 循环

let names = ["A", "B", "C"]
for name in names {
    print("Hello, \(name)")
}
//Hello, A
//Hello, B
//Hello, C

// You can also iterate over a dictionary to access its key-value pairs. Each item in the dictionary is returned as a (key, value) tuple when the dictionary is iterated,

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs

// You can also use for-in loops with numeric ranges.

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//1 times 5 is 5
//2 times 5 is 10
//3 times 5 is 15
//4 times 5 is 20
//5 times 5 is 25

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
    print(tickMark)
}

// Some users might want fewer tick marks in their UI.
// They could prefer one mark every 5 minutes instead. Use the stride(from:to:by:) function to skip the unwanted marks.
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

// Closed ranges are also available, by using stride(from:through:by:) instead:

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 1, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
    print(tickMark)
}

// While Loops
// while 循环

// A while loop starts by evaluating a single condition. If the condition is true, a set of statements is repeated until the condition becomes false.

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

//

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")

// Repeat-While

// The other variation of the while loop, known as the repeat-while loop,
// performs a single pass through the loop block first, before considering the loop’s condition. It then continues to repeat the loop until the condition is false.
var sayCount = 0
repeat {
    sayCount += 1
    print("nihao! \(sayCount)")
} while sayCount < 10

// Conditional Statements
// 条件语句

// It is often useful to execute different pieces of code based on certain conditions.

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// Prints "It's very cold. Consider wearing a scarf."

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// Prints "It's not that cold. Wear a t-shirt."

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}


// Switch

// A switch statement considers a value and compares it against several possible matching patterns.

// 与OC 的区别
// 1、需要有default，
// 2、不用有break
// 3、不会贯穿
// 4、可以case 多个e值
// 5、可以是非整数类型
// 6、可以间隔匹配(100...200)
// 7、可以支持元组
// 8、支持值绑定
// 9、支持 where clause to check for additional conditions
// 10、case 边界，可以多行

let someCharacter: Character = "z"
switch someCharacter {
    case "a":
        print("The first letter of the alphabet")
    case "z":
        print("The last letter of the alphabet")
    default:
        print("Some other character")
}
// Prints "The last letter of the alphabet"

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a":
    print("case can not be empty body")
    // Invalid, the case has an empty body
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}

let anotherCharacter1: Character = "a"
switch anotherCharacter1 {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"

// Interval Matching
// Values in switch cases can be checked for their inclusion in an interval. This example uses number intervals to provide a natural-language count for numbers of any size:

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."


// Tuples

// You can use tuples to test multiple values in the same switch statement.

let somePoint = (1, 1)
switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")
    case (_, 0):
        print("\(somePoint) is on the x-axis")
    case (0, _):
        print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"


// Value Bindings

// A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case. This behavior is known as value binding, because the values are bound to temporary constants or variables within the case’s body.

let anotherPoint = (2, 0)
switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"


// Where
// A switch case can use a where clause to check for additional conditions.

// The example below categorizes an (x, y) point on the following graph:

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"

// Multiple switch cases that share the same body can be combined by writing several patterns after case,
// with a comma between each of the patterns. If any of the patterns match, then the case is considered to match.
// The patterns can be written over multiple lines if the list is long. For example:

let someCharacter1: Character = "e"
switch someCharacter1 {
    case "a", "e", "i", "o", "u":
        print("\(someCharacter1) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
         "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter1) is a consonant")
    default:
        print("\(someCharacter1) is not a vowel or a consonant")
}
// Prints "e is a vowel


// Compound cases can also include value bindings.

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) from the origin")
    default:
        print("Not on an axis")
}
// Prints "On an axis, 9 from the origin"



// Control Transfer Statements
// 控制转换语句

// Control transfer statements change the order in which your code is executed,
// by transferring control from one piece of code to another.
// Swift has five control transfer statements:

// continue
// break
// fallthrough
// return
// throw

// Continue
// The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop.
// It says “I am done with the current loop iteration” without leaving the loop altogether.

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)
// Prints "grtmndsthnklk"


// Break
// The break statement ends execution of an entire control flow statement immediately.
// The break statement can be used inside a switch or loop statement when you want to
// terminate the execution of the switch or loop statement earlier than would otherwise be the case.
var puzzleOutput2 = ""
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        break
    }
    puzzleOutput2.append(character)
}
print(puzzleOutput2)
// Prints "gr"

// break in a Switch Statement
// When used inside a switch statement, break causes the switch statement to end its execution immediately
// and to transfer control to the code after the switch statement’s closing brace (}).

// This behavior can be used to match and ignore one or more cases in a switch statement.
// Because Swift’s switch statement is exhaustive and does not allow empty cases,
// it is sometimes necessary to deliberately match and ignore a case in order to make your intentions explicit.

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// Prints "The integer value of 三 is 3."

// This default case does not need to perform any action, and so it is written with a single break statement as its body.


// Fallthrough

// In Swift, switch statements don’t fall through the bottom of each case and into the next one.
// That is, the entire switch statement completes its execution as soon as the first matching case is completed.
// By contrast, C requires you to insert an explicit break statement at the end of every switch case to prevent fallthrough.
// Avoiding default fallthrough means that Swift switch statements are much more concise and predictable
// than their counterparts in C, and thus they avoid executing multiple switch cases by mistake.

// If you need C-style fallthrough behavior, you can opt in to this behavior on a case-by-case basis with
// the fallthrough keyword. The example below uses fallthrough to create a textual description of a number.

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."


// Labeled Statements
// 标签u语句

// In Swift, you can nest loops and conditional statements inside other loops and conditional statements
// to create complex control flow structures. However, loops and conditional statements can both use
// the break statement to end their execution prematurely.

let finalSquare1 = 25
var board1 = [Int](repeating: 0, count: finalSquare1 + 1)
board1[03] = +08; board1[06] = +11; board1[09] = +09; board1[10] = +02
board1[14] = -10; board1[19] = -11; board1[22] = -02; board1[24] = -08
var square1 = 0
var diceRoll1 = 0

gameLoop: while square1 != finalSquare1 {
    diceRoll1 += 1
    if diceRoll1 == 7 { diceRoll1 = 1 }
    switch square1 + diceRoll1 {
        case finalSquare1:
            // diceRoll will move us to the final square, so the game is over
            break gameLoop
        case let newSquare where newSquare > finalSquare1:
            // diceRoll will move us beyond the final square, so roll again
            continue gameLoop
        default:
            // this is a valid move, so find out its effect
            square1 += diceRoll1
            square1 += board1[square1]
    }
}
print("Game over!")

// Early Exit

// A guard statement, like an if statement, executes statements depending on the Boolean value of an expression.
// You use a guard statement to require that a condition must be true in order for the code after the
// guard statement to be executed. Unlike an if statement, a guard statement always has an else clause—the
// code inside the else clause is executed if the condition is not true.

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

// If the guard statement’s condition is met,
// code execution continues after the guard statement’s closing brace.
// Any variables or constants that were assigned values using an optional binding
// as part of the condition are available for the rest of the code block that the guard statement appears in.

// If that condition is not met, the code inside the else branch is executed.
// That branch must transfer control to exit the code block in which the guard statement appears.
// It can do this with a control transfer statement such as return, break, continue, or throw,
// or it can call a function or method that doesn’t return, such as fatalError(_:file:line:).

// Using a guard statement for requirements improves the readability of your code,
// compared to doing the same check with an if statement.
// It lets you write the code that’s typically executed without wrapping it in an else block,
// and it lets you keep the code that handles a violated requirement next to the requirement.


// Checking API Availability

// Swift has built-in support for checking API availability, which ensures that you don’t accidentally
// use APIs that are unavailable on a given deployment target.

// The compiler uses availability information in the SDK to verify that all of the APIs used in your
// code are available on the deployment target specified by your project.
// Swift reports an error at compile time if you try to use an API that isn’t available.

// You use an availability condition in an if or guard statement to conditionally execute a block of code,
// depending on whether the APIs you want to use are available at runtime.
// The compiler uses the information from the availability condition when
// it verifies that the APIs in that block of code are available.

if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
    print("ios version > 10")
} else {
    // Fall back to earlier iOS and macOS APIs
}

// The availability condition above specifies that in iOS, the body of the if statement executes only
// in iOS 10 and later; in macOS, only in macOS 10.12 and later. The last argument, *, is required
// and specifies that on any other platform, the body of the if executes on the minimum deployment target specified by your target.

// In its general form, the availability condition takes a list of platform names and versions.
// You use platform names such as iOS, macOS, watchOS, and tvOS—for the full list, see Declaration Attributes.
// In addition to specifying major version numbers like iOS 8 or macOS 10.10, you can specify minor versions numbers like iOS 11.2.6 and macOS 10.13.3.


