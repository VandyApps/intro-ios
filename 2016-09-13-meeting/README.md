# Meeting, September 13, 2016

In this meeting, we're going to create our first iOS app with a simple user interface. Here's the goal:

<------ INSERT IMAGE HERE ------->

## Setting Up the Project

1. Open Xcode.
2. Select *Create a new Xcode project.*
3. Select `iOS > Application > Single View Application`. Click `Next`.
4. Configure some basic info about your app:
  * Call your app whatever you want. I'll call it `Spiritr`, but it doesn't matter.
  * For organization name, put your name.
  * For organization identifier, use reverse domain notation. My website is `ethan.lookfamily.org` so I'd use `org.lookfamily.ethan`. `com.ethanlook` would work too.
  * Make sure language is set to `Swift`.
  * Make sure devices is set to `Universal`.
  * Don't use Core Data.
5. Click `Next` and choose a location to save your project. If you'd like, create a Git repository.

## Let's make buttons!

1. Navigate to `Main.storyboard`. You should see a white box titled `View Controller`.
2. In the upper righthand corner, open the right panel if it isn't already visible.
3. Filter for `button` at the bottom.
4. Drag a button on the `View Controller`.
5. Click the `Add New Allignment Constraint` at the bottom.
  * Check the boxes for `Horizontally in Container` and `Vertically in Container`.
  * Click `Add 2 Constraints`.
6. Click the `Resolve Auto Layout Issues` icon. Select `Update Frames`.
7. Click the icon in the upper right corner to `Show the Assistant Editor`.
8. Press the `Option` button on your keyboard and drag the button over to line 22 in the `ViewController.swift` code. Choose `Connection > Action` and call it `buttonPressed`. Click `Connect`.
9. Inside the `buttonPressed` function, `print("I've been pressed!")`.
10. Run your app with the play button in the upper left. You may have to choose a Simulator device to the right of the play button.
  * You can stop the app with the stop button (to the right of the play button).

## Adding a snazzy label.

1. Add a label above the button in the storyboard. This can be done the same way the button was added.
2. Center the label. (Just like the button!)
3. Control drag from the label to the button. Select vertical spacing when prompted.
4. On the right side, select the `Attributes Inspector`. With the label selected, change the text to "Anchor down!".
5. After all of this is done, `Update Frames` like before.
6. Again, open the `Assistant Editor`.
7. Control drag the label to line 12. Make it an outlet called `spiritLabel`.
8. Change the code in `buttonPressed` to the following:
```
if (spiritLabel.text == "Anchor down!") {
    spiritLabel.text = "Go 'Dores!"
} else {
    spiritLabel.text = "Anchor down!"
}
```

## A Challenge
When the button is pressed, alternate the text between black and gold!

Hint: check out the `label.textColor` property.