//
//  ModeloDA.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/4/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import CoreData

class ModeloDA {
    
    class func crear(fabricacion: String, nombre: String, tipoCarroceria: String, contexto: NSManagedObjectContext) -> Modelo {
        
        let objDM = NSEntityDescription.insertNewObject(forEntityName: "Modelo", into: contexto) as! Modelo
        
        objDM.nombre            = nombre
        objDM.tipoCarroceria    = tipoCarroceria
        objDM.fabricacion       = fabricacion
        
        return objDM
    }
    
    class func listar(contexto: NSManagedObjectContext) -> [Modelo] {
        
        let fetchRequest: NSFetchRequest<Modelo> = Modelo.fetchRequest()
        
        let sortFabricacion = NSSortDescriptor(key: "fabricacion", ascending: false)
        let sortNombre = NSSortDescriptor(key: "nombre", ascending: true)
        
        fetchRequest.sortDescriptors = [sortFabricacion, sortNombre]
        
        do {
            let arrayResultado = try contexto.fetch(fetchRequest)
            return arrayResultado
        }catch {
            return []
        }
    }
    
    class func listarConTextoDeBusqueda(_ texto: String, contexto: NSManagedObjectContext) -> [Modelo] {
        
        let fetchRequest: NSFetchRequest<Modelo> = Modelo.fetchRequest()
        
        let predicado = NSPredicate(format: "modelo contains[c] %@ AND fabricacion == %@", texto, texto)
        fetchRequest.predicate = predicado
        
        let sortFabricacion = NSSortDescriptor(key: "fabricacion", ascending: false)
        let sortNombre = NSSortDescriptor(key: "nombre", ascending: true)
            
        fetchRequest.sortDescriptors = [sortFabricacion, sortNombre]
        
        do {
            let arrayResultado = try contexto.fetch(fetchRequest)
            return arrayResultado
        }catch {
            return []
        }
    }
}
