//
//  UserDefaultsHelper.swift
//  ListaTaferasApp
//
//  Created by Dev on 29/01/22.
//

import UIKit

class UserDefaultsHelper {
    
    let chave = "tarefasList"
    var tarefas: [String] = []
    
    func salvar(tarefa: String) {
        print(tarefa)
        tarefas = listar()
        tarefas.append(tarefa)
        
        UserDefaults.standard.setValue(tarefas, forKey: chave)
    }
    
    func listar() -> Array<String> {
        let dados = UserDefaults.standard.object(forKey: chave)
                   
        if dados != nil {
            return dados as! Array<String>
        } else {
            return []
        }
    }
    
    func remover(index: Int) {
        var dados = listar()
        
        dados.remove(at: index)
        UserDefaults.standard.setValue(dados, forKey: chave)
    }
}
