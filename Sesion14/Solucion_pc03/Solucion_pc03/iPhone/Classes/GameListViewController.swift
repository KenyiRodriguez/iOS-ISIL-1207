//
//  GameListViewController.swift
//  Solucion_pc03
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController {

    @IBOutlet weak var clvGames: UICollectionView!
    
    var arrayGame: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.arrayGame = GameBL.listAll()
        self.clvGames.reloadSections(IndexSet(integer: 0))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? GameDetailViewController {
            controller.objGame = sender as? Game
        }
    }
}

extension GameListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            self.arrayGame = GameBL.listAll()
        }else{
            self.arrayGame = GameBL.listByKeySearch(keySearch: searchText)
        }
        
        self.clvGames.reloadSections(IndexSet(integer: 0))
    }
}

extension GameListViewController: GameCollectionViewCellDelegate {
    
    func gameCollectionViewCell(_ cell: GameCollectionViewCell, requestToDeleteGame game: Game) {
        
        self.showAlert(withTitle: "GameStore", withMessage: "¿Deseas eliminar el juego \(game.name ?? "-")", withButtons: ["Aceptar"], withCancelButton: "Cancelar", withSelectionButtonIndex: { (_) in
            
            let appDelegateClass = UIApplication.shared.delegate as! AppDelegate
            
            //Eliminas del array
            guard let index = self.arrayGame.firstIndex(of: game) else { return }
            self.arrayGame.remove(at: index)
            
            //Eliminas de la tabla
            let indexPath = IndexPath(item: index, section: 0)
            self.clvGames.deleteItems(at: [indexPath])
            
            //Eliminas de la base de datos
            appDelegateClass.persistentContainer.viewContext.delete(game)
            appDelegateClass.saveContext()
            
            
        }, withActionCancel: nil)
    }
}

extension GameListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayGame.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdenfier = "GameCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdenfier, for: indexPath) as! GameCollectionViewCell
        cell.objGame = self.arrayGame[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "GameDetailViewController", sender: self.arrayGame[indexPath.row])
    }
}

extension GameListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftPadding     : CGFloat = 20
        let rightPadding    : CGFloat = 20
        let spaceColum      : CGFloat = 20
        let numberOfColumns : CGFloat = 2
        
        let availableWidth = collectionView.frame.width - leftPadding - rightPadding - (spaceColum * (numberOfColumns - 1))
        let widthCell = availableWidth / numberOfColumns
        let heightCell = widthCell * 1.5
        
        return CGSize(width: widthCell, height: heightCell)
    }
}
