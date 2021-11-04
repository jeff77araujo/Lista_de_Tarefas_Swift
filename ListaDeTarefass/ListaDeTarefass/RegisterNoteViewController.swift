//
//  RegisterNoteViewController.swift
//  ListaDeTarefas
//
//  Created by Jefferson Oliveira de Araujo on 02/11/21.
//

import UIKit

class RegisterNoteViewController: UIViewController {
    
    static var identifier = String(describing: RegisterNoteViewController.self)

    @IBOutlet weak var noteTextField: UITextField!
    
    @IBAction func addNote(_ sender: Any) {
        if let newText = noteTextField.text {
            let note = NoteUserDefaults()
            note.save(note: newText)
            noteTextField.text = ""
            
            let dados = note.listNotes()
            print(dados)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
