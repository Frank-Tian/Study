//:[目录](Table%20of%20Contents) | [前一节](@previous) | [后一节](@next)
//: ****
/*:
 ## Function Argument Labels and Parameter Names (函数实参参数标签和形式参数名)

 Each function parameter has both an argument label and a parameter name.
 
 The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.
 
 */

func someFunc(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}

someFunc(firstParameterName: 1, secondParameterName: 2)

/*:
 All parameters must have unique names. Although it’s possible for multiple parameters to have the same argument label, unique argument labels help make your code more readable.

 ### Specifying Argument Labels （具体参数标签）

 You write an argument label before the parameter name, separated by a space:
 */

func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
    // argumentLabel for argument tips
}

/*:
 Here’s a variation of the greet(person:) function that takes a person’s name and hometown and returns a greeting:
 */

func greet(person: String, from hometown: String) -> String {
    "Hello \(person)! Glad you could visit from \(hometown)."
}

print(greet(person: "Bill", from: "Beijing"))
// Hello Bill! Glad you could visit from Beijing.

/*:
 The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that is readable and clear in intent.
 
 ### Omitting Argument Labels (删除实参标签)
 
 If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.
*/

func someFunctionNoArgLabels(_ parameterName1: Int, parameterName2: Int) {
    // In the function body,parameterName1 and parameterName2
    // refer to the argument values for the first and second parameters.
}

someFunctionNoArgLabels(1, parameterName2: 2)

/*:
 If a parameter has an argument label, the argument must be labeled when you call the function.
 
 ### Default Parameter Values（默认参数值）

 You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type. If a default value is defined, you can omit that parameter when calling the function.
*/

func someFunctionWithDefaultParamValue(parameterWithoutDefault: Int, parameterWithDefault: Int = 100) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 100 inside the function body.
}

someFunctionWithDefaultParamValue(parameterWithoutDefault: 200, parameterWithDefault: 1) // parameterWithDefault = 1
someFunctionWithDefaultParamValue(parameterWithoutDefault: 300) // parameterWithDefault = 100

func someFunction2(defaultParameter: Int = 1, params2: Int) {
    // ...
    print("param1 : \(defaultParameter) , params2 : \(params2)")
}

someFunction2(params2: 10)
// param1 : 1 , params2 : 10



/*:
 Place parameters that don’t have default values at the beginning of a function’s parameter list, before the parameters that have default values. Parameters that don’t have default values are usually more important to the function’s meaning—writing them first makes it easier to recognize that the same function is being called, regardless of whether any default parameters are omitted.
 
 ### Variadic Parameters（可变参数）

 A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.

 The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type. For example, a variadic parameter with a name of numbers and a type of Double... is made available within the function’s body as a constant array called numbers of type [Double].
 */

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,45,4)
// 11
arithmeticMean(2,2.2,3.1,4.5,4.3)
// 3.22

arithmeticMean(1)
// 1
arithmeticMean()
// nan

/*:
 - Note:A function may have at most one variadic parameter.

 */

func someFunc11(param1: Int, nums: Double...) {
    print("param1 \(param1), nums count \(nums.count)")
}

someFunc11(param1: 100, nums: 1,2,32,4)
// "param1 100, nums count 4\n"

// error: only a single variadic parameter '...' is permitted
//func someFunc12(param1: Double..., nums: Double...) {
//    print("param1 \(param1), nums count \(nums.count)")
//}

/*:
 ### In-Out Parameters (进出参数😓，其实就是参数能够在函数内被改变)
 
 Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can’t change the value of a parameter by mistake. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

 You write an in-out parameter by placing the inout keyword right before a parameter’s type. An in-out parameter has a value that is passed in to the function, is modified by the function, and is passed back out of the function to replace the original value. For a detailed discussion of the behavior of in-out parameters and associated compiler optimizations, see In-Out Parameters.

 You can only pass a variable as the argument for an in-out parameter. You cannot pass a constant or a literal value as the argument, because constants and literals cannot be modified. You place an ampersand (&) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.

- Note:In-out parameters cannot have default values, and variadic parameters cannot be marked as inout.
 */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let t = a
    a = b
    b = t
}

var a = 1, b = 2
swapTwoInts(&a, &b)
print("a = \(a) , b = \(b)")
// a = 2 , b = 1

/*:
 - Note:In-out parameters are not the same as returning a value from a function. The swapTwoInts example above does not define a return type or return a value, but it still modifies the values of someInt and anotherInt. In-out parameters are an alternative way for a function to have an effect outside of the scope of its function body.
 */

//: ****
//: [前一节](@previous) | [后一节](@next)
 
