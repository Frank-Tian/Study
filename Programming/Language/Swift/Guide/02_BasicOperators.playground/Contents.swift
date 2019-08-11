import UIKit

let b = 10
var a = 5
a = b
print(a)

let (x, y) = (1, 2)
if x == y {
    print("x = y")
} else {
    print("x != y")
}

let helloworld = "hello " + "world"
print(helloworld)

let abc = 9 % 4
print(abc)

print(-9 % 4)

let three = 3
let minusThree = -three
print(minusThree)

var aaa = 111
aaa += 222
print(aaa)

let bbb = 1234
print(bbb)

// Comparison Operators

print(1 == 1) // true
print(2 != 1) // true
print(2 > 1)  // true
print(1 > 2)  // false
print(1 >= 1) // true
print(2 <= 1) // false

// Comparison operators are often used in conditional statements

let name = "world"
if name == "world" {
    print("Hello, world")
} else {
    print("hahahahahhhhhh.....")
}
// Hello, world

print((1, "zebra") < (2, "apple"))
// true because 1 is less than 2; "zebra" and "apple" are not compared
print((3, "apple") < (3, "bird"))
// true because 3 is equal to 3, and "apple" is less than "bird"
print((4, "dog") == (4, "dog"))
// true because 4 is equal to 4, and "dog" is equal to "dog"
print("-------")
print((true,1) == (true,1)) // true
print((false,1) == (true,1)) // false
print((1,"back") > (2,"cake")) // false

// Ternary Conditional Operator
// The ternary conditional operator is a special operator with three parts, which takes the form question ? answer1 : answer2.

let ccc = 123
let que = true
let a12 = 123 + (que ? 123 : 0)
print(a12)
// 246

// Nil-Coalescing Operator
//a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?   // default to nil
//userDefinedColorName = "green"
var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse) // red || green

// Range Operators
// Swift includes several range operators, which are shortcuts for expressing a range of values.

// closed range operator (a...b)

for index in 1...6 {
    print("\(index) times ")
    //    1 times
    //    2 times
    //    3 times
    //    4 times
    //    5 times
    //    6 times
}

// Half-Open Range Operator (a..<b)

let colors = ["Green","Red","Blue"]
let count = colors.count

for i in 0..<count {
    print("Color \(i+1) is called \(colors[i])")
    //    Color 1 is called Green
    //    Color 2 is called Red
    //    Color 3 is called Blue
}

// One-Sided Ranges [a...]  [...b]

for color in colors[1...] {
    print(color)
//    Red
//    Blue
}

for color in colors[...2] {
    print(color)
//    Green
//    Red
//    Blue
}

for color in colors[..<2] {
    print(color)
//    Green
//    Red
}

// One-sided ranges can be used in other contexts,not just in subscripts.
// You can’t iterate over a one-sided range that omits a first value,
// because it isn’t clear where iteration should begin.
// You can iterate over a one-sided range that omits its final value; however,
// because the range continues indefinitely, make sure you add an explicit end condition for the loop.
// You can also check whether a one-sided range contains a particular value, as shown in the code below.

let range = ...5
range.contains(10)  // false
range.contains(3)   // true
range.contains(-1)  // true

// Logical Operators
// Logical NOT (!a)
// Logical AND (a && b)
// Logical OR (a || b)

// NOT
let falseValue = false
if !falseValue {
    print("Not false")
}

// AND
let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome back")
} else {
    print("ACCESS DNEIED")
}

// OR

let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    print("Welcome back") // Welcome back
} else {
    print("ACCESS DENIED")
}

// Combining Logical Operators

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome back")   // Welcome back
} else {
    print("ACCESS DENIED")
}

// Explicit Parentheses

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
} // Prints "Welcome!"

