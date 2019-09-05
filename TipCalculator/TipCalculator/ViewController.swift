//
//  ViewController.swift
//  TipCalculator
//
//  Created by Lykøs on 9/4/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var percentControl: UISegmentedControl!
    @IBOutlet weak var inputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func CalcTip(_ sender: Any) {
        let tipPercent = [0.10, 0.15];
        let bill = Double(inputField.text!) ?? 0;
        let tip = (bill * tipPercent[percentControl.selectedSegmentIndex]);
        let total = tip + bill;
        tipLabel.text = String(format:"$%.2f",tip);
        totalLabel.text = String(format:"$%.2f",total);
    }
    
}

