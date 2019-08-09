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

