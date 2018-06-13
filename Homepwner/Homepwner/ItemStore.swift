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
    
    init(count: Int) {
        for _ in 0..<count {
            createItem()
        }
    }
    
    
    @discardableResult func createItem () -> Item {
        let item = Item(random: true)
        
        allItems.append(item)
        return item
    }
}
