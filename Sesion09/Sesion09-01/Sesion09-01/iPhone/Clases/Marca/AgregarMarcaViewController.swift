//
//  AgregarMarcaViewController.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/4/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AgregarMarcaViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtPais: UITextField!
    @IBOutlet weak var txtWeb: UITextField!
    
    @IBAction func clickBtnAgregar(_ sender: Any) {
        
        let nombre  = self.txtNombre.text
        let pais    = self.txtPais.text
        let web     = self.txtWeb.text
        
        MarcaBL.crear(nombre: nombre, pais: pais, web: web, success: { (objMarca) in
            
            print("Se agregó la marca: \(objMarca.nombre ?? "")")
            self.navigationController?.popViewController(animated: true)
            
        }) { (mensajeError) in
            
            print(mensajeError)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
