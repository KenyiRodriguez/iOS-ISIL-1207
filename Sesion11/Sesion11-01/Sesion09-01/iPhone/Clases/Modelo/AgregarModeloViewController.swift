//
//  AgregarModeloViewController.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AgregarModeloViewController: UIViewController {

    @IBOutlet weak var txtNombreModelo  : UITextField!
    @IBOutlet weak var txtFabricacion   : UITextField!
    @IBOutlet weak var txtTipoCarroceria: UITextField!
    @IBOutlet weak var txtURLImagen     : UITextField!
    @IBOutlet weak var loadingModelo    : UIActivityIndicatorView!
    
    var objMarca: Marca!
    
    @IBAction func clickBtnAgregar(_ sender: Any) {
        
        self.loadingModelo.startAnimating()
        self.view.isUserInteractionEnabled = false
        
        self.perform(#selector(self.agregar), with: nil, afterDelay: 3)
    }
    
    @objc func agregar() {
        
        let nombre      = self.txtNombreModelo.text
        let fabricacion = self.txtFabricacion.text
        let carroceria  = self.txtTipoCarroceria.text
        let urlImagen   = self.txtURLImagen.text
                
        ModeloBL.crear(fabricacion: fabricacion, nombre: nombre, tipoCarroceria: carroceria, urlImagen: urlImagen, success: { (objModelo) in
                
            self.loadingModelo.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            MarcaBL.agregarModelo(objModelo, enMarca: self.objMarca)
            self.navigationController?.popViewController(animated: true)
            
        }) { (mensajeError) in
            
            self.loadingModelo.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            print(mensajeError)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
