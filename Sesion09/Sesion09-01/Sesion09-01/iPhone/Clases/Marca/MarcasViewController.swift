//
//  MarcaViewController.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/4/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class MarcasViewController: UIViewController {

    @IBOutlet weak var tlbMarcas: UITableView!

    var arrayMarcas = [Marca]()
    
    func crearActionEliminar(indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .destructive, title: "Eliminar") { (_, _, _) in
            
            let objMarca = self.arrayMarcas[indexPath.row]
            self.arrayMarcas.remove(at: indexPath.row)
            MarcaBL.eliminar(objMarca)
            
            self.tlbMarcas.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return action
    }
    
    func crearActionMostrarWeb(indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: "Ir a la web") { (_, _, _) in
            let objMarca = self.arrayMarcas[indexPath.row]
    
            if let url = URL(string: objMarca.urlWeb ?? ""), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }else{
                print("NO SE PUEDE ABRIR LA WEB.")
            }
        }
        
        return action
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.arrayMarcas = MarcaBL.listar()
        self.tlbMarcas.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? DetalleMarcaViewController {
            controller.objMarca = sender as? Marca
        }
    }
}

extension MarcasViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMarcas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MarcaTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MarcaTableViewCell
        cell.objMarca = self.arrayMarcas[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objMarca = self.arrayMarcas[indexPath.row]
        self.performSegue(withIdentifier: "DetalleMarcaViewController", sender: objMarca)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionWeb = self.crearActionMostrarWeb(indexPath: indexPath)
        let actionEliminar = self.crearActionEliminar(indexPath: indexPath)
        
        let arrayActions = [actionEliminar, actionWeb]
        
        let actionConfiguration = UISwipeActionsConfiguration(actions: arrayActions)
        return actionConfiguration
    }
}


