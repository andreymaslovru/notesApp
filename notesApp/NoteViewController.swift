//
//  NoteViewController.swift
//  notesApp
//
//  Created by Андрей Маслов on 09.10.2021.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descrLabel: UILabel!
    
    public var titleNote: String? = ""
    public var descNote: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleNote
        descrLabel.text = descNote
    }
}
