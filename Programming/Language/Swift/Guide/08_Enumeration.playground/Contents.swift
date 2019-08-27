import UIKit

/*:
 ## Enumeration
 
 If you are familiar with C, you will know that C enumerations assign related names to a set of integer values. Enumerations in Swift are much more flexible, and don’t have to provide a value for each case of the enumeration. If a value (known as a raw value) is provided for each enumeration case, the value can be a string, a character, or a value of any integer or floating-point type.

 Alternatively, enumeration cases can specify associated values of any type to be stored along with each different case value, much as unions or variants do in other languages. You can define a common set of related cases as part of one enumeration, each of which has a different set of values of appropriate types associated with it.

 Enumerations in Swift are first-class types in their own right. They adopt many features traditionally supported only by classes, such as computed properties to provide additional information about the enumeration’s current value, and instance methods to provide functionality related to the values the enumeration represents. Enumerations can also define initializers to provide an initial case value; can be extended to expand their functionality beyond their original implementation; and can conform to protocols to provide standard functionality.

 ### Enumeration Syntax （枚举语法）

 You introduce enumerations with the enum keyword and place their entire definition within a pair of braces:
 */

// 定义枚举

enum SomeEnumeration {
    
}

/*:
 
 Here’s an example for the four main points of a compass:

*/

enum CompassPoint {
    case north
    case south
    case east
    case west
}

/*:
 - Note: Swift enumeration cases don’t have an integer value set by default, unlike languages like C and Objective-C. In the CompassPoint example above, north, south, east and west don’t implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are values in their own right, with an explicitly defined type of CompassPoint.
 
 Multiple cases can appear on a single line, separated by commas:

 */

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

/*:
 Each enumeration definition defines a new type. Like other types in Swift, their names (such as CompassPoint and Planet) start with a capital letter. Give enumeration types singular rather than plural names, so that they read as self-evident:

*/

var directionToHead = CompassPoint.west

/*:
 The type of directionToHead is inferred when it’s initialized with one of the possible values of CompassPoint. Once directionToHead is declared as a CompassPoint, you can set it to a different CompassPoint value using a shorter dot syntax:

*/

directionToHead = .east

/*:
 The type of directionToHead is already known, and so you can drop the type when setting its value. This makes for highly readable code when working with explicitly typed enumeration values.

 ### Matching Enumeration Values with a Switch Statement

 You can match individual enumeration values with a switch statement:

*/

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// Prints "Watch out for penguins"

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prints "Mostly harmless"

/*:
 ### Iterating over Enumeration Cases

 For some enumerations, it’s useful to have a collection of all of that enumeration’s cases. You enable this by writing : CaseIterable after the enumeration’s name. Swift exposes a collection of all the cases as an allCases property of the enumeration type. Here’s an example:
 */

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice

/*:
 ### Associated Values
 
 The examples in the previous section show how the cases of an enumeration are a defined (and typed) value in their own right. You can set a constant or variable to Planet.earth, and check for this value later. However, it’s sometimes useful to be able to store values of other types alongside these case values. This additional information is called an associated value, and it varies each time you use that case as a value in your code.

 You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed. Enumerations similar to these are known as discriminated unions, tagged unions, or variants in other programming languages.

 For example, suppose an inventory tracking system needs to track products by two different types of barcode. Some products are labeled with 1D barcodes in UPC format, which uses the numbers 0 to 9. Each barcode has a number system digit, followed by five manufacturer code digits and five product code digits. These are followed by a check digit to verify that the code has been scanned correctly:

 In Swift, an enumeration to define product barcodes of either type might look like this:

 */

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

/*:
 This can be read as:

 “Define an enumeration type called Barcode, which can take either a value of upc with an associated value of type (Int, Int, Int, Int), or a value of qrCode with an associated value of type String.”

 This definition doesn’t provide any actual Int or String values—it just defines the type of associated values that Barcode constants and variables can store when they are equal to Barcode.upc or Barcode.qrCode.

 You can then create new barcodes using either type:
*/

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

/*:
 This example creates a new variable called productBarcode and assigns it a value of Barcode.upc with an associated tuple value of (8, 85909, 51226, 3).

*/

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

/*:
 ### Raw Values
 
 The barcode example in Associated Values shows how cases of an enumeration can declare that they store associated values of different types. As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.

 Here’s an example that stores raw ASCII values alongside named enumeration cases:
 
 Here, the raw values for an enumeration called ASCIIControlCharacter are defined to be of type Character, and are set to some of the more common ASCII control characters. Character values are described in Strings and Characters.

 */

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicitly Assigned Raw Values

enum Planet1: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint1: String {
    case north, south, east, west
}

// In the example above, CompassPoint.south has an implicit raw value of "south", and so on.

// You access the raw value of an enumeration case with its rawValue property:

let earthsOrder = Planet1.earth.rawValue
// earthsOrder is 3

let sunsetDirection = CompassPoint1.west.rawValue
// sunsetDirection is "west"

/*:
 ### Initializing from a Raw Value

 If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value’s type (as a parameter called rawValue) and returns either an enumeration case or nil. You can use this initializer to try to create a new instance of the enumeration.
 
 This example identifies Uranus from its raw value of 7:
  */

let possiblePlanet = Planet1(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus
print(possiblePlanet as Any)

let positionToFind = 11
if let somePlanet = Planet1(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// Prints "There isn't a planet at position 11"
/*:
 This example uses optional binding to try to access a planet with a raw value of 11. The statement if let somePlanet = Planet(rawValue: 11) creates an optional Planet, and sets somePlanet to the value of that optional Planet if it can be retrieved. In this case, it isn’t possible to retrieve a planet with a position of 11, and so the else branch is executed instead.
 */

