/*:
 ## Closures(闭包)
 
 Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

 闭包是可以在代码中传递和使用的独立功能块，Swift 中的 闭包有点类似C和OC中的blocks, 以及其他语言中的兰巴达表达式。

 Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables. Swift handles all of the memory management of capturing for you.
 
 闭包可以冲定义它们的上下文中捕获和存储任意变量和常量的引用，这被称为是 closing over 变量和常量，Swift 为逆处理捕获的所有内存管理。

 Global and nested functions, as introduced in Functions, are actually special cases of closures. Closures take one of three forms:

 在前面的 Functions 章节，我们见到了全局和嵌套的函数，它们实际上是闭包的特例，闭包采用以下三种方式：
 
 - Global functions are closures that have a name and do not capture any values.
 
 - Nested functions are closures that have a name and can capture values from their enclosing function.
 
 - Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.

 - 全局函数是具有名称但不捕获任何值的闭包
 
 - 嵌套函数是居右名称并且能够从它们闭合区捕获值的闭包。
 
 - 闭包表达式是轻量级语法来写的未命名的闭包，能够从它们周围的上下文中捕获值。
 
 Swift’s closure expressions have a clean, clear style, with optimizations that encourage brief, clutter-free syntax in common scenarios. These optimizations include:

 Swift 闭包表达式鼓励在通用场景下，使用更加简单的语法，因此做了简单和清楚的风格优化。主要优化包括：
 
 - Inferring parameter and return value types from context
 
 - Implicit returns from single-expression closures
 
 - Shorthand argument names
 
 - Trailing closure syntax
 
 - 从上下文中推断参数和返回值类型
 
 - 单表达式闭包的隐式返回
 
 - 简单的参数名称
 
 - 尾随闭包语法
 
 ### Closure Expressions（闭包表达式）

 Nested functions, as introduced in Nested Functions, are a convenient means of naming and defining self-contained blocks of code as part of a larger function. However, it is sometimes useful to write shorter versions of function-like constructs without a full declaration and name. This is particularly true when you work with functions or methods that take functions as one or more of their arguments.

 Closure expressions are a way to write inline closures in a brief, focused syntax. Closure expressions provide several syntax optimizations for writing closures in a shortened form without loss of clarity or intent. The closure expression examples below illustrate these optimizations by refining a single example of the sorted(by:) method over several iterations, each of which expresses the same functionality in a more succinct way.

 #### The Sorted Method（排序方法）
 
 The sorted(by:) method accepts a closure that takes two arguments of the same type as the array’s contents, and returns a Bool value to say whether the first value should appear before or after the second value once the values are sorted. The sorting closure needs to return true if the first value should appear before the second value, and false otherwise.
 
 This example is sorting an array of String values, and so the sorting closure needs to be a function of type (String, String) -> Bool.

 One way to provide the sorting closure is to write a normal function of the correct type, and to pass it in as an argument to the sorted(by:) method:

 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

func forward(_ s1: String, _ s2: String) -> Bool {
    return s2 > s1
}
var reversedNames1 = names.sorted(by: forward)
// reversedNames1 is equal to ["Alex", "Barry", "Chris", "Daniella", "Ewa"]

/*:
 However, this is a rather long-winded way to write what is essentially a single-expression function (a > b). In this example, it would be preferable to write the sorting closure inline, using closure expression syntax.
 
 但是，上面的写法是很冗长的实现，最好是使用内联的闭包表达式排序实现。
 
 #### Closure Expression Syntax （闭包表达式语法）
 
 Closure expression syntax has the following general form:

 闭包表达式语法的简单形式：
 
 { (parameters) -> return type in
     statements
 }

 The parameters in closure expression syntax can be in-out parameters, but they can’t have a default value. Variadic parameters can be used if you name the variadic parameter. Tuples can also be used as parameter types and return types.

 The example below shows a closure expression version of the backward(_:_:) function from above:

 */

var reversedNames2 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

print(reversedNames2)
// ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

/*:
 #### Inferring Type From Context(从上下文推断类型)

 Because the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns. The sorted(by:) method is being called on an array of strings, so its argument must be a function of type (String, String) -> Bool. This means that the (String, String) and Bool types do not need to be written as part of the closure expression’s definition. Because all of the types can be inferred, the return arrow (->) and the parentheses around the names of the parameters can also be omitted:
 */

// 我们可以不指定 s1, s2 的类型，可以推断为 String
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

/*:
 It is always possible to infer the parameter types and return type when passing a closure to a function or method as an inline closure expression. As a result, you never need to write an inline closure in its fullest form when the closure is used as a function or method argument.

 Nonetheless, you can still make the types explicit if you wish, and doing so is encouraged if it avoids ambiguity for readers of your code. In the case of the sorted(by:) method, the purpose of the closure is clear from the fact that sorting is taking place, and it is safe for a reader to assume that the closure is likely to be working with String values, because it is assisting with the sorting of an array of strings.

 #### Implicit Returns from Single-Expression Closures()
 
 Single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration, as in this version of the previous example:
 */

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

/*:
 #### Shorthand Argument Names (简单表达参数名)

 Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.

 If you use these shorthand argument names within your closure expression, you can omit the closure’s argument list from its definition, and the number and type of the shorthand argument names will be inferred from the expected function type. The in keyword can also be omitted, because the closure expression is made up entirely of its body:
 */

reversedNames = names.sorted(by: { $0 > $1 } )
// Here, $0 and $1 refer to the closure’s first and second String arguments.

/*:
 #### Operator Methods (操作符方法)
 
 There’s actually an even shorter way to write the closure expression above. Swift’s String type defines its string-specific implementation of the greater-than operator (>) as a method that has two parameters of type String, and returns a value of type Bool. This exactly matches the method type needed by the sorted(by:) method. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation:
 
 参考： [Operator Methods](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#ID42)
*/

reversedNames = names.sorted(by: >)

/*:
 ### Trailing Closures （尾部闭包）

 If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. A trailing closure is written after the function call’s parentheses, even though it is still an argument to the function. When you use the trailing closure syntax, you don’t write the argument label for the closure as part of the function call.

 */

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
    print("=====function 1=====")
    closure()
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
    print("=====closure 1=====")
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
    print("=====closure 2=====")
}

someFunctionThatTakesAClosure {
    print("=====closure 3=====")
}

func someFunctionThatTakesAClosure2(closure: () -> Void, _ b: String) {
    // function body goes here
    print("--- function 2 ---")
    closure()
}

someFunctionThatTakesAClosure2(closure: {
    print("--- closure a ---")
}, "param")

// 上面两中闭包的区别在于参数位置，不信看下面的方式

func someFunctionThatTakesAClosure3(_ b: String, closure: () -> Void) {
    // function body goes here
    print("--- function 3 ---")
    closure()
}

someFunctionThatTakesAClosure3("haha") {
    print("--- closure 3 ---")
}

/*:
 The string-sorting closure from the Closure Expression Syntax section above can be written outside of the sorted(by:) method’s parentheses as a trailing closure:

 If a closure expression is provided as the function or method’s only argument and you provide that expression as a trailing closure, you do not need to write a pair of parentheses () after the function or method’s name when you call the function:

 Trailing closures are most useful when the closure is sufficiently long that it is not possible to write it inline on a single line. As an example, Swift’s Array type has a map(_:) method which takes a closure expression as its single argument. The closure is called once for each item in the array, and returns an alternative mapped value (possibly of some other type) for that item. The nature of the mapping and the type of the returned value is left up to the closure to specify.

 */

// 根据闭包的语法定义，我们能够将一些尾部闭包写在方法的外面，进而做一些简化操作，示例如下：

reversedNames = names.sorted() {$0 > $1}

// 进一步简化

reversedNames = names.sorted {$0 > $1}

// case

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

/*:
 The code above creates a dictionary of mappings between the integer digits and English-language versions of their names. It also defines an array of integers, ready to be converted into strings.
 
 You can now use the numbers array to create an array of String values, by passing a closure expression to the array’s map(_:) method as a trailing closure:
 */
numbers.map { (number) -> String in
    
}

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]









