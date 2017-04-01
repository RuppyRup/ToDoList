//
//  ViewController.swift
//  SoloApp
//
//  Created by Rupert Waldron on 29/03/2017.
//  Copyright © 2017 RuppyRup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var myItem : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Updates the label text field with the item that has been selected for edit
        if let editItem = myItem {
            nameTextField.text = editItem.name
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    // Saves the item when the save button on the header bar is pressed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as AnyObject? === saveButton {
            let name = nameTextField.text ?? "" // returns value as optional if it has a value otherwise returns a default value
            myItem = Item(name: name)
        }
    }
 
    /*@IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        print("Does this work")
    }*/
    
  
}

