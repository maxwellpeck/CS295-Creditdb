//
//  ItemStore.swift
//  Creditdb
//
//  Created by Maxwell Peck on 3/27/20.
//  Copyright © 2020 Maxwell Peck. All rights reserved.
//

import UIKit

//====================================================================================================

//ItemStore Class: ItemStore manages the organization and storage of the Item (card) objects.
class ItemStore {
    
    var allItems = [Item]()
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    //------------------------------------------------------------------------------------------------
    
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems = archivedItems }
    }

    //------------------------------------------------------------------------------------------------
    
    func saveChanges() -> Bool {
    print("Saving items to: \(itemArchiveURL.path)")
    return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path) }
    
    //------------------------------------------------------------------------------------------------
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(new: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    //------------------------------------------------------------------------------------------------
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index) }
    }
    
    //------------------------------------------------------------------------------------------------
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove item from array
        allItems.remove(at: fromIndex)
        
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
}
