//
//  ViewController.swift
//  HorrorHelper
//
//  Created by Matthew McLean on 12/13/17.
//  Copyright © 2017 McLeanSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var descriptionField: UILabel!
    
    @IBOutlet weak var setTextButton: UIButton!
    
    @IBAction func updateText(_ sender: Any) {
        descriptionField.text = "1. Refresh exhausted cards.\n\n2. Perform upkeep actions:\n\tBless\n\tCurse\n\tBank Loan\n\tRetainer\n\n3. Adjust skills within character's focus stat."
    }
    
    @IBOutlet weak var hollyButton: UIButton!
    @IBAction func textOut(_ sender: Any) {
        descriptionField.text = "bob ger sux"
    }
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var stepVal: UILabel!
    
    @IBAction func changeStepper(_ sender: Any) {
        stepVal.text = String(stepper.value)
        if(stepper.value > 6){
//            descriptionField.text = "You've won!"
//            descriptionField.textColor = UIColor.red
        }
    }
    
}

