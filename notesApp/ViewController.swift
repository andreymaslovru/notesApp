//
//  ViewController.swift
//  notesApp
//
//  Created by Андрей Маслов on 09.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var models: [(title: String, note: String)] = []

    
    @IBOutlet weak var labelNoNotes: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBAction func didTapeAddItem(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? EntryViewController else { return }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {textField, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: textField, note: note))
            self.labelNoNotes.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title="Notes App"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else { return }
        
        let item = models[indexPath.row]
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.titleNote = item.title
        vc.descNote = item.note
        navigationController?.pushViewController(vc, animated: true)
    }
}

