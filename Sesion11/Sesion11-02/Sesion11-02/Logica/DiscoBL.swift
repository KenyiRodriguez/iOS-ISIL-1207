//
//  DiscoBL.swift
//  Sesion11-02
//
//  Created by Kenyi Rodriguez on 6/18/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscoBL {
    
    class func obtenerDiscos(_ resultado: @escaping Discos) {
        
        DiscoWS.obtenerDiscos { (arrayDiscos) in
                
            let arrayOrdenado = arrayDiscos.sorted(by: {
                return $0.disco_nombre < $1.disco_nombre
            })
            
            resultado(arrayOrdenado)
        }
    }
}
