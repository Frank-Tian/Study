//:[目录](Table%20of%20Contents) | [前一节](@previous) | [后一节](@next)
//: ****
/*:
 ## Function Parameters and Return Values （函数参数和返回值）
 
 Function parameters and return values are extremely flexible in Swift. You can define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options.
 
 ### Functions Without Parameters （无参函数）
 
 Functions are not required to define input parameters. Here’s a function with no input parameters, which always returns the same String message whenever it is called:
 */

func sayHelloWorld() -> String {
    return "Hello world, 你好，世界"
}

print(sayHelloWorld())
// Hello world, 你好，世界

/*:
 The function definition still needs parentheses after the function’s name, even though it does not take any parameters. The function name is also followed by an empty pair of parentheses when the function is called.
 
 ### Functions With Multiple Parameters （多参数函数）
 
 Functions can have multiple input parameters, which are written within the function’s parentheses, separated by commas.
 
 This function takes a person’s name and whether they have already been greeted as input, and returns an appropriate greeting for that person:
 */

func greet(person: String) -> String {
    return "Hello, " + person + "!"
}
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Frank", alreadyGreeted: true))
// Hello again, Frank!

/*:
 ### Functions Without Return Values（无返回值函数）

 Functions are not required to define a return type. Here’s a version of the greet(person:) function, which prints its own String value rather than returning it:
 */

func greet2(person: String) {
    print("Hello, \(person) !")
}

greet2(person: "Tony")
// Hello, Tony !

/*:
 Because it does not need to return a value, the function’s definition does not include the return arrow (->) or a return type.
 
 - Note: Strictly speaking, this version of the greet(person:) function does still return a value, even though no return value is defined. Functions without a defined return type return a special value of type Void. This is simply an empty tuple, which is written as ().
 
 The return value of a function can be ignored when it is called:
 */

func funcHaveReturnValue(string: String) -> String {
    print("funcHaveReturnValue: \(string)")
    return string
}

func testFuncWithoutReturnValue(string: String) {
    let _ = funcHaveReturnValue(string: string)
}

print(funcHaveReturnValue(string: "I have a return value"))
// funcHaveReturnValue: I have a return value
// I have a return value

print(testFuncWithoutReturnValue(string: "I have a return value"))
// funcHaveReturnValue: I have a return value
// ()  |可见果真返回了一个空元组

/*:
 
 - Note:Return values can be ignored, but a function that says it will return a value must always do so. A function with a defined return type cannot allow control to fall out of the bottom of the function without returning a value, and attempting to do so will result in a compile-time error.
 
 ### Functions with Multiple Return Values（多返回值函数）
 
 You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.
 
 The example below defines a function called minMax(array:), which finds the smallest and largest numbers in an array of Int values:
 */

func minMax(array: [Int]) -> (min: Int, max: Int) {
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

let bounds = minMax(array: [10, 22, -8, 11, 209, 3, 71, 10])
print("min is \(bounds.min) and max is \(bounds.max)")
// min is -8 and max is 209

/*:
 #### Optional Tuple Return Types (可选的元组返回类型)

 If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.
 
 - Note: An optional tuple type such as (Int, Int)? is different from a tuple that contains optional types such as (Int?, Int?). With an optional tuple type, the entire tuple is optional, not just each individual value within the tuple.
 
 The minMax(array:) function above returns a tuple containing two Int values. However, the function does not perform any safety checks on the array it is passed. If the array argument contains an empty array, the minMax(array:) function, as defined above, will trigger a runtime error when attempting to access array[0].
 
 To handle an empty array safely, write the minMax(array:) function with an optional tuple return type and return a value of nil when the array is empty:
 
 To handle an empty array safely, write the minMax(array:) function with an optional tuple return type and return a value of nil when the array is empty:
 */

func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    
    // safety check
    if array.isEmpty {return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

/*:
 You can use optional binding to check whether this version of the minMax(array:) function returns an actual tuple value or nil:
 */

// Code Build Error：Value of optional type '(min: Int, max: Int)?' must be unwrapped to refer to member 'max' of wrapped base type '(min: Int, max: Int)'
// let bounds2 = minMax2(array: [8, 29, -8, 22, 120, 71, 223])
// print("min is \(bounds2.min) and max is \(bounds2.max)")

if let bounds = minMax2(array: [8, 29, -8, 22, 120, 71, 223]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// min is -8 and max is 223

/*:
 ### Functions With an Implicit Return（隐式返回函数）

 If the entire body of the function is a single expression, the function implicitly returns that expression. For example, both functions below have the same behavior:
 */

func sayHello(for person: String) -> String {
    "Hello, " + person + "!"
}

print(sayHello(for: "Tian"))
// Hello, Tian!

func sayHello2(for person: String) -> String {
    return "Hello, " + person + "!"
}

print(sayHello2(for: "Frank"))
// Hello, Frank!


//: ****
//: [前一节](@previous) | [后一节](@next)
