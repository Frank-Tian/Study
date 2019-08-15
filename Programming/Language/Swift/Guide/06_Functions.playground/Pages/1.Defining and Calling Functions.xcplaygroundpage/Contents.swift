//:[目录](Table%20of%20Contents) | [前一节](@previous) | [后一节](@next)
/*:
 ****
 ## Defining and Calling Functions
 ****
 When you define a function, you can optionally define one or more named, typed values that the function takes as input, known as parameters. You can also optionally define a type of value that the function will pass back as output when it is done, known as its return type.
 
 Every function has a function name, which describes the task that the function performs. To use a function, you “call” that function with its name and pass it input values (known as arguments) that match the types of the function’s parameters. A function’s arguments must always be provided in the same order as the function’s parameter list.
 
 The function in the example below is called greet(person:), because that’s what it does—it takes a person’s name as input and returns a greeting for that person. To accomplish this, you define one input parameter—a String value called person—and a return type of String, which will contain a greeting for that person:
 */

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Frank.Tian"))
// Hello, Frank.Tian!

print(greet(person: "Jack.Ma"))
// Hello, Jack.Ma!

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain(person: "Tony.Ma"))
// Hello again, Tony.Ma!

//: ****
//: [前一节](@previous) | [后一节](@next)
