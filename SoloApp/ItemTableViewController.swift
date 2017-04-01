//
//  ItemTableViewController.swift
//  SoloApp
//
//  Created by Rupert Waldron on 29/03/2017.
//  Copyright © 2017 RuppyRup. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var itemsArray = [Item]()

    func loadSampleItems() {
        
        
        itemsArray += [Item(name:"Item 1"), Item(name:"Item 2"), Item(name:"Item 3")]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleItems() // adds Items to the array
        navigationItem.leftBarButtonItem = editButtonItem //adds edit button to items can be deleted.Need to also implement to editting override function added as a template and update the code.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell

        let showItem = itemsArray[indexPath.row]
        cell.nameLabel.text = showItem.name
        return cell
    } 
    
    // Add method for destination view when save is pressed
    @IBAction func unwindToList(sender: UIStoryboardSegue) {
        let srcViewCon = sender.source as? ViewController // downcast segues source ViewController as type ViewController
        let savedItem = srcViewCon?.myItem
        if (srcViewCon != nil && savedItem?.name != "") { //use for editing items to update the selected row
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                itemsArray[selectedIndexPath.row] = savedItem!
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else { // For new row adds a row at the bottom for the new item
                let newIndexPath = IndexPath(row: itemsArray.count, section: 0)
                itemsArray.append(savedItem!)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
        }
    }
    
    // Segue activated when an item is pressed. Gives a value to myItem
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as! ViewController
           
            if let selectedCell = sender as? ItemTableViewCell {
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedItem = itemsArray[indexPath.row]
                detailVC.myItem = selectedItem //Viewcontroller has the Item: myItem defined
            }
        }
        else if segue.identifier == "AddItem" {
            
        }
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //Override to support editing the table view. Used when adding the editing button to remove the item from the ItemArray.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.itemsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
