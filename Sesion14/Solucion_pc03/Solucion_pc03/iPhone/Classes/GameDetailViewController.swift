//
//  GameDetailViewController.swift
//  Solucion_pc03
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {

    @IBOutlet weak private var lblNameGame      : UILabel!
    @IBOutlet weak private var lblReleaseYear   : UILabel!
    @IBOutlet weak private var lblType          : UILabel!
    @IBOutlet weak private var lblDescription   : UILabel!
    @IBOutlet weak private var imgGame          : UIImageView!
    
    public var objGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblNameGame.text       = self.objGame.name ?? ""
        self.lblType.text           = self.objGame.type ?? ""
        self.lblDescription.text    = self.objGame.gameDescription ?? ""
        self.lblReleaseYear.text    = self.objGame.releaseYear ?? ""
        
        let urlImage = self.objGame.urlImage ?? ""
        self.imgGame.downloadImagenInUrl(urlImage, withPlaceHolderImage: nil) { (urlImageDownloaded, imageDownloaded) in
            
            if self.objGame.urlImage == urlImageDownloaded {
                self.imgGame.image = imageDownloaded
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
