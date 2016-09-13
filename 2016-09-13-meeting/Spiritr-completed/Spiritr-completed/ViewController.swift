//
//  ViewController.swift
//  Spiritr-completed
//
//  Created by Ethan Look on 9/13/16.
//  Copyright © 2016 Ethan Look. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var spiritLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        if (spiritLabel.text == "Anchor down!") {
            spiritLabel.text = "Go 'Dores!"
        } else {
            spiritLabel.text = "Anchor down!"
        }
    }

    
}

