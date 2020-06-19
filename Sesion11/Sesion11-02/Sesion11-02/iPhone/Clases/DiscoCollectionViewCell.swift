//
//  DiscoCollectionViewCell.swift
//  Sesion11-02
//
//  Created by Kenyi Rodriguez on 6/18/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class DiscoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgDisco: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    
    var objDisco: DiscoBE!{
        didSet{
            self.actualizarData()
        }
    }
    
    func actualizarData() {
        
        self.lblNombre.text = self.objDisco.disco_nombre
        
        let url = self.objDisco.disco_urlImagen
        self.imgDisco.downloadImagenInUrl(url, withPlaceHolderImage: nil) { (urlDescarga, imagenDescargada) in
            
            if self.objDisco.disco_urlImagen == urlDescarga {
                self.imgDisco.image = imagenDescargada
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        
        self.contentView.layer.cornerRadius = 10
    }
}
