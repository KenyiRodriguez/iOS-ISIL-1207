//
//  DetalleModeloViewController.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class DetalleModeloViewController: UIViewController {

    @IBOutlet weak var imgModelo        : UIImageView!
    @IBOutlet weak var lblNombre        : UILabel!
    @IBOutlet weak var lblFabricacion   : UILabel!
    @IBOutlet weak var lblTipo          : UILabel!
    @IBOutlet weak var lblMarca         : UILabel!
    
    var objModelo: Modelo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblMarca.text          = self.objModelo.marca?.nombre ?? ""
        self.lblNombre.text         = self.objModelo.nombre ?? ""
        self.lblFabricacion.text    = self.objModelo.fabricacion ?? ""
        self.lblTipo.text           = self.objModelo.tipoCarroceria ?? ""
        
        let urlImagen = self.objModelo.urlImagen ?? ""
        let imgPlaceholder = UIImage(named: "placeholder")
        
        self.imgModelo.downloadImagenInUrl(urlImagen, withPlaceHolderImage: imgPlaceholder) { (_, imagenDescargada) in
            self.imgModelo.image = imagenDescargada
        }
        
    }
}
