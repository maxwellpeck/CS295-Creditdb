//
//  ItemsViewController.swift
//  Creditdb
//
//  Created by Maxwell Peck on 3/27/20.
//  Copyright © 2020 Maxwell Peck. All rights reserved.
//

import UIKit

//====================================================================================================

//DetailViewController: Manages master view
class ItemsViewController: UITableViewController {
    
    //itemStore: ItemStore manages the organization and storage of the Item (card) objects.
    var itemStore: ItemStore!
    
    //------------------------------------------------------------------------------------------------
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    //------------------------------------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
        //If any card (Item) in table is marked as "item.deleted = true" then delete the card (Item):
        //Keep track of which row # an item needs to be deleted at with a counter:
        var rowNum = 0
        
        //Loop through all ites:
        for item in itemStore.allItems {
            
            //Check if it was marked as "deleted" in DetailView
            if (item.deleted == true) {
                
                //Remove the item from the store:
                itemStore.removeItem(item)
                
                //Also remove that row from the table view with an animation:
                let indexPath = IndexPath(row: rowNum, section: 0)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            //Add to the counter after each iteration:
            rowNum += 1
        }
    }
    
    //------------------------------------------------------------------------------------------------
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        //Create a new item and add it to the store:
        let newItem = itemStore.createItem()
        
        //Find where that item is in the array:
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            //Insert new row into the table:
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    //------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    //------------------------------------------------------------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //If the triggered segue is the "showItem" segue:
        switch segue.identifier {
        case "showItem"?:
            //Find out which row was just tapped:
            if let row = tableView.indexPathForSelectedRow?.row {
                
                //Get the item associated with this row and pass it to DetailViewController
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
            } default:
                preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    //------------------------------------------------------------------------------------------------
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    //------------------------------------------------------------------------------------------------
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //item: Card (Item) to be displayed:
        let item = itemStore.allItems[indexPath.row]
        
        //Get ready to display card (Item) expiration date with DateFormatter():
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/YY"
        
        //If the card (Item) is marked as a creditCard:
        if (item.creditCard) {
            //Create a cell of type "ItemCell" to represent as a credit card:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
            cell.nameLabel.text = item.name
            cell.bankAndExpDate.text = "Credit Card" + " \u{2022} " + dateFormatter.string(from:item.expiration)
            cell.valueLabel.text = "$\(item.valueInDollars)"
            //If card (Item) has a balance of over $5,000, display in red:
            
            if (item.valueInDollars >= 5000) {
                cell.valueLabel.textColor = .red
                //If card (Item) has a balance of $0, display in green:
            } else if (item.valueInDollars == 0) {
                cell.valueLabel.textColor = .systemGreen
                //If card (Item) has a balance between $0 and $5,000, display in default color:
            } else {
                cell.valueLabel.textColor = nil
            }
            
            return cell
            
            //If the card (Item) is not marked as a creditCard:
        } else {
            //Create a cell of type "ItemCell2" to represent as a debit card:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell2", for: indexPath) as! ItemCell2
            cell.nameLabel.text = item.name
            cell.bankAndExpDate.text = item.bank + " Debit Card" + " \u{2022} " + dateFormatter.string(from:item.expiration)
            return cell
        }
    }
    
    //------------------------------------------------------------------------------------------------
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        
        //If user wants to delete:
        if editingStyle == .delete {
            //item: Card (Item) to be deleted:
            let item = itemStore.allItems[indexPath.row]
            
            //Configure an alert to ask user to be sure of deletion decision:
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title, message: message,
                                       preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {
                (action) -> Void in
            
                //Remove the item from the store:
                self.itemStore.removeItem(item)
                
                //Remove deleted row from the table view with an animation:
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            //Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    //------------------------------------------------------------------------------------------------
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    //------------------------------------------------------------------------------------------------
    
}
