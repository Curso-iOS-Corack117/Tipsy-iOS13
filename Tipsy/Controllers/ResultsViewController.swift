//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Sergio Ordaz Romero on 03/09/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var totalValue: String!
    var settingsValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "$" + totalValue
        settingsLabel.text = settingsValue
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
