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





//////////////////////////////////////////////////////////////////////
// Protocols and Extensions




//////////////////////////////////////////////////////////////////////
// Error Handling





//////////////////////////////////////////////////////////////////////
// Generics







