//
//  DetailViewController.swift
//  Creditdb
//
//  Created by Maxwell Peck on 3/27/20.
//  Copyright © 2020 Maxwell Peck. All rights reserved.
//

import UIKit

//====================================================================================================

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var cardNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var bankField: UITextField!
    @IBOutlet var securityCodeField: UITextField!
    @IBOutlet var expirationPicker: UIDatePicker!
    @IBOutlet var creditCardPicker: UISwitch!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    //------------------------------------------------------------------------------------------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //------------------------------------------------------------------------------------------------
    
    @IBAction func deleteFromDetail(_ sender: UIBarButtonItem) {
        
        let title = "Delete \(item.name)?"
        let message = "Are you sure you want to delete this item?"
        
        let ac = UIAlertController(title: title, message: message,
                                   preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {
            (action) -> Void in
            self.item.deleted = true
            self.navigationController?.popViewController(animated: true)
        })
        ac.addAction(deleteAction)
        
        // Present the alert controller
        present(ac, animated: true, completion: nil)
    }
    
    //------------------------------------------------------------------------------------------------
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Clear first responder
        view.endEditing(true)
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.cardNumber = cardNumberField.text
        item.bank = bankField.text ?? ""
        item.securityCode = securityCodeField.text ?? ""
        item.expiration = expirationPicker.date
        item.creditCard = creditCardPicker.isOn
        if let valueText = valueField.text,
            let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
    }
    
    //------------------------------------------------------------------------------------------------
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    //------------------------------------------------------------------------------------------------
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    //------------------------------------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        nameField.text = item.name
        cardNumberField.text = item.cardNumber
        valueField.text =
            numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = "Date Added: " + dateFormatter.string(from: item.dateCreated)
        bankField.text = item.bank
        securityCodeField.text = item.securityCode
        expirationPicker.date = item.expiration
        creditCardPicker.isOn = item.creditCard
    }
    
    //------------------------------------------------------------------------------------------------
    
}
