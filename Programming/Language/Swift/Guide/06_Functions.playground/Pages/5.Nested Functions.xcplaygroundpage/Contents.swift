//:[目录](Table%20of%20Contents) | [前一节](@previous)
//: ****
/*:
 ## Nested Functions

 All of the functions you have encountered so far in this chapter have been examples of global functions, which are defined at a global scope. You can also define functions inside the bodies of other functions, known as nested functions.
 
 Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.

 You can rewrite the chooseStepFunction(backward:) example above to use and return nested functions:

 */

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!

// Test

func testFunction(_ a: Int, _ b: Int, flag: Int) -> Int {
    
    func min(_ a1: Int, _ a2: Int) -> Int {
        return a1 > a2 ? a2 : a1;
    }
    
    func max(_ a1: Int, _ a2: Int) -> Int {
        return a1 > a2 ? a1 : a2;
    }
    
    if flag == 1 {
        return min(a, b)
    } else {
        return max(a, b)
    }
}

let min = testFunction(10, 100, flag: 1) // 10
let max = testFunction(10, 100, flag: 0) // 100

//: ****
//: [前一节](@previous) 
