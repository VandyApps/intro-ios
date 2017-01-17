//
//  ViewController.swift
//  Calc
//
//  Created by Carlton Jester on 1/17/17.
//  Copyright © 2017 Carlton Jester. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aFieldOut: UITextField!
    @IBOutlet weak var bFieldOut: UITextField!
    @IBOutlet weak var ansLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func editingChanged(_ sender: UITextField) {
        guard let a = aFieldOut.text, let b = bFieldOut.text else {
            print("error")
            return
        }
        guard let ad = Double(a), let bd = Double(b) else{
            print("Not a number")
            return
        }
        
        self.ansLabel.text = "\(ad+bd)"
    }

}

