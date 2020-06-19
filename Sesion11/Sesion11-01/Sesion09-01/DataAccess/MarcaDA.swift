//
//  MarcaDA.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/4/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import CoreData

class MarcaDA {
    
    class func crear(nombre: String, pais: String, web: String, contexto: NSManagedObjectContext) -> Marca {
        
        let objDM = NSEntityDescription.insertNewObject(forEntityName: "Marca", into: contexto) as! Marca
        
        objDM.nombre        = nombre
        objDM.paisOrigen    = pais
        objDM.urlWeb        = web
        
        return objDM
    }
    
    class func listar(contexto: NSManagedObjectContext) -> [Marca] {
        
        let fetchRequest: NSFetchRequest<Marca> = Marca.fetchRequest()
        
        let sortPais = NSSortDescriptor(key: "paisOrigen", ascending: false)
        let sortNombre = NSSortDescriptor(key: "nombre", ascending: true)
        
        fetchRequest.sortDescriptors = [sortPais, sortNombre]
        
        do {
            let arrayResultado = try contexto.fetch(fetchRequest)
            return arrayResultado
        }catch {
            return []
        }
    }
    
    class func listarConTextoDeBusqueda(_ texto: String, contexto: NSManagedObjectContext) -> [Marca] {
        
        let fetchRequest: NSFetchRequest<Marca> = Marca.fetchRequest()
        
        let predicado = NSPredicate(format: "nombre contains[c] %@ OR paisOrigen contains[c] %@", texto, texto)
        fetchRequest.predicate = predicado
        
        let sortPais = NSSortDescriptor(key: "paisOrigen", ascending: false)
        let sortNombre = NSSortDescriptor(key: "nombre", ascending: true)
        
        fetchRequest.sortDescriptors = [sortPais, sortNombre]
        
        do {
            let arrayResultado = try contexto.fetch(fetchRequest)
            return arrayResultado
        }catch {
            return []
        }
    }
}
