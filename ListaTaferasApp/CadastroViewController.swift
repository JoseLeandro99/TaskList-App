//
//  CadastroViewController.swift
//  ListaTaferasApp
//
//  Created by Dev on 29/01/22.
//

import UIKit

class CadastroViewController : UIViewController {
    
    @IBOutlet weak var txtTafera: UITextField!
    
    @IBAction func salvarTarefa(_ sender: Any) {
        if let tarefa = txtTafera.text {
            let helper = UserDefaultsHelper()
            helper.salvar(tarefa: tarefa)
            
            view.endEditing(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
