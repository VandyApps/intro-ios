# Meeting November 15, 2016

This week we'll make a simple game using SpriteKit. SpriteKit is the framework used in iOS to make 2-dimensional games. Our app won't have much gameplay to it -- we're just going to fire some rockets (woah) but it will give you an idea about how to begin making your own game.

Start with the boilerplate project I've provided. A SpriteKit game has very similar structure to the apps we're used to seeing. The exception is we'll deal with `GameViewController`s and `GameScene`s instead of `ViewController`s and storyboards.

## Change the Background Color

In the deep void of space, everything is black. So the background of the scene should be black! Right before you present the scene in `viewDidLoad` of `GameViewController`, change the background color with this line:

```
scene.backgroundColor = UIColor.blackColor()
```

## Create the Sprite Class

In SpriteKit, SKSpriteNodes are the characters objects we use to make up our scenes. We'll make a "wrapper" class called Sprite that will make it easier to use SKSpriteNodes. Make a new file called `Sprite.swift`, then:

- `import SpriteKit`
- Create a class called `Sprite`:
```
class Sprite {
	
}
```
- Inside the class, create a constant member of the class to hold the `SKSpriteNode`:
```
let sprite = SKSpriteNode()
```
- Inside the class, create an initializer or contructor to make new `Sprite`s:
```
init(imageNamed:String, name:String, x:CGFloat, y:CGFloat, z: CGFloat) {
    sprite.texture = SKTexture(imageNamed: imageNamed)
    sprite.position = CGPoint(x: x, y: y)
    sprite.size = sprite.texture!.size()
    sprite.name = name
    sprite.zPosition = z
}
```
This makes it super easy to quickly make a new `Sprite` that sets all of the values we need.
- Inside the class, create a method to add that `Sprite` to a scene or parent node:
```
func addTo(parentNode: SKScene) -> Sprite {
    parentNode.addChild(sprite)
    return self
}
```

## Creating the Rocket Class

Now, we want to make rockets using the `Sprite` class we just created. Again, make a new Swift file called `Rocket.swift`, then:

- `import SpriteKit`
- Create a class called `Rocket` that is a subclass of `Sprite`:
```
class Rocket: Sprite {
	
}
```
- Inside the class, create an initializer. All we want to do is call the initializer of our super/parent class. I've included the rocket image for you.
```
init(x:CGFloat, y:CGFloat, z:CGFloat) {
    
    super.init(imageNamed: "rocket", name: "rocket", x: x, y: y, z: z)

}
```
- Inside the class, include this required method:
```
required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
```
- Finally, define a method to make the rocket fly, then remove it from the scene:
```
func flyAndRemove(height: CGFloat) {
    let destination = CGPoint(x: self.sprite.position.x, y: height + self.sprite.position.y)
    
    let actionMove = SKAction.moveTo(destination, duration: 12.0)
    let actionAccel = SKAction.speedBy(50, duration: 12.0)
    let actionMoveDone = SKAction.runBlock() {
        self.sprite.removeFromParent()
    }
    self.sprite.runAction(SKAction.sequence([SKAction.group([actionMove,actionAccel]), actionMoveDone]))
}
```

## Adding Rockets to the Scene

Now, we want to add rockets when we tap in the scene. Check out `GameScene.swift`. We can take advantage of the `touchesBegan` method to know when our scene has been tapped. All we need to do is add a `Rocket` at the location of the touch!
```
let rocket = Rocket(x: location.x, y: location.y, z: 0)
rocket.addTo(self)
rocket.flyAndRemove(self.frame.height + 100)
```

And that's it! If we run the app, we should be able to fire rockets when we tap the scene.

Congratulations on making your first game!