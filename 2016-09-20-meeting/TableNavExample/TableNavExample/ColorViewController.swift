//
//  ColorViewController.swift
//  TableNavExample
//
//  Created by Ethan Look on 9/20/16.
//  Copyright © 2016 Ethan Look. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet var colorLabel: UILabel!
    
    var colorName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        colorLabel.text = colorName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
