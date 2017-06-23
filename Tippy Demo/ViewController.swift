//
//  ViewController.swift
//  Tippy Demo
//
//  Created by Nicolas Rodriguez on 6/20/17.
//  Copyright © 2017 Nicolas Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var total2Label: UILabel!
    @IBOutlet weak var total3Label: UILabel!
    @IBOutlet weak var total4Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipArray = defaults.array(forKey: "new_tip_array")
        for i in 0..<3 {
            tipControl.setTitle(String(describing: tipArray![i]), forSegmentAt: i)
        }
        
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        var tipPercentages: [Double] = []
        for i in 0..<3 {
            let newNum = String(describing: tipControl.titleForSegment(at: i)!)
            let index = newNum.index(newNum.startIndex, offsetBy: 2)
            let subNum = newNum.substring(to: index)
            var subInt: Double? = Double(subNum)
            subInt = subInt!/100
            tipPercentages.append(subInt!)
        }
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        total2Label.text = String(format: "$%.2f", total/2)
        total3Label.text = String(format: "$%.2f", total/3)
        total4Label.text = String(format: "$%.2f", total/4)
    }
}

