//
//  GameBL.swift
//  Solucion_pc03
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class GameBL {
    
    typealias GameSuccess = (_ game: Game) -> Void
    typealias GameError = (_ errorMessage: String) -> Void
    
    class func create(name: String?, type: String?, releaseYear: String?, gameDescription: String?, urlImage: String?, success: GameSuccess, error: GameError) {
        
        guard let safeName = name, safeName.count != 0 else {
            error("Ingrese un nombre correcto")
            return
        }
        
        guard let safeReleaseYear = releaseYear, safeReleaseYear.count != 0 else {
            error("Ingrese un nombre correcto")
            return
        }
        
        guard let safeGameDescription = gameDescription, safeGameDescription.count != 0 else {
            error("Ingrese un nombre correcto")
            return
        }
        
        guard let safeType = type, safeType.count != 0 else {
            error("Ingrese un nombre correcto")
            return
        }
        
        guard let safeUrlImage = urlImage, safeUrlImage.count != 0 else {
            error("Ingrese un nombre correcto")
            return
        }
        
        let appDelegateClass = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateClass.persistentContainer.viewContext
        
        let objGame = GameDA.create(name: safeName,
                                    type: safeType,
                                    releaseYear: safeReleaseYear,
                                    gameDescription: safeGameDescription,
                                    urlImage: safeUrlImage,
                                    context: context)
        
        appDelegateClass.saveContext()
        success(objGame)
    }
    
    class func listAll() -> [Game] {
        
        let appDelegateClass = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateClass.persistentContainer.viewContext
        return GameDA.listAll(context: context)
    }
    
    class func listByKeySearch(keySearch: String) -> [Game] {
        
        let appDelegateClass = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateClass.persistentContainer.viewContext
        return GameDA.listByKeySearch(keySearch: keySearch, context: context)
    }
}
