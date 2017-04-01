//
//  Item.swift
//  SoloApp
//
//  Created by Rupert Waldron on 29/03/2017.
//  Copyright © 2017 RuppyRup. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding { // coding objects used for saving data
    
    static var Dir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = Dir.appendingPathComponent("savedItems") // saves to a place called Saved items
    //static let ArchiveURL = Dir.appendingPathComponent("Bob")
    
    var name: String
    
    required init(name: String) {
        self.name = name
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
}

//let myrup = Item(name: "bob")
