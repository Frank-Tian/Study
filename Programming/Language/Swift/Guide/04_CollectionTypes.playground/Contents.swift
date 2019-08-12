import UIKit

// Collection Types
// https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html

// Swift provides three primary collection types,
// known as arrays, sets, and dictionaries, for storing collections of values.
// Arrays are ordered collections of values. Sets are unordered collections of unique values.
// Dictionaries are unordered collections of key-value associations.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// Arrays
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// create an empty array

var someInts = [Int]()

print("someInts is of type [Int] width \(someInts.count) times")
// someInts is of type [Int] width 0 times

someInts.append(3)

print("someInts is of type [Int] width \(someInts.count) times")
// someInts is of type [Int] width 1 times

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 3.5, count: 4)

for i in anotherThreeDoubles {
    print(i)
}
//3.5
//3.5
//3.5
//3.5

var sixDoubles = threeDoubles + anotherThreeDoubles

print(sixDoubles)
// [0.0, 0.0, 0.0, 3.5, 3.5, 3.5, 3.5]

// Creating an Array with an Array Literal

var shoppingList: [String] = ["Eggs", "Apple", "Meat", "Milk"]

print(shoppingList)
// ["Eggs", "Apple", "Meat", "Milk"]

var shoppingList2 = ["Eggs", "Milk"]
print(shoppingList2)
// ["Eggs", "Milk"]

// Accessing and Modifying an Array

// To find out the number of items in an array, check its read-only count property

print("The shopping list contains \(shoppingList.count) items")
// The shopping list contains 4 items

// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}// The shopping list is not empty.

// You can add a new item to the end of an array by calling the array’s append(_:) method:

shoppingList2.append("Bread")
shoppingList2.append("Mutton")
// shoppingList2 now contains 4 items. ["Eggs", "Milk", "Bread", "Mutton"]

// Alternatively, append an array of one or more compatible items with the addition assignment operator (+=):

shoppingList2 += ["Chocolate Spread"]
// shoppingList2 now contains 5 items.["Eggs", "Milk", "Bread", "Mutton", "Chocolate Spread"]

shoppingList2 += ["Cheese", "Butter"]
// shoppingList2 now contains 5 items. ["Eggs", "Milk", "Bread", "Mutton", "Chocolate Spread", "Cheese", "Butter"]

// Retrieve a value from the array by using subscript syntax,
// passing the index of the value you want to retrieve within square brackets immediately after the name of the array:

let firstShoppingItem = shoppingList2[0]
// first is  Eggs

// You can use subscript syntax to change an existing value at a given index:

shoppingList2[0] = "Six eggs"

// When you use subscript syntax, the index you specify needs to be valid


// You can also use subscript syntax to change a range of values at once,

shoppingList2[4...6] = ["Bananas", "Water"]
shoppingList2
// shopingList2 now contains 6 items. ["Six eggs", "Milk", "Bread", "Mutton", "Bananas", "Water"]

// To insert an item into the array at a specified index, call the array’s insert(_:at:) method:

shoppingList2.insert("First Item Wine", at: 0)
// shoppinglist2 now contains 7 items. ["First Item Wine", "Six eggs", "Milk", "Bread", "Mutton", "Bananas", "Water"]

// Similarly, you remove an item from the array with the remove(at:) method.
// This method removes the item at the specified index and returns the removed item
// (although you can ignore the returned value if you do not need it):

let removedItem = shoppingList2.remove(at: 0)
shoppingList2
// shoppingList2 now contains 6 items. ["Six eggs", "Milk", "Bread", "Mutton", "Bananas", "Water"]

// If you want to remove the final item from an array, use the removeLast() method rather than the remove(at:) method to avoid the need to query the array’s count property.

let lastItem = shoppingList2.removeLast()
shoppingList2
// shoppingList2 now contains 5 items.["Six eggs", "Milk", "Bread", "Mutton", "Bananas"]
// lastItem = Water


// Iterating Over an Array
// You can iterate over the entire set of values in an array with the for-in loop:

for item in shoppingList2 {
    print(item)
    //    Six eggs
    //    Milk
    //    Bread
    //    Mutton
    //    Bananas
}

