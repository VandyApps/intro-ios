//
//  ViewController.swift
//  SimpleWeather
//
//  Created by Ethan Look on 11/1/16.
//  Copyright © 2016 Ethan Look. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        getCurrentWeatherForNashville()
    }
    
    func getCurrentWeatherForNashville() {
        // Set the URL where we're making the request
        let request = NSURLRequest(URL: NSURL(string: "http://api.openweathermap.org/data/2.5/weather?zip=37240,us&appid=56a5d3ff1659e7c511072d44d0997644")!)
        
        // Perform the request
        NSURLSession.sharedSession().dataTaskWithRequest(request) {
            (data, response, error) in

            let httpResponse = response as! NSHTTPURLResponse
            
            if (httpResponse.statusCode == 200) {
                let jsonResult: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.temperatureLabel.text = self.getFahrenheitStringForKelvin(jsonResult["main"]!["temp"]! as! Double)
                    self.descriptionLabel.text = jsonResult["weather"]![0]["description"]! as? String
                }
            }
        }.resume()
    }
    
    func getFahrenheitStringForKelvin(kelvin: Double) -> String {
        return "\(kelvin * 9 / 5 - 459.67)°"
    }
}

