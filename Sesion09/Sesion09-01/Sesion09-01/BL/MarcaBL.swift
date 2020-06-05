//
//  MarcaBL.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/4/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class MarcaBL {
    
    typealias AgregarMarca = (_ objMarca: Marca) -> Void
    typealias MensajeError = (_ mensaje: String) -> Void
    
    class func agregarModelo(_ objModelo: Modelo, enMarca objMarca: Marca) {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
    
        objMarca.addToModelos(objModelo)
        objModelo.marca = objMarca
        
        instanciaAppDelegate.saveContext()
    }
    
    class func crear(nombre: String?, pais: String?, web: String?, success: AgregarMarca, mensajeError: MensajeError) {
            
        guard let nombreSeguro = nombre, nombreSeguro.count != 0 else {
            mensajeError("Ingresa un nombre correcto")
            return
        }
        
        guard let paisSeguro = pais, paisSeguro.count != 0 else {
            mensajeError("Ingresa un país correcto")
            return
        }
        
        guard let webSeguro = web, webSeguro.count != 0 else {
            mensajeError("Ingresa una web correcto")
            return
        }
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let objMarca = MarcaDA.crear(nombre: nombreSeguro, pais: paisSeguro, web: webSeguro, contexto: contexto)
        instanciaAppDelegate.saveContext()
        
        success(objMarca)
    }
    
    class func listar() -> [Marca] {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let arrayResultado = MarcaDA.listar(contexto: contexto)
        return arrayResultado
    }
    
    class func listarConTextoDeBusqueda(_ texto: String) -> [Marca] {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let arrayResultado = MarcaDA.listarConTextoDeBusqueda(texto, contexto: contexto)
        return arrayResultado
    }
    
    class func eliminar(_ objMarca: Marca) {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        contexto.delete(objMarca)
        instanciaAppDelegate.saveContext()
    }
}
