//
//  ModelosViewController.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ModelosViewController: UIViewController {

    @IBOutlet weak var clvModelo: UICollectionView!
    
    var arrayModelos = [Modelo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.arrayModelos = ModeloBL.listar()
        self.clvModelo.reloadData()
    }
}

extension ModelosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayModelos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "ModeloCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ModeloCollectionViewCell
        cell.objModelo = self.arrayModelos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: mostrar detalle del modelo.
    }
    
}

extension ModelosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cantidadColumnas: CGFloat = 2
        let anchoCollection = collectionView.frame.width
        let paddingLeft: CGFloat = 20.0
        let paddingRight: CGFloat = 20.0
        let separacion: CGFloat = 20.0 * (cantidadColumnas - 1)
        
        let anchoCelda = (anchoCollection - paddingLeft - paddingRight - separacion) / cantidadColumnas
        let altoCelda = anchoCelda * 0.6
        
        let tamano = CGSize(width: anchoCelda, height: altoCelda)
        return tamano
    }
}
