# Meeting, September 27, 2016

In this meeting, I'm challenging you to create an application based purely off of screenshots. This app is called *Orderer*. I've provided any images you need, and it's your job to implement the result.

## Landing Page

The landing page for the app should be a table view embedded into a navigation controller (just like last week!). Each cell should have the name of a food, how many times it has been ordered, and an arrow to signify to the user that the cell can be tapped. Hint: use the Table View Cell style called `Right Detail`.

![](https://raw.githubusercontent.com/VandyApps/intro-ios/master/2016-09-27-meeting/screenshots/landing.png "Landing Page")

## Detail View

Each detail view should have a fullscreen image of the food. Note that images need to be added as an image asset - simply just drag and drop the images folder into the `Assets.xcassets`.

The detail should also display the count of orders in the center of the screen. Finally, place two buttons to increase and decrease the number of orders. Don't let the number of orders go below zero!

For now, the number of orders will not be reflected in the list when you tap `Back`. We'll do that next week!

![](https://raw.githubusercontent.com/VandyApps/intro-ios/master/2016-09-27-meeting/screenshots/detail.png "Detail View")