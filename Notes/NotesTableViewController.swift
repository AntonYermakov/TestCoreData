//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Yermakov Anton on 22.09.17.
//  Copyright © 2017 Yermakov Anton. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    var notes = [Notes]()
    let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
           tableView.reloadData()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
           updateUI()
              tableView.reloadData()
    }

    
    private func updateUI(){
        let context = container
        
        do{
            notes = try context.fetch(Notes.fetchRequest())
        } catch {
            print (error.localizedDescription)
        }
        
    }
    
  

    override func numberOfSections(in tableView: UITableView) -> Int {
           return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NotesTableViewCell
        
        let notes = self.notes[indexPath.row]
        
        cell.noteName.text = notes.header
        cell.noteDescription.text = notes.desc

        return cell
    }
    

    
   
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
    }
    

    
  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        let context = container
        
            if editingStyle == .delete {
              let notes = self.notes[indexPath.row]
                context.delete(notes)
            }
        
        try? context.save()
        tableView.reloadData()
    }
    

}
