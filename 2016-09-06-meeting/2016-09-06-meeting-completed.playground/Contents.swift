/*
 Created by Ethan Look. Demonstrated on September 6, 2016.
 
 To learn more about Swift, check out https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html
 */

// This is a comment in our code.

/*
 This is also a comment in our code!
 */

// TODO: Uncomment the below line by putting your cursor on the line and pressing Command + `/`
 print("I'm uncommented!")

// TODO: Create a variable called `catchphrase`, and assign it your favorite catchphrase!
var catchphrase = "Look, it's Ethan Look!"

// TODO: Change the value of `catchphrase` to be a different catchphrase.
catchphrase = "You know what's good."

// TODO: Create a constant called `name`, and assign it your name. See what happens when you try to reassign your name!
let name = "Ethan"
//name = "Ethan Look"

// TODO: Declare a constant that is an implicit double.
let double = 20.4

// TODO: Declare a constant that is an explicit integer.
let integer: Int = 17

// TODO: Fill in the following to tell me how many apples you have.
print("I have \(integer) apples in my backpack.")


// TODO: Create an array of your favorite colors called faveColors.
var faveColors: [String] = ["blue", "red", "yellow", "green"]

// TODO: Add a new color to your array!
faveColors.append("orange")

// TODO: For each color, tell me the number of characters in the color.
for color in faveColors {
    print("Color: \(color); Number of characters: \(color.characters.count)")
}

// TODO: For each color, tell me if the color is longer or shorter than 4 characters. If it is 4 characters, say "Woohoo!".
for color in faveColors {
    let numberOfLetters = color.characters.count
    if (numberOfLetters > 4) {
        print("\(color) is longer than 4 letters.")
    } else if (numberOfLetters < 4) {
        print("\(color) is shorter than 4 letters.")
    } else {
        print("Woohoo!")
    }
}

// TODO: Create an optional integer variable called `optionalNumber`, and don't initialize it.
var optionalNumber: Int?

if let number = optionalNumber {
    print("The number exists!")
} else {
    print("The number does not exist. :(")
}

// TODO: Initialize the value of `optionalNumber`!
optionalNumber = 12

if let number = optionalNumber {
    print("The number exists!")
} else {
    print("The number does not exist. :(")
}

// TODO: Create an optional string called `optionalFriend`, and don't initialize it.
var optionalFriend: String?
let genericPerson: String = "friend-o"
print("Hey there, \(optionalFriend ?? genericPerson).")

// TODO: Declare a function called `greet` that says "Hello, world!".
func greet() {
    print("Hello, world!")
}

greet()

// TODO: Declare a function called `greetFriend` that accepts a string parameter called `friend`.
func greetFriend(name: String) {
    print("Hello, \(name)!")
}

greetFriend("Ethan")

// TODO: Declare a function called `even` that accepts an integer parameter and returns a true boolean if the number is even.
func even(number: Int) -> Bool {
    return number % 2 == 0
}

even(11)
even(12)

// TODO: Declare a class called `Car` with the attributes `color` (string), `numberOfWheels` (integer), `numberOfDoors` (integer), `hybrid` (boolean), a constructor, and a member function `simpleDescription` that returns a string.
class Car {
    var color: String
    var numberOfWheels: Int
    var numberOfDoors: Int
    var hybrid: Bool
    
    init(color: String, numberOfWheels: Int, numberOfDoors: Int, hybrid: Bool) {
        self.color = color
        self.numberOfWheels = numberOfWheels
        self.numberOfDoors = numberOfDoors
        self.hybrid = hybrid
    }
    
    func simpleDescription() -> String {
        return "I'm a \(color) car with \(numberOfWheels) wheels, \(numberOfDoors) doors, and I'm \(hybrid ? "definitely" : "not") a hybrid."
    }
}

let myCar = Car(color: "blue", numberOfWheels: 6, numberOfDoors: 2, hybrid: false)
print(myCar.simpleDescription())
