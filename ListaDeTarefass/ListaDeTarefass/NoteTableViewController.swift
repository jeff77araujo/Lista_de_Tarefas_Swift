//
//  TarefasTableViewController.swift
//  ListaDeTarefas
//
//  Created by Jefferson Oliveira de Araujo on 02/11/21.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    var notes: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateList()
    }
    
    func updateList() {
        let note = NoteUserDefaults()
        notes = note.listNotes()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellItem", for: indexPath)

        cell.textLabel?.text = notes[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let note = NoteUserDefaults()
            note.delete(index: indexPath.row)
            updateList()
        }
    }
}
