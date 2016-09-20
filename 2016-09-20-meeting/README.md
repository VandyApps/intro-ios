# Meeting, September 20, 2016

In this meeting, we're going to create a table view with navigation. Our table will be extremely simple, and just display a list of colors. Eventually, we'll show a *detail view* to show the user a little more when they tap on a color.

## Setting Up the Project

We want to make a single view application called TableNavExample. If you don't remember how to do this, [follow these instructions](https://github.com/VandyApps/intro-ios/tree/master/2016-09-13-meeting#setting-up-the-project).

## Making a TableView

1. Navigate to the `Main.storyboard`. Drag and drop a `Table View` (not a `Table View Controller`!) into the  `View Controller`.

2. Set constraints for the `Table View` you just added such that it has the same width and height of the `View Controller`, and it is centered.

3. Select the `Table View`. In `Utilities > Attributes Inspector`, set `Prototype Cells` to 1.

4. Select the prototype cell.
  * In `Utilities > Attributes Inspector`, set `Style` to `Basic`. This will make the title appear in the cell.
  * In `Utilities > Attributes Inspector`, set `Identifier` to `TextCell`.

5. With the View Controller selected, open the `Assistant Editor`. Add an outlet to the TableView called `tableView`.

6. Change the signature of the `ViewController` class such that it not only conforms to `UIViewController`, but also `UITableViewDelegate` and `UITableViewDataSource`. This can be done by separating the values with commas:
```
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
```
  This means we must conform to each of these three protocols. We'll come back to that soon.

7. Add the following lines to the bottom of the `viewDidLoad` function:
```
tableView.delegate = self
tableView.dataSource = self
```
  This tells the `TableView` that it and its data will be managed by the `View Controller`.

8. In the `ViewController`, declare a variable `colors` that is an array of color strings. I did the following:
```
let colors = ["Red", "Green", "Blue", "Yellow", "Purple", "Black"]
```

9. In the `ViewController`, declare a contant `textCellIdentifier` that has the value `"TextCell"`. This is the same value that we set as the identifier to the prototype cell.

10. In the `ViewController`, define the following function:
```
func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
}
```
This says there will only be one section in our table view.

11. In the `ViewController`, define the following function:
```
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return colors.count
}
```
This says there will be `colors.count` items in our table view.

12. In the `ViewController`, define the following function:
```
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
    
    let row = indexPath.row
    cell.textLabel?.text = colors[row]
    
    return cell
}
```
This creates a new cell in our table view. Notice that it creates a cell with the name `textCellIdentifier` -- this means it uses our prototype! It then sets the label of the cell to have the text of a color.

13. In the `ViewController`, define the following function:
```
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let row = indexPath.row
    print(colors[row])
}
```
This gives instructions for what to do when a cell is tapped and selected. For us, it is good enough to deselect the row, then print which color was tapped.

That's it! Now our table view is in good condition. Next up, let's show a little more with some navigation.

## Bring life to our TableView!

We want to add a menu bar to our app so we can go to different pages in the app. Fortunately, adding navigation to our application is simple. Select the `View Controller`. In the menu bar, select `Editor > Embed In > Navigation Controller`. This allows our app to have navigation! Now let's add some more navigation to show a new view controller when we tap on a cell:

1. In the `Main.storyboard`, click on the prototype cell. Under `Utilities > Attributes Inspector` set the `Accessory` to `Disclosure Indicator`. This indicates to the user that the cell can be clicked.

2. Drag and drop a new `View Controller` from the `Object Library`.

3. In this new `View Controller`, add a label. Constrain the label so it is centered.

4. Create a new file. Choose `iOS > Source > Cocoa Touch Class`. Call it `ColorViewController`. Make it a subclass of `UIViewController`.

5. Return to `Main.storyboard` after the file has been created. Click on the new `View Controller`. Under `Utilities > Identity Inspector`, change the class to `ColorViewController`.

6. Open the assistant editor. Create an outlet for the label called `colorLabel`.

7. In the `ColorViewController`, create a variable called `colorName` and set it to the empty string `""`.

8. Add the following function to the `ColorViewController`:
```
override func viewWillAppear(animated: Bool) {
    colorLabel.text = colorName
}
```
This will set the `colorLabel`'s text to the `colorName` each time before the `ColorViewController` appears. For now, that value is the empty string.

9. In the `Main.storyboard`, control+click and drag from the prototype cell in the `ViewController` to the new `ColorViewController`. Click `Selection Segue > Show` when the popup appears. This will cause a *segue* when a user clicks on a cell.

10. Click on the segue. In `Utilities > Attribute Inspector`, and set `Identifier` to `ShowColorSegue`. This will allow us to refer specifically to that segue in our code.

11. In the `ViewController` (for the table view, not the `ColorViewController`), add a constant called `colorSegueIdentifier` with the value `ShowColorSegue`. Now we can reference the segue in our `ViewController`!

12. Add the following function to the `ViewController`:
```
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if  segue.identifier == colorSegueIdentifier,
        let destination = segue.destinationViewController as? ColorViewController,
        blogIndex = tableView.indexPathForSelectedRow?.row
    {
        destination.colorName = colors[blogIndex]
    }
}
```
This function gets called every time a segue gets triggered in the `ViewController`. For us, this means if it is the right segue, based upon the identifier, we'll change the `destination.colorName` to the color for the cell that was selected.

And that's it! Now a detail view is displayed when a cell in the `TableView` is tapped.

## Challenge
When the user opens a detail view for a color, change the background color of the `ColorViewController` to match the color name.