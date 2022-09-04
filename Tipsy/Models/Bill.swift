//
//  Bill.swift
//  Tipsy
//
//  Created by Sergio Ordaz Romero on 04/09/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    private var bill: Float
    private var persons: Int
    private var percentage: String
    
    init(bill: Float, persons: Int, percentage: String) {
        self.bill = bill
        self.persons = persons
        self.percentage = percentage
    }
    
    func getSplitBill() -> String {
        let index = self.percentage.firstIndex(of: "%")
        let percentage = Float(self.percentage[..<index!])!
        let billWithPercentage =  1.0 + (percentage / 100.0)
        let totalBill = bill * billWithPercentage
        
        return String(format: "%.2f", totalBill / Float(persons))
    }
    
    func getSettings() -> String {
        return "Dividido entre \(persons) personas, con \(percentage) de propina."
    }
}
