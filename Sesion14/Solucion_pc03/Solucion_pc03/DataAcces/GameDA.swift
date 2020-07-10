//
//  GameDA.swift
//  Solucion_pc03
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import CoreData

class GameDA {
 
    class func create(name: String, type: String, releaseYear: String, gameDescription: String, urlImage: String, context: NSManagedObjectContext) -> Game {
        
        let objDM = NSEntityDescription.insertNewObject(forEntityName: "Game", into: context) as! Game
        
        objDM.name              = name
        objDM.type              = type
        objDM.releaseYear       = releaseYear
        objDM.gameDescription   = gameDescription
        objDM.urlImage          = urlImage
        
        return objDM
    }
    
    class func listAll(context: NSManagedObjectContext) -> [Game] {
        
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        
        let sortName = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortName]
        
        do {
            let arrayResult = try context.fetch(fetchRequest)
            return arrayResult
        }catch {
            return []
        }
    }
    
    class func listByKeySearch(keySearch: String, context: NSManagedObjectContext) -> [Game] {
        
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        
        let predicate = NSPredicate(format: "name contains[c] %@", keySearch)
        fetchRequest.predicate = predicate
        
        let sortName = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortName]
        
        do {
            let arrayResult = try context.fetch(fetchRequest)
            return arrayResult
        }catch {
            return []
        }
    }
}
