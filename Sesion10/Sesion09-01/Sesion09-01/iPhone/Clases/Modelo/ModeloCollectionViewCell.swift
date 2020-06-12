//
//  ModeloTableViewCell.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ModeloCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblModelo: UILabel!
    @IBOutlet weak var imgModelo: UIImageView!
    
    var objModelo: Modelo! {
        didSet{
            self.actualizarData()
        }
    }
    
    func actualizarData() {
        self.lblModelo.text = self.objModelo.nombre ?? "--"
        
        let imgPlaceholder = UIImage(named: "placeholder")
        
        self.imgModelo.downloadImagenInUrl(self.objModelo.urlImagen ?? "", withPlaceHolderImage: imgPlaceholder) { (urlDescarga, imagenDescargada) in
            
            if urlDescarga == self.objModelo.urlImagen {
                self.imgModelo.image = imagenDescargada
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        self.backgroundColor = .clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = false
    }
    
}