for (index, value) in shoppingList2.enumerated() {
    print("Item \(index + 1) : \(value)")
    //    Item 1 : Six eggs
    //    Item 2 : Milk
    //    Item 3 : Bread
    //    Item 4 : Mutton
    //    Item 5 : Bananas
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// Sets
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// A type must be hashable in order to be stored in a set
// that is, the type must provide a way to compute a hash value for itself.
// A hash value is an Int value that is the same for all objects that compare equally,
// such that if a == b, it follows that a.hashValue == b.hashValue.

// All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default,
// and can be used as set value types or dictionary key types.

// Enumeration case values without associated values (as described in Enumeration) are also hashable by default.

// Set Type Syntax

var letters = Set<Character>()
print(letters.count) // 0
letters.insert("A")
letters.insert("G")
letters.insert("F")
letters.insert("C")
letters.insert("B")
print(letters.count) // 5

for c in letters {
    print(c)
//    F
//    A
//    C
//    B
//    G
    
//    OR
    
//    A
//    G
//    F
//    C
//    B
}

letters = []

print(type(of: letters))    // Set<Character>
// letters is now an empty set, but is still of type Set<Character>


// Creating a Set with an Array Literal

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items

// A set type cannot be inferred from an array literal alone, so the type Set must be explicitly declared. However, because of Swift’s type inference, you don’t have to write the type of the set’s elements if you’re initializing it with an array literal that contains values of just one type.

var testSet: Set = ["A", "B", "D"]

// Accessing and Modifying a Set

print("I have \(favoriteGenres.count) favorite music genres.")
// I have 3 favorite music genres.

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// Prints "I have particular music preferences."

favoriteGenres.insert("Jazz")
favoriteGenres
// favoriteGenres now contains 4 items {"Jazz", "Hip hop", "Rock", "Classical"}

// You can remove an item from a set by calling the set’s remove(_:) method, which removes the item if it’s a member of the set, and returns the removed value, or returns nil if the set did not contain it. Alternatively, all items in a set can be removed with its removeAll() method.

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Prints "Rock? I'm over it."

// To check whether a set contains a particular item, use the contains(_:) method.

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// Prints "It's too funky in here."

// Iterating Over a Set

// You can iterate over the values in a set with a for-in loop.

for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop


// Swift’s Set type does not have a defined ordering. To iterate over the values of a set in a specific order, use the sorted() method, which returns the set’s elements as an array sorted using the < operator.

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz

// Performing Set Operations
// You can efficiently perform fundamental set operations, such as combining two sets together, determining which values two sets have in common, or determining whether two sets contain all, some, or none of the same values.

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

// Set Membership and Equality

// Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
// Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.

// Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.

// Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.

// Use the isDisjoint(with:) method to determine whether two sets have no values in common.

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals) // a是否包含于b
// true
farmAnimals.isSuperset(of: houseAnimals) // a是否包含b
// true
farmAnimals.isDisjoint(with: cityAnimals) // a是否和b全不同
// true


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// Dictionaries
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Dictionaries
// A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering.
// Each value is associated with a unique key, which acts as an identifier for that value within the dictionary.
// Unlike items in an array, items in a dictionary do not have a specified order.
// You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word.

// Swift’s Dictionary type is bridged to Foundation’s NSDictionary class.

// Dictionary Type Shorthand Syntax

// A dictionary Key type must conform to the Hashable protocol, like a set’s value type.

// The type of a Swift dictionary is written in full as Dictionary<Key, Value>, where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys.
// You can also write the type of a dictionary in shorthand form as [Key: Value]. Although the two forms are functionally identical, the shorthand form is preferred and is used throughout this guide when referring to the type of a dictionary.

// Creating an Empty Dictionary

var namesOfIntegers = [Int: String]()
// namesOfIntegers is an empty [Int: String] dictionary
// Its keys are of type Int, and its values are of type String.

// If the context already provides type information, you can create an empty dictionary with an empty dictionary literal, which is written as [:] (a colon inside a pair of square brackets):

namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]

// Creating a Dictionary with a Dictionary Literal

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// ["DUB": "Dublin", "YYZ": "Toronto Pearson"]

// As with arrays, you don’t have to write the type of the dictionary if you’re initializing it with a dictionary literal whose keys and values have consistent types.
// The initialization of airports could have been written in a shorter form instead:

var nameAge = ["Wang": 19, "Li": 18]
// ["Li": 18, "Wang": 19]


// Accessing and Modifying a Dictionary

print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."

// Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// Prints "The airports dictionary is not empty."

// You can add a new item to a dictionary with subscript syntax. Use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type:

airports["LHR"] = "London"
// the airports dictionary now contains 3 items

airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow"

airports
// ["YYZ": "Toronto Pearson", "DUB": "Dublin", "LHR": "London Heathrow"]

// As an alternative to subscripting, use a dictionary’s updateValue(_:forKey:) method to set or
// update the value for a particular key. Like the subscript examples above, the updateValue(_:forKey:)
// method sets a value for a key if none exists, or updates the value if that key already exists.
// Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing
// an update. This enables you to check whether or not an update took place.

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."

// You can also use subscript syntax to retrieve a value from the dictionary for a particular key.
// Because it is possible to request a key for which no value exists, a dictionary’s subscript returns
// an optional value of the dictionary’s value type. If the dictionary contains a value for the requested
// key, the subscript returns an optional value containing the existing value for that key. Otherwise,
// the subscript returns nil:

let airportName = airports["DUB123"]
// nil

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."

// You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key:

airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary


// Alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method.
// This method removes the key-value pair if it exists and returns the removed value, or returns nil
// if no value existed:

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."


// Iterating Over a Dictionary

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// LHR: London Heathrow
// YYZ: Toronto Pearson


// You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its
// keys and values properties

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson

// If you need to use a dictionary’s keys or values with an API that takes an Array instance,
// initialize a new array with the keys or values property:

let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]


// Swift’s Dictionary type does not have a defined ordering.
// To iterate over the keys or values of a dictionary in a specific order,
// use the sorted() method on its keys or values property.


