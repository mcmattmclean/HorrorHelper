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
        descriptionField.text = "lorem fdjsk ghfjdksl ghfjdksl ghfjdksl gfhjdkslg fhjdkslghfjdksl gfhjdkslg fhjdkslgfhjkdlsghfkdlghjkdalrvaebv jreklvbrksl vmnrslkv dnrsklv rjdsklvndrsjklv jrslnjkrl"
    }
    
    @IBOutlet weak var hollyButton: UIButton!
    @IBAction func textOut(_ sender: Any) {
        descriptionField.text = "bob ger sux"
    }
    
}

