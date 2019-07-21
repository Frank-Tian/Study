import UIKit

/**
 Swift is a new programming language for iOS macOS.....
 many parts of Swift will be familar from your experience of developing in C and OC
 
 Swift provides its own versions of all fundamental C and Objective-C types
 including Int for integers, Double and Float for floating-point values,
 Bool for Boolean values, and String for textual data.
 
 Like C, Swift uses variables to store and refer to values by an identifying name.
 Swift also makes extensive use of variables whose values can’t be changed.
 These are known as constants, and are much more powerful than constants in C.
 Constants are used throughout Swift to make code safer and clearer in intent
 when you work with values that don’t need to change.

 In addition to familiar types, Swift introduces advanced types not found in Objective-C,such as tuples.
 Tuples(元组) enable you to create and pass around groupings of values.
 You can use a tuple to return multiple values from a function as a single compound value.
 
 Swift also introduces optional types（可选类型）, which handle the absence of a value.
 Optionals say either “there is a value, and it equals x” or “there isn’t a value at all”.
 Using optionals is similar to using nil with pointers in Objective-C, but they work for any type, not just classes.
 Not only are optionals safer and more expressive than nil pointers in Objective-C,
 they’re at the heart of many of Swift’s most powerful features.
 
 Swift is a type-safe language（类型安全的语言）, which means the language helps you to be clear about the types of values your code can work with.
 If part of your code requires a String, type safety prevents you from passing it an Int by mistake.
 Likewise, type safety prevents you from accidentally passing an optional String to a piece of code that requires a non-optional String.
 Type safety helps you catch and fix errors as early as possible in the development process.
 */

//Declaring Constants and Variables (声明变量、常量)

let constantValue = 3.1415926
var variableValue = 10
var a = 10, b = 20.0, c = "c", d = Int()

// If a stored value in your code won’t change, always declare it as a constant with the let keyword.
// Use variables only for storing values that need to be able to change.

// Type Annotations

var welcomeMessage: String
welcomeMessage = "Hello world"
// Variable 'welcomeMessage' used before being initialized
print(welcomeMessage)

// We can define multiple releated variables of the same type on a single line,
// separated by commas, with a single type annotation after the final variable name.

var red, green, blue: Double

/**
 It’s rare that you need to write type annotations in practice.
 If you provide an initial value for a constant or variable at the point that it’s defined,
 Swift can almost always infer the type to be used for that constant or variable, as described in Type Safety and Type Inference.
 In the welcomeMessage example above, no initial value is provided,
 and so the type of the welcomeMessage variable is specified with
 a type annotation rather than being inferred from an initial value.(类型推断)
 */

// Naming Constants and Variables （常量和变量命名）

/**
 Constant and variables names can contain almost any character, including Unicode characters
 Constant and variable names can't contain whitespace characters, mathematical symbols, arrows,
 private-use Unicode scalar values, or line- and box-drawing characters.
 Nor can they begin with a number, although numbers may be include elsewhere within the name.
 */

let π = 3.14159
let 你好 = "你好世界"
let 🐩🐂 = "狗|牛"
print(π)
print(你好)
print(🐩🐂)

// You can change the value of an existing variable to another value of a compatible type.

var friendlyWelcome = "Hello~"
print(friendlyWelcome)  // Hello~
friendlyWelcome = "Bonjour!"
print(friendlyWelcome) // Bonjour!

let languageName = "Swift"
// languageName = "Swift++"  //Cannot assign to value: 'languageName' is a 'let' constant

// Printing Constants and Variables （打印常量和变量）

print(friendlyWelcome)
// The print(_: separator: terminator:)

print("The current value of friendWelcome is \(friendlyWelcome)")
// The current value of friendWelcome is Bonjour!

// Comments （注释）

// Comments in Swift are very similar to comments in C. Single-line comments begin with two forward-slashes

/* This is also a comment
but is written over multiple lines. */

// Unlike multiline comments in C, multiline comments in Swift can be nested inside other multiline comments.
// You write nested comments by starting a multiline comment block and then starting a second multiline comment
// within the first block. The second block is then closed, followed by the first block

/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */

// Nested multiline comments enable you to comment out large blocks of code quickly and easily, even if the code already contains multiline comments.

// Semicolons （分号）

//let cat = "🐱" print(cat) // error: consecutive statements on a line must be separated by ';'
let cat = "🐱"; print(cat) // 🐱

// Integers （整数）

/*
 Integers are whole numbers with no fractional component, such as 42 and -23.
 Integers are either signed (positive, zero, or negative) or unsigned (positive or zero).
 
 Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms.
 These integers follow a naming convention similar to C,
 in that an 8-bit unsigned integer is of type UInt8, and a 32-bit signed integer is of type Int32.
 Like all types in Swift, these integer types have capitalized names.
 */

// Integer Bounds （整数范围）

let minInt8 = UInt8.min
let maxInt8 = UInt8.max
print(minInt8)//0
print(maxInt8)//255

