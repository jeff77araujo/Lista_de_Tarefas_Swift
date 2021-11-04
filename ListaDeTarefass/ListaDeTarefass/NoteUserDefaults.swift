//
//  NoteUserDefaults.swift
//  ListaDeTarefas
//
//  Created by Jefferson Oliveira de Araujo on 02/11/21.
//

import UIKit

class NoteUserDefaults {
    
    let keyNote = "note"
    var notes: [String] = []
    
    func save(note: String) {
        notes = listNotes()
        notes.append(note)
        UserDefaults.standard.setValue(notes, forKey: keyNote)
    }
    
    func listNotes() -> Array<String> {
        if let data = UserDefaults.standard.object(forKey: keyNote) {
            return data as! Array<String>
        }
        return []
    }
    
    func delete(index: Int) {
        notes = listNotes()
        notes.remove(at: index)
        UserDefaults.standard.setValue(notes, forKey: keyNote)
    }
}
