//:[目录](Table%20of%20Contents) | [前一节](@previous) | [后一节](@next)
//: ****
/*:
 ## Function Types (函数类型)

 Every function has a specific function type, made up of the parameter types and the return type of the function.
 */

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

/*:
 This example defines two simple mathematical functions called addTwoInts and multiplyTwoInts. These functions each take two Int values, and return an Int value, which is the result of performing an appropriate mathematical operation.

 The type of both of these functions is (Int, Int) -> Int. This can be read as:

 “A function that has two parameters, both of type Int, and that returns a value of type Int.”

 Here’s another example, for a function with no parameters or return value:
 */

func printHelloWorld() {
    print("hello, world")
}

// The type of this function is () -> Void, or “a function that has no parameters, and returns Void.”

/*:
 ### Using Function Types (使用函数类型)

 You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:
 */

var mathFunction: (Int, Int) -> Int = addTwoInts

/*:
 This can be read as:

 “Define a variable called mathFunction, which has a type of ‘a function that takes two Int values, and returns an Int value.’ Set this new variable to refer to the function called addTwoInts.”

 The addTwoInts(_:_:) function has the same type as the mathFunction variable, and so this assignment is allowed by Swift’s type-checker.

 You can now call the assigned function with the name mathFunction:
 */

print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"

/*:
 A different function with the same matching type can be assigned to the same variable, in the same way as for nonfunction types:
 */

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"

let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int

/*:
 ### Function Types as Parameter Types(将函数类型做为参数类型)
 
 You can use a function type such as (Int, Int) -> Int as a parameter type for another function. This enables you to leave some aspects of a function’s implementation for the function’s caller to provide when the function is called.

 Here’s an example to print the results of the math functions from above:
 */

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 4, 5)
// prints : Result 9

/*:
 ### Function Types as Return Types (将函数类型作为返回值类型)
 
 You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (->) of the returning function.
 
 The next example defines two simple functions called stepForward(_:) and stepBackward(_:). The stepForward(_:) function returns a value one more than its input value, and the stepBackward(_:) function returns a value one less than its input value. Both functions have a type of (Int) -> Int:
 */

func stepForward(_ input: Int) -> Int {
   return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

/*:
 Here’s a function called chooseStepFunction(backward:), whose return type is (Int) -> Int. The chooseStepFunction(backward:) function returns the stepForward(_:) function or the stepBackward(_:) function based on a Boolean parameter called backward:
*/

func chooseSetpFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward;
}

var currentValue = 3
let moveNearerToZero = chooseSetpFunction(backward: currentValue > 0)
print(moveNearerToZero(10))
// prints: 9, moveNearerToZero now refers to the stepBackward() function

// test more params
func testFunction(_ param1: Int, flag: Bool, params:Int...) -> (Int) -> Int {
    return flag ? stepBackward : stepForward;
}


/*:
 The example above determines whether a positive or negative step is needed to move a variable called currentValue progressively closer to zero. currentValue has an initial value of 3, which means that currentValue > 0 returns true, causing chooseStepFunction(backward:) to return the stepBackward(_:) function. A reference to the returned function is stored in a constant called moveNearerToZero.
 */

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!

//: ****
//: [前一节](@previous) | [后一节](@next)