// In most cases, you don’t need to pick a specific size of integer to use in your code.
// Swift provides an additional integer type, Int,
// which has the same size as the current platform’s native word size:
// On a 32-bit platform, Int is the same size as Int32.
// On a 64-bit platform, Int is the same size as Int64.

// Unless you need to work with a specific size of integer, always use Int for integer values in your code.
// This aids code consistency and interoperability.
// Even on 32-bit platforms, Int can store any value between -2,147,483,648 and 2,147,483,647, and is large enough for many integer ranges.

print(Int.max)      // 64bit: 9223372036854775807
print(Int.min)      // 64bit: -9223372036854775808
print(Int64.max)    // 9223372036854775807
print(Int64.min)    // -9223372036854775808
print(Int32.max)    // 2147483647
print(Int32.min)    // -2147483648

// UInt
// Swift also provides an unsigned integer type, UInt,
// which has the same size as the current platform’s native word size:
// On a 32-bit platform, UInt is the same size as UInt32.
// On a 64-bit platform, UInt is the same size as UInt64.

print(UInt.max)   // 64bit: 18446744073709551615
print(UInt.min)   // 64bit: 0
print(UInt64.max) // 18446744073709551615
print(UInt64.min) // 0
print(UInt32.max) // 4294967295
print(UInt32.min) // 0

// Floating-Point Numbers
// Floating-point types can represent a much wider range of values than integer types,
// and can store numbers that are much larger or smaller than can be stored in an Int.
// Swift provides two signed floating-point number types:
// Double represents a 64-bit floating-point number.
// Float represents a 32-bit floating-point number.

//print(FLT_MAX)//deprecated
print(Float.greatestFiniteMagnitude)    // 3.4028235e+38
//print(FLT_MIN)//deprecated
print(Float.leastNormalMagnitude)       // 1.1754944e-38

//print(DBL_MAX)//deprecated
print(Double.greatestFiniteMagnitude) // 1.7976931348623157e+308
//print(DBL_MIN)//deprecated
print(Double.leastNormalMagnitude)  // 2.2250738585072014e-308


// Type Safety and Type inference （类型安全与类型推断）
/*
 Swift is a type-safe language.
 A type safe language encourages you to be clear about the types of values your code can work with.
 If part of your code requires a String, you can’t pass it an Int by mistake.
 
 Because Swift is type safe, it performs type checks when compiling your code and flags any mismatched types as errors.
 This enables you to catch and fix errors as early as possible in the development process.
 
 Type-checking helps you avoid errors when you’re working with different types of values.
 However, this doesn’t mean that you have to specify the type of every constant and variable that you declare.
 If you don’t specify the type of value you need, Swift uses type inference to work out the appropriate type.
 Type inference enables a compiler to deduce the type of a particular expression automatically when
 it compiles your code, simply by examining the values you provide.

 Because of type inference,
 Swift requires far fewer type declarations than languages such as C or Objective-C.
 Constants and variables are still explicitly typed,
 but much of the work of specifying their type is done for you.
 
 Type inference is particularly useful when you declare a constant or variable with an initial value.
 This is often done by assigning a literal value (or literal) to the constant or variable at the point that you declare it.
 (A literal value is a value that appears directly in your source code, such as 42 and 3.14159 in the examples below.)

 For example, if you assign a literal value of 42 to a new constant without saying what type it is,
 Swift infers that you want the constant to be an Int,
 because you have initialized it with a number that looks like an integer:
 */

let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int

// Likewise, if you don’t specify a type for a floating-point literal,
// Swift infers that you want to create a Double:

let pi = 3.14159
// pi is inferred to be of type Double

// !!! Swift always chooses Double (rather than Float) when inferring the type of floating-point numbers.
// If you combine integer and floating-point literals in an expression, a type of Double will be inferred from the context:

let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double
print("show anotherPi type :\(type(of: anotherPi))") // show anotherPi type :Double
// The literal value of 3 has no explicit type in and of itself,
// and so an appropriate output type of Double is inferred from the presence of a floating-point literal as part of the addition.

// Numeric Literals （数字进制）
// Integer literals can be written as:
// 十进制：A decimal number, with no prefix
// 二进制0b：A binary number, with a 0b prefix
// 八进制0o：An octal number, with a 0o prefix
// 十六进制0x：A hexadecimal number, with a 0x prefix

// All of these integer literals have a decimal value of 17:

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

print("decimal:\(decimalInteger), binary:\(binaryInteger), octal:\(octalInteger), hex:\(hexadecimalInteger)")
// decimal:17, binary:17, octal:17, hex:17

// Floating-point literals can be decimal (with no prefix), or hexadecimal (with a 0x prefix).
// They must always have a number (or hexadecimal number) on both sides of the decimal point.
// Decimal floats can also have an optional exponent, indicated by an uppercase or lowercase e; ]
// hexadecimal floats must have an exponent, indicated by an uppercase or lowercase p.

// For decimal numbers with an exponent of exp, the base number is multiplied by 10exp:
// 1.25e2 means 1.25x10^2 , or 125.0
// 1.25e-2 means 1.25 x 10-2, or 0.0125.

print(1.25e2)   // 125.0
print(1.25e-2)  // 0.0125

// For hexadecimal numbers
// 0xFp2 means 15 x 2^2, or 60.0.
// 0xFp-2 means 15 x 2^-2, or 3.75.

print(0xFp2)    // 60.0, F=15, 15x(2x2) = 15 x 4 = 60
print(0xFp-2)   // 3.75, F=15, 15x(1/2x2) = 15 x 1/4 = 15/4 = 3 + 3/4 = 3.75
print(0x1p2)    // 4.0,  1 x (2x2) = 4
print(0x6p-2)   // 1.5,  6 x (1/2x2) = 1.5

// All of these floating-point literals have a decimal value of 12.1875:

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
print(exponentDouble)       // 12.1875
print(hexadecimalDouble)    // 12.1875 , 12.3

// Numeric literals can contain extra formatting to make them easier to read.
// Both integers and floats can be padded with extra zeros and can contain underscores to help with readability.
// Neither type of formatting affects the underlying value of the literal:

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

print(paddedDouble)         // 123.456
print(oneMillion)           // 1000000
print(justOverOneMillion)   // 1000000.0000001

// _ 下划线分割会别忽略，没有任何作用，输出内容一样
print(10000_0000_0000)      // 1000000000000
print(100_0000_000_000)     // 1000000000000
print(100000_000_0000)      // 1000000000000

// Numeric Type Conversion (进制类型转换)
// Use the Int type for all general-purpose integer constants and variables in your code, even if they’re known to be nonnegative.
// Using the default integer type in everyday situations means that integer constants and variables
// are immediately interoperable in your code and will match the inferred type for integer literal values.

// Use other integer types only when they’re specifically needed for the task at hand,
// because of explicitly sized data from an external source, or for performance, memory usage,
// or other necessary optimization. Using explicitly sized types in these situations helps to catch
// any accidental value overflows and implicitly documents the nature of the data being used.

// Integer Conversion （整数转换）

// let cannotBeNegative: UInt8 = -1
// Build Error: Negative integer '-1' overflows when stored into unsigned type 'UInt8'
// let tooBig: Int8 = Int8.max + 1
// Build Error: Arithmetic operation '127 + 1' (on type 'Int8') results in an overflow

/*
 Because each numeric type can store a different range of values, you must opt in to numeric type conversion on a case-by-case basis.
 This opt-in approach prevents hidden conversion errors and helps make type conversion intentions explicit in your code.

 To convert one specific number type to another, you initialize a new number of the desired type with the existing value.
 In the example below, the constant twoThousand is of type UInt16, whereas the constant one is of type UInt8.
 They can’t be added together directly, because they’re not of the same type.
 Instead, this example calls UInt16(one) to create a new UInt16 initialized with the value of one, and uses this value in place of the original:
 */

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
//let twoThousandAndOne = twoThousand + one // Binary operator '+' cannot be applied to operands of type 'UInt16' and 'UInt8'
let twoThousandAndOne = twoThousand + UInt16(one)
print(twoThousandAndOne)    // 2001
// Because both sides of the addition are now of type UInt16, the addition is allowed.
// The output constant (twoThousandAndOne) is inferred to be of type UInt16, because it’s the sum of two UInt16 values.

/*
 SomeType(ofInitialValue) is the default way to call the initializer of a Swift type and pass in an initial value.
 Behind the scenes, UInt16 has an initializer that accepts a UInt8 value, and so this initializer is used to make a new UInt16 from an existing UInt8.
 You can’t pass in any type here, however—it has to be a type for which UInt16 provides an initializer.
 Extending existing types to provide initializers that accept new types (including your own type definitions) is covered in Extensions.
 */

// Integer and Floating-Point Conversion (整数和浮点数转换)
// Conversions between integer and floating-point numeric types must be made explicit:

let three = 3
let pointOneFourOneFiveNine = 0.14159
//let pi1 = three + pointOneFourOneFiveNine // Build Error: Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
let pi1 = Double(three) + pointOneFourOneFiveNine
print(pi1) // 3.14159, and is inferred to be of type Double

let integerPi = Int(pi1)
print(integerPi) // 
// Floating-point values are always truncated when used to initialize a new integer value in this way.
// This means that 4.75 becomes 4, and -3.9 becomes -3.

// Type Aliases
// Type aliases define an alternative name for an existing type.
// You define type aliases with the typealias keyword.
// Type aliases are useful when you want to refer to an existing type by a name that is
// contextually more appropriate, such as when working with data of a specific size from an
// external source:

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// Here, AudioSample is defined as an alias for UInt16.
// Because it’s an alias, the call to AudioSample.min actually calls UInt16.min,
// which provides an initial value of 0 for the maxAmplitudeFound variable.

print(maxAmplitudeFound) // 0

// Booleans
// Swift has a basic Boolean type, called Bool. Boolean values are referred to as logical, because they can only ever be true or false. Swift provides two Boolean constant values, true and false:



