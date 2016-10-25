//
//  ViewController.swift
//  Orderer
//
//  Created by Ethan Look on 9/27/16.
//  Copyright © 2016 Ethan Look. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let foods = ["Pizza", "Hamburger", "Tacos", "Hot Dog", "Mac and Cheese", "Nachos"]
    let orderCount = [0, 0, 0, 0, 0, 0]
    
    @IBOutlet var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    let foodSegueIdentifier = "ShowFoodSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = foods[row]
        cell.detailTextLabel?.text = "\(orderCount[row]) ordered"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print("\(foods[row]) ordered \(orderCount[row]) times")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == foodSegueIdentifier,
            let destination = segue.destinationViewController as? FoodViewController,
            foodIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.foodName = foods[foodIndex]
            destination.orderCount = orderCount[foodIndex]
        }
    }
}

