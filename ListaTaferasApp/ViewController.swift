//
//  ViewController.swift
//  ListaTaferasApp
//
//  Created by Dev on 28/01/22.
//

import UIKit

class ViewController: UITableViewController {

    var tarefas: [String] = []
    var helper: UserDefaultsHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helper = UserDefaultsHelper()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tarefas = helper.listar()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        helper.remover(index: indexPath.row)
        
        tarefas = helper.listar()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "reusable", for: indexPath)
        cell.textLabel?.text = tarefas[indexPath.row]
        return cell
    }
}

