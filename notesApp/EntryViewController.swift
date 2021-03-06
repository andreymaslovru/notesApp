//
//  EntryViewController.swift
//  notesApp
//
//  Created by Андрей Маслов on 09.10.2021.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var errorHandlerInputLabel: UILabel!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapeSave))
        textField.placeholder = "Type the title of the note... "
    }
    
    @objc func didTapeSave() {
        if let text = textField.text, !text.isEmpty, !noteField.text.isEmpty {
            completion?(text, noteField.text)
        } else {
            errorHandlerInputLabel.isHidden = false
//            let alertController = UIAlertController(title: "ERROR", message: "Заполните все поля", preferredStyle: .alert)
//            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertController.addAction(alertAction)
//            present(alertController, animated: true, completion: nil)
        }
    }
}
 
