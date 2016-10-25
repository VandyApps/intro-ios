//
//  FoodViewController.swift
//  Orderer
//
//  Created by Ethan Look on 9/27/16.
//  Copyright © 2016 Ethan Look. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    @IBOutlet var foodImage: UIImageView!
    var foodName = ""
    @IBOutlet var orderCountLabel: UILabel!
    var orderCount = 0
    
    var delegate: TableViewDetailDelegate?
    var indexPath: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        print ("\(foodName).png")
        foodImage.image = UIImage(named: foodName)!
        updateOrderCount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
