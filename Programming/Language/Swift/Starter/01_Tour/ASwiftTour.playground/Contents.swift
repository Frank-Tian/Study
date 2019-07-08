// A Swift Tour

print("Hello Swift")

var variable = 43
variable = 50
let constant = 53

let integer = 70
let double = 70.0
let expliciDouble: Double = 70;

let label = "Label info text"
let width = 100
let widthLabel = label + String(width)

print(widthLabel)

let apples = 3
let orange = 4
let appleSummary = "I have \(apples) apples."
let friutSummary = "I have \(apples + orange) pieces of friut."

print(appleSummary)
print(friutSummary)

let quotation = """
I love you forever
And I said "I love you forever"
"""

print(quotation)


var hobbies = ["Shopping", "Sport", "Reading"]
print(hobbies)
hobbies[1] = "Driving"
print(hobbies)

var dict = [
    "Key1": "Value1",
    "Key2": "Value2",
]
print(dict)
dict["Key2"] = "New Value2"
print(dict)

hobbies.append("Sleeping")
print(hobbies)


let emptyArray = [String]()
print(emptyArray)

let emptyDict = [String: Float]()
print(emptyDict)

// Error: emptyArray is a constant array
//emptyArray.append("New")
//print(emptyArray)

let individualScores = [100,22,33,43,25,64]
var teamScore = 0
for score in individualScores {
    print(score)
    if score > 60 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print("team scores is \(teamScore)")

var optStr: String? = "Hello"
print(optStr == nil)

var optionalName: String? = "Frank"
var greeting = "Hello~"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)

let nickName: String? = nil
let fullName: String = "John xxx"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)

//let vegetable = "Red pepper"
//let vegetable = "celery"
let vegetable = "cucumber"

switch vegetable {
case "celery":
    print("Add some raisins")
case "cucumber", "watercress":
    print("XXXXXXXXX")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everythins tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square":[1,4,9,16,25]
]
var largest = 0

// Control Flow
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

var total1 = 0
for i in 0...4 {
    total1 += i
}
print(total1)

// Functions and Closures

