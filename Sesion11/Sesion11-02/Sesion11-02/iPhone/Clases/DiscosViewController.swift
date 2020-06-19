//
//  DiscosViewController.swift
//  Sesion11-02
//
//  Created by Kenyi Rodriguez on 6/18/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class DiscosViewController: UIViewController {

    @IBOutlet weak var clvDiscos: UICollectionView!
    
    var arrayDiscos = [DiscoBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DiscoBL.obtenerDiscos { (arrayDiscos) in
            self.arrayDiscos = arrayDiscos
            self.clvDiscos.reloadData()
        }
    }
}

extension DiscosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayDiscos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "DiscoCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DiscoCollectionViewCell
        cell.objDisco = self.arrayDiscos[indexPath.row]
        return cell
    }
}

extension DiscosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numeroColumnas: CGFloat = 2
        let anchoCollection = collectionView.frame.width
        let paddingDerecha: CGFloat = 20
        let paddingIzquierda: CGFloat = 20
        let separacionCelda: CGFloat = 20
        
        let tamanoDisponible = anchoCollection - paddingDerecha - paddingIzquierda - separacionCelda*(numeroColumnas - 1)
        let anchoCelda = tamanoDisponible / numeroColumnas
        let altoCelda = anchoCelda * 1.5
        
        let tamano = CGSize(width: anchoCelda, height: altoCelda)
        return tamano
    }
}
