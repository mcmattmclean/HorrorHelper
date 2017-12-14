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

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var setTextButton: UIButton!
    
    @IBAction func updateText(_ sender: Any) {
        textField.text = "Hi Holly"
    }
    
    @IBOutlet weak var hollyButton: UIButton!
    @IBAction func textOut(_ sender: Any) {
        textField.text = "bob ger sux"
    }
    
    @IBOutlet weak var mySlider: UISlider!
    @IBAction func slidey(_ sender: Any) {
        textField.text = String(self.mySlider.value)
    }
    
    
    @IBOutlet weak var myStepper: UIStepper!
    @IBAction func steppy(_ sender: Any) {
        
    }
    
    
}

