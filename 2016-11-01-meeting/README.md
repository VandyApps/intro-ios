# Meeting November 1, 2016

In this meeting, we'll fetch data from a remote source to display in our application. We'll use OpenWeatherMap for local weather data.

## Signing up for OpenWeatherMap

[Create a free account](https://home.openweathermap.org/users/sign_up) with OpenWeatherMap. After creating the account, [create a new API key here](https://home.openweathermap.org/api_keys). You can name it something like *VandyApps iOS*. Keep the generated key for later use.

## Fetching Data from OpenWeatherMap

Using the base project supplied, we'll fetch data to display whenever the view is about to appear. In `ViewController.swift`, override the `viewDidLoad` lifecycle method:

```
override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    getCurrentWeatherForNashville()
}
```

Every time the view is about to appear we'll fetch the current weather for Nashville. Let's define that function:

```
func getCurrentWeatherForNashville() {

}
```

We now need to create a HTTP request to send. Do this with the following code. Replace `{YOUR APP KEY}` with the key you generated earlier. Don't include the `{}`.

```
let request = NSURLRequest(URL: NSURL(string: "http://api.openweathermap.org/data/2.5/weather?zip=37240,us&appid={YOUR APP KEY}")!)
```

Check it out -- we ask for the weather at Vanderbilt's zip code. We have to provide our appid so the weather API knows who we are. Now that we've created the request, lets send it!

```
NSURLSession.sharedSession().dataTaskWithRequest(request) {
    (data, response, error) in

}.resume()
```

This sends the request in the background and gives us the opportunity to say what to do when we get the data back. After the *in* and before the *}*, put the following code:

```
let httpResponse = response as! NSHTTPURLResponse
            
if (httpResponse.statusCode == 200) {
    let jsonResult: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary

}
```

If the request was successful, the status code will be 200. In that case we would like to update the labels in our view. We can do this like so:

```
dispatch_async(dispatch_get_main_queue()) {
    self.temperatureLabel.text = self.getFahrenheitStringForKelvin(jsonResult["main"]!["temp"]! as! Double)
    self.descriptionLabel.text = jsonResult["weather"]![0]["description"]! as? String
}
```

Note that we can only make changes to the user interface in the *main thread*. Because we are sending the request in the background, we have to use dispatch_async to tell the application to run the code in the main thread instead.

Finally, we just need to define the conversion from Kelvin to Fahrenheit:

```
func getFahrenheitStringForKelvin(kelvin: Double) -> String {
    return "\(kelvin * 9 / 5 - 459.67)°"
}
```

And that's it! Your application will now fetch the current weather data each time the view is about to appear.

## Challenge

If you're looking for a little extra something to do, try this:
- Make a text input so the user can specify the zip code to get weather data for. In this case, we'll also want to display the city for that zip code. No fear! The response to the API call has the city name in its structure.
- Also display the low and high for the day. The response also includes this.
- Integrate another API, like sports or bus data. Display something cool in your app!