//
//  SettingsViewController.swift
//  Tippy Demo
//
//  Created by Nicolas Rodriguez on 6/20/17.
//  Copyright © 2017 Nicolas Rodriguez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultControl: UISegmentedControl!
    @IBOutlet weak var tipField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipArray = defaults.array(forKey: "new_tip_array")
        for i in 0..<3 {
            defaultControl.setTitle(String(describing: tipArray![i]), forSegmentAt: i)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func tipChange(_ sender: Any) {
        var tipArray: [String] = []
        let defaults = UserDefaults.standard
        
        let newTitle = String(describing: tipField.text!) + "%"
        
        if defaultControl.selectedSegmentIndex == 0 {
            defaultControl.setTitle(newTitle, forSegmentAt: 0)
        }
        else if defaultControl.selectedSegmentIndex == 1 {
            defaultControl.setTitle(newTitle, forSegmentAt: 1)
        }
        else {
            defaultControl.setTitle(newTitle, forSegmentAt: 2)
        }
        for i in 0..<3 {
            tipArray.append(defaultControl.titleForSegment(at: i)!)
        }
    
        defaults.set(tipArray, forKey: "new_tip_array")
        defaults.synchronize()
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
