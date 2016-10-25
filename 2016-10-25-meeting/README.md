# Meeting, October 25, 2016

In this meeting, we'll build onto the project from 2016-10-25-meeting. We're going to pass data back from the detail view!

If you haven't already, I highly recommend you implement the project from last time. If you'd rather just jump in I've also included the completed code from the project.

## Setting up a protocol

We'll use a protocol to pass data back from the detail view. You've already used a lot of protocols (like `UITableViewDataSource`) but we're going to implement our own.

Remember, a protocol is simply a blueprint for methods, properties and other required functionality.

In the project, create a new Swift file called `TableViewDetailDelegate.swift`. In the file, we want to define a simple protocol:

```
protocol TableViewDetailDelegate {
    func writeBackOrderCountForRow(value: Int, indexPath: NSIndexPath)
}
```

### Adding the protocol to our Table View

We now want to implement this protocol for our Table View. In ViewController.swift, add the following method to the ViewController class:

```
func writeBackOrderCountForRow(value: Int, indexPath: NSIndexPath) {
    orderCount[indexPath.row] = value
    self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
}
```

This will assign our updated value to the proper row.

### Hooking Up the Delegate to the Detail View

In `FoodViewController.swift` (or whatever you called your detail view), add two members called `delegate` and 	`row`:

```
var delegate: TableViewDetailDelegate?
var indexPath: NSIndexPath?
```

Now, every time we update the counter, also write back the value:

```
@IBAction func addOneToOrder(sender: AnyObject) {
    orderCount += 1
    updateOrderCount()
}

@IBAction func removeOneFromOrder(sender: AnyObject) {
    if (orderCount > 0) {
        orderCount -= 1
        updateOrderCount()
    }
}

func updateOrderCount() {
    orderCountLabel.text = "\(orderCount) ordered"
    delegate?.writeBackOrderCountForRow(orderCount, indexPath: indexPath!)
}
```

Finally, back in `ViewController.swift`, we can hook up the delegate by modifying `prepareForSegue`:
```
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if  segue.identifier == foodSegueIdentifier,
        let destination = segue.destinationViewController as? FoodViewController,
        foodIndex = tableView.indexPathForSelectedRow?.row,
    	indexPath = tableView.indexPathForSelectedRow
    {
        destination.delegate = self
        destination.indexPath = indexPath
        destination.foodName = foods[foodIndex]
        destination.orderCount = orderCount[foodIndex]
    }
}
```

That's it! Go ahead and run your app! Watch the data persist between the TableView and the detail view!