import UIKit

// Strings and Characters

/*
 A String is a series of characters , such as "Hello, world"
 Swift strings are represented by the String type.
 The contents of a String can be accessed in various ways,
 including as a collection of Character values.
 
 Swift's String and Character types provide a fast, Unicode-compliant
 way to work with text in your code.
 
 The syntax for string creation and manipulation is lightweight and readable,
 with a string literal syntax that is similar to C.
 
 String concatenation is as simple as combining two strings with the + operator,
 and string mutability is managed by choosing between a constant or a variable,
 just like any other value in Swift.
 
 You can also use strings to insert constants, variables, literals, and expressions
 into longer strings, in a process known as string interpolation.
 This makes it easy to create custom string values for display, and printing.
 
 Despite this simplicity of syntax, Swift's Strin type is a fast, modern string implementation.
 Every string is composed of encoding-independent Unicode characters, and provides support for
 accessing thos characters in various Unicode representations.
 */

// String Literals 字符串字面量

let someString = "Some string literal value"

// Mulitiline String Literals 多行字符串的字面量形式

let quotation = """

hahha The white Rabbit put on his spectacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the king said gravely,

"""
print(quotation)

// but you don’t want the line breaks to be part of the string’s value,
// write a backslash (\) at the end of those lines:

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

print(softWrappedQuotation)

// A multiline string can be indented to match the surrounding code.
// The whitespace before the closing quotation marks (""") tells Swift what whitespace to ignore before all of the other lines.
// However, if you write whitespace at the beginning of a line in addition to what’s before the
// closing quotation marks, that whitespace is included.

let showWhiteSpace = """
    This line doesn't begin with whitespace.
        This line begin with whitespace.
    This line doesn't begin with whitespace.
    """
print(showWhiteSpace)
// This line doesn't begin with whitespace.
//     This line begin with whitespace.
// This line doesn't begin with whitespace.

// Special Characters in String Literals

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

print(wiseWords + dollarSign + blackHeart + sparklingHeart)
// "Imagination is more important than knowledge" - Einstein$♥💖

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

print(threeDoubleQuotationMarks)

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """"""
"""
"""
"""

"""#
print(threeMoreDoubleQuotationMarks)
/*
Here are three more double quotes: """"""
"""
"""
"""
*/

// Initializing an Empty String 初始化一个空字符串

var emptyString = ""                // empty string literal
var anotherEmptyString = String()   // initializer syntax
print(emptyString == anotherEmptyString) // true
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"

// String Mutability 可变字符串

var variableString = "Hello"
variableString += ", world"
// variableString is now "Hello, world"

let constantString = "Highlander"
// constantString += "and another Highlander"
// this reports a compile-time error - aconstant string cannot be modified

// Strings Are Value Types 字符串是值类型

/*
 Swift's String type is a value type. if you create a new String value, that Stringn value is
 copied when it's passed to a function or method, or when it's assigned to a constant or variable.
 
 In each case, a new copy of the existing String value is created, and the new copy is passed or
 assigned, not the original version.
 
 Swift's copy-by-default String behavior ensours that when a function or method passes you a String
 value, it's clear that you own that exact String value, regardless of where it came from. You can
 be confident that the string you are passed won't be modified unless you modify it yourself.
*/

// Working with Characters 字符

for c in "Dog!daoge" {
    print(c)
//    D
//    o
//    g
//    !
//    d
//    a
//    o
//    g
//    e
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t"]
let catString = String(catCharacters)
print(catString)
// Cat

// Concatenating Strings and Characters 字符串和字符拼接

let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2
// "Hello there"

var hahah = "haha"
hahah += string2
// hahah now equals "haha there"

welcome.append(exclamationMark)
// welcome now equals "Hello there!"

let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// Prints two lines:
// one
// twothree

let goodStart = """
one
two

"""
print(goodStart + end)
// Prints three lines:
// one
// two
// three


// String Interpolation 字符串插入

let multiplier = 3
let message = "\(multiplier) times is \(Double(multiplier) * 2.5)"
// "3 times is 7.5"

// You can use extended string delimiters to create strings containing characters that would
// otherwise be treated as a string interpolation. For example:

print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."

// To use string interpolation inside a string that uses extended delimiters,
// match the number of number signs before the backslash to the number of number signs at the
// beginning and end of the string. For example:

print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."


// Unicode
//

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸

// Counting Characters

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"

// Accessing and Modifying a String
// String Indices

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

for index in greeting.indices {
    print("\(greeting[index])-", terminator: "")
}
// G-u-t-e-n- -T-a-g-!-

// Inserting and Removing
//To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.

var welcomeMsg = "hello"
welcomeMsg.insert("!", at: welcomeMsg.endIndex)
// welcome now equals "hello!"

welcomeMsg.insert(contentsOf: " there", at: welcomeMsg.index(before: welcomeMsg.endIndex))
// welcome now equals "hello there!"

welcomeMsg.remove(at: welcomeMsg.index(before: welcomeMsg.endIndex))
print(welcomeMsg)
// welcome now equals "hello there"
let range = welcomeMsg.index(welcomeMsg.endIndex, offsetBy: -6)..<welcomeMsg.endIndex
welcomeMsg.removeSubrange(range)
// welcome now equals "hello"

// Substrings

let greeting1 = "Hello, world!"
let index1 = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<index1]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
print(newString)
// "Hello"

// Comparing Strings

// Swift provides three ways to compare textual values: string and character equality, prefix equality, and suffix equality.

// Way 1.
// String and Character Equality
let quotation1 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation1 == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"

// Way 2.
// Prefix and Suffix Equality

/*
 To check whether a string has a particular string prefix or suffix,
 call the string’s hasPrefix(_:) and hasSuffix(_:) methods,
 both of which take a single argument of type String and return a Boolean value.
 */

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"


// Unicode Representations of Strings
// Swift provides several different ways to access Unicode representations of strings. You can iterate over the string with a for-in statement, to access its individual Character values as Unicode extended grapheme clusters. This process is described in Working with Characters.

let dogString = "Dog‼🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶
