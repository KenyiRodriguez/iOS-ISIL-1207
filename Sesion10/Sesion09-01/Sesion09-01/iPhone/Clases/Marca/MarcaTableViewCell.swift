//
//  MarcaTableViewCell.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/4/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class MarcaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPais: UILabel!
    
    var objMarca: Marca! {
        didSet{
            self.actualizarData()
        }
    }
    
    func actualizarData() {
        self.lblNombre.text = self.objMarca.nombre ?? "--"
        self.lblPais.text = self.objMarca.paisOrigen ?? "No especificado"
    }
}
