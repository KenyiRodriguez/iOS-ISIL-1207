//
//  ModeloBL.swift
//  Sesion09-01
//
//  Created by Kenyi Rodriguez on 6/4/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class ModeloBL {
    
    typealias AgregarModelo = (_ objModelo: Modelo) -> Void
    typealias MensajeError = (_ mensaje: String) -> Void
        
    class func crear(fabricacion: String?, nombre: String?, tipoCarroceria: String?, success: AgregarModelo, mensajeError: MensajeError) {
            
        guard let fabricacionSeguro = fabricacion, fabricacionSeguro.count != 0 else {
            mensajeError("Ingresa un año de fabricación correcto")
            return
        }
        
        guard let nombreSeguro = nombre, nombreSeguro.count != 0 else {
            mensajeError("Ingresa un nombre correcto")
            return
        }
        
        guard let tipoCarroceriaSeguro = tipoCarroceria, tipoCarroceriaSeguro.count != 0 else {
            mensajeError("Ingresa un tipo de carrocería correcta")
            return
        }
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let objModelo = ModeloDA.crear(fabricacion: fabricacionSeguro, nombre: nombreSeguro, tipoCarroceria: tipoCarroceriaSeguro, contexto: contexto)
        instanciaAppDelegate.saveContext()
        
        success(objModelo)
    }
    
    class func listar() -> [Modelo] {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let arrayResultado = ModeloDA.listar(contexto: contexto)
        return arrayResultado
    }
    
    class func listarConTextoDeBusqueda(_ texto: String) -> [Modelo] {
        
        let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = instanciaAppDelegate.persistentContainer.viewContext
        
        let arrayResultado = ModeloDA.listarConTextoDeBusqueda(texto, contexto: contexto)
        return arrayResultado
    }
}
