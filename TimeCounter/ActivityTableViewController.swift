//
//  ActivityTableViewController.swift
//  TimeCounter
//
//  Created by Agnius Pazecka on 20/01/2019.
//  Copyright © 2019 Agnius Pazecka. All rights reserved.
//

import UIKit
import RealmSwift


class ActivityTableViewController: UITableViewController {
    
    var categories: Results<Category>?

    let realm = try! Realm()
    

   
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
    }

    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories?.count ?? 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath)

        // Configure the cell...
        guard let category = categories?[indexPath.row] else { fatalError() }
        cell.textLabel?.text = category.name
        
        return cell
    }
 

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ActivityToClock", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! TestViewController
//        }
    
    @IBAction func unwindActivityTableView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController {
        }
    }
    
    //temp saving to realm method
    func save(category: Category) {

        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category context \(error)")
        }
        tableView.reloadData()
    }
//
    func loadCategories() {

        categories = realm.objects(Category.self)

        tableView.reloadData()
        //tableView.rowHeight = 40
        
    }
    
    @IBAction func addCategoryButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add New", style: .default) { (action) in
            // what will happen once user clics + on nav bar
            
            let newItem = Category()
            newItem.name = textField.text!
            
            
            //storing array to default location
            //self.defaults.set(self.todoItems, forKey: "TodoListArray")
            
            self.save(category: newItem)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add text there"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)

    }
    
    
    
    
    
    
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


