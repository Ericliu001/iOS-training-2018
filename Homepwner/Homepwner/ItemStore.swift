//
//  ItemStore.swift
//  Homepwner
//
//  Created by Eric Liu on 6/12/18.
//  Copyright © 2018 Eric Liu. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems: Array<Item> = []
    let itemArchiveURL: URL = {
        let documentsDirectories =
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    init(count: Int) {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems = archivedItems
        } else {
            for _ in 0..<count {
                createItem()
            }
        }
    }
    
    
    @discardableResult func createItem () -> Item {
        let item = Item(random: true)
        
        allItems.append(item)
        return item
    }
    
    func saveChanges () -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
    
    
}
