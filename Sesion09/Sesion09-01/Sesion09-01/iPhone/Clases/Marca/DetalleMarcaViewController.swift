//
//  DetalleMarcaViewController.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/4/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class DetalleMarcaViewController: UIViewController {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPais  : UILabel!
    @IBOutlet weak var btnWeb   : UIButton!
       
    var objMarca: Marca!
       
    @IBAction func clickBtnWeb(_ sender: Any) {
        
        if let url = URL(string: self.objMarca.urlWeb ?? ""), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }else{
            print("NO SE PUEDE ABRIR LA WEB.")
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.lblNombre.text = self.objMarca.nombre ?? "--"
        self.lblPais.text = self.objMarca.paisOrigen ?? "No especificado"
        self.btnWeb.setTitle(self.objMarca.urlWeb ?? "--", for: .normal)
    }

}
