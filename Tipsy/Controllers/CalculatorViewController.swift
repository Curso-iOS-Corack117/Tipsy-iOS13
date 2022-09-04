//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var currentSelected: UIButton!
    var bill: Bill!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentSelected = tenPctButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ResultsViewController
        destination.totalValue = bill.getSplitBill()
        destination.settingsValue = bill.getSettings()
    }
    
    @IBAction func tipChange(_ sender: UIButton) {
        sender.isSelected = true
        currentSelected.isSelected = false
        currentSelected = sender
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let percentage = currentSelected.currentTitle!
        guard let billValue = Float(billTextField.text!) else { return }
        guard let persons = Int(splitNumberLabel.text!) else { return }
        
        bill = Bill(bill: billValue, persons: persons, percentage: percentage)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
}

