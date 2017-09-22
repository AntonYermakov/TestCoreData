//
//  AddNotesViewController.swift
//  Notes
//
//  Created by Yermakov Anton on 22.09.17.
//  Copyright © 2017 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class AddNotesViewController: UIViewController {
    
    let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var noteHeader: UITextField!
    @IBOutlet weak var noteDescription: UITextView!
    
    
    @IBAction func addNote(_ sender: UIButton) {
        addNewNote()
    }
    
    private func addNewNote(){
        
         let context = container
        
              context.perform {
            
                let notes = Notes(context: context)
                
                if self.noteHeader.text != "" && self.noteDescription.text != ""{
                    
                     notes.header = self.noteHeader.text
                     notes.desc = self.noteDescription.text
            }
                self.noteHeader.text = ""
                self.noteDescription.text = ""
        }
        
        do {
           try context.save()
        } catch {
            print (error.localizedDescription)
        }
        
    }
}


