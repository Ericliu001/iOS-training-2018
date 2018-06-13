//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Eric Liu on 6/13/18.
//  Copyright © 2018 Eric Liu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var serialNumberField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    var item: Item!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = "\(item.valueInDollars)"
        dateLabel.text = "\(item.dateCreated)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        
       
        item.valueInDollars = Int(valueField.text!) ?? 0
    }
}
