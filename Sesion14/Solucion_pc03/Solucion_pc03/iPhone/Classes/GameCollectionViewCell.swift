//
//  GameCollectionViewCell.swift
//  Solucion_pc03
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol GameCollectionViewCellDelegate {
    func gameCollectionViewCell(_ cell: GameCollectionViewCell, requestToDeleteGame game: Game)
}

public class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var lblNameGame: UILabel!
    @IBOutlet weak private var imgGame: UIImageView!
    
    var delegate: GameCollectionViewCellDelegate?
    
    lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressToDelete(_:)))
        return gesture
    }()
    
    public var objGame: Game! {
        didSet{
            self.updateData()
        }
    }
    
    @objc func longPressToDelete(_ sender: Any) {
        self.delegate?.gameCollectionViewCell(self, requestToDeleteGame: self.objGame)
    }
    
    private func updateData() {
        
        self.lblNameGame.text = self.objGame.name
        
        let urlImage = self.objGame.urlImage ?? ""
        self.imgGame.downloadImagenInUrl(urlImage, withPlaceHolderImage: nil) { (urlImageDownloaded, imageDownloaded) in
            
            if self.objGame.urlImage == urlImageDownloaded {
                self.imgGame.image = imageDownloaded
            }
        }
    }
    
    public override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        self.addGestureRecognizer(self.longPressGesture)
        
        self.backgroundColor = .clear
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.4
        
        self.contentView.layer.cornerRadius = 10
    }
}
