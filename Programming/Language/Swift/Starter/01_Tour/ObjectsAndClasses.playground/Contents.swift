import UIKit

var str = "Hello, Swift"

// Objects and Classes

//////////////////////////////////////////////////////////////////////

class  Shape {
    var numberOfSides = 0
    var haha = "haha"
    var name: String
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides. name: \(name)"
    }
    
    // add another method that takes an argument
    func printName(n: String) {
        print(n)
    }
    
    // an initializer
    init(name: String) {
        self.name = name
    }
}

var shape = Shape(name: "shape Six")
shape.numberOfSides = 6
var shapeDesc = shape.simpleDescription()

print(shapeDesc)
shape.printName(n: "name")

// Override

class NamedShape {
    var numbersOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
    deinit {
        print("deinit")
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numbersOfSides) sides."
    }
}

class Square: NamedShape {
    
    var sideLength: Double
    
    // new init method
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numbersOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
    
    // overriding a method by accident
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let square = Square(sideLength: 5.2, name: "my squre")
square.area()
square.simpleDescription()

// properties can have a getter and a setter

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    // 1.Setting the value of properties that the subclass declares.
    // 2.Calling the superclass’s initializer.
    // 3.Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numbersOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// if you don't need to compute the property but still need to provide code
// that is run before and after setting a new value ,use willSet and didSet
// The code you provide is run any time the value changes outside of an initializer.
// Example

class TriangleAndSquare {
    
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "test shape aa")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)

/**
 * When working with optional values, you can write ? before operations like methods, properties
 * and subscripting. If the value bvefore the ? is nil, everything after the ? is ignored and the
 * value of the whole expression is nil. Otherwise , the optional value is unwrapped, and everything
 * after the ? acts on the unwrapped value.
 * In both cases, the value of the whole expression is an optional value.
**/

let optionalSqure: Square? = Square(sideLength: 2.5, name: "Optional squre")
let sideLength = optionalSqure?.sideLength


//////////////////////////////////////////////////////////////////////
// Enumerations and Structures

/**
 * Use enum to create an enumeration. Like  classes and all other named types,
 * enumerations can have methods associated with them
 */

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .queen:
            return "queen"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

print(ace) // ace
print(aceRawValue) // 1
print(Rank.jack) // jack
print(Rank.jack.rawValue) //11

/**
 * By default, Swift assigns the raw values starting at zero and incrementing by one each time
 * but you can change this behavior by explicitly specifying values.
 * You can also use strings or floating-point numbers as the raw type of an enumeration.
 * Use the rawValue property to access the raw value of an enumeration case.
 */

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}

/**
 *  The case values of an enumeration are actual values, not just another way of writing their
 *  raw values. In face, in cases where there isn't a meaningful raw value, you don`t have to provide one
 */
enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades-"
        case .hearts:
            return "hearts-"
        case .diamonds:
            return "diamonds-"
        case .clubs:
            return "clubs-"
//        default:
              // (Error:Value of type 'Suit' has no member 'rawValue')
//            return String(self.rawValue) // must extend a type.
        }
    }
}

let hearts = Suit.hearts
let heartsDesc = hearts.simpleDescription()
print(hearts) // hearts
print(heartsDesc) // hearts-


/**
 * If an enumeration has raw values, those values are determined as part of the declaration,
 * which means ervery instance of a particular enumeration case always has the same raw value.
 * Another choice for enumeration cases is to have values associated with the case-- these values
 * are determined when you make the instance, and they can be different for each instance of an
 * enumeration case. You can think of the associated values as behaving like stored properties of the
 * enumeration case instance. For example, consider the case of requesting the sunrise and sunset times
 * from a server. The server either responds whith the reqeusted information, or it responds with
 * a description of what went wrong.
 */

enum ServerResonse {
    case result(String, String)
    case failure(String)
}

let success = ServerResonse.result("200", "Success")
let failure = ServerResonse.failure("Something wrong!")

switch success {
case let .result(sunrise, sunset):
    print("sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure ...\(message)")
}

switch failure {
case let .result(code, msg):
    print("code is \(code) and msg is \(msg)")
case let .failure(message):
    print("Failure ...\(message)")
}

/**
 * Use struct to create a structure .
 * Structures support many of the same behaviors as classes,
 * including methods and initializers. One of the most important differences between structures
 * and classes is that structures are always copied when they are passed around in your code
 * but classes are passed by reference.
 */

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpades) // Card(rank: __lldb_expr_7.Rank.three, suit: __lldb_expr_7.Suit.spades)
print(threeOfSpadesDescription) // The 3 of spades-

//////////////////////////////////////////////////////////////////////
// Protocols and Extensions

/**
 * Use protocol to declare a protocol
 */

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Classes, enumerations, and structs can all adopt protocols

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 123
    
    func adjust() {
        simpleDescription += "Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDesc = a.simpleDescription
print(aDesc) // A very simple class.Now 100% adjusted.


struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure."
    
    mutating func adjust() { // notic: change must use mutating keywords.
        simpleDescription += " (adjusted) "
    }
}

var b = SimpleStructure()
b.adjust()
let bDesc = b.simpleDescription
print(bDesc) // A simple structure. (adjusted)

/**
 * Notice the use of the mutationg keyword in the declaration of SimpleStructure to make a
 * method that modifies the structure. The declaration of SimpleClass doesnt need any of its
 * methods marked as mutating because methods on a class can always modify the class.
 *
 * Use extension to add functionality to an existing type, such as new methods and computed properties.
 * You can use an extension to add protocol conformance to a type that is declared
 * elsewhere, or even to a type that you imported from a library or framework.
 */
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 10
    }
}

enum SimpleEnum: Int {
    case a
    case b
}

print(7.simpleDescription) // ExampleProtocol
var num = 10
num.adjust()
print(num.simpleDescription) // The number 20

var sa = SimpleEnum.a
print(sa.rawValue) // 0
print(sa.rawValue.simpleDescription) // The number 0

/**
 * You can use a protocol name just like any other named type --
 * for exa , to create a collection of objects that have different types but that all conform
 * to a single protocol . When you work with values whose type is a protocol type, methods outside
 * the protocol definition are not available.
 */

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription) // A very simple class.Now 100% adjusted.
//print(protocolValue.anotherProperty) // Value of type 'ExampleProtocol' has no member 'anotherProperty'

/**
 * Even though the variable protocolValue has a runtime type of SimpleClass, the compiler
 * treats it as the given type of ExampleProtocol. This means that you can't accidentally
 * access methods or properties that the class implements in addition to its protocol conformance.
 */

//////////////////////////////////////////////////////////////////////
// Error Handling





//////////////////////////////////////////////////////////////////////
// Generics







