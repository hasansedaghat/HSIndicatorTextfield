//
//  ViewController.swift
//  HSTextFieldExample
//
//  Created by Hasan Sedaghat on 10/23/19.
//  Copyright © 2019 Hasan Sedaghat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapToDismiss(_ sender: Any) {
        self.view.endEditing(true)
    }
    
}
