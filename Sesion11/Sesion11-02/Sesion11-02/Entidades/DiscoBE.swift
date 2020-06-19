//
//  DiscoBE.swift
//  Sesion11-02
//
//  Created by Kenyi Rodriguez on 6/18/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscoBE {
    
    var disco_id            = 0
    var disco_nombre        = ""
    var disco_autor         = ""
    var disco_publicacion   = 0
    var disco_genero        = ""
    var disco_urlImagen     = ""
    var disco_precio        = ""
    var disco_descripcion   = ""
    var disco_discografica  = ""

    class func parse(_ json: CSMJSON) -> DiscoBE {
        
        let objBE = DiscoBE()
        
        objBE.disco_id              = json.dictionary["id"]?.intValue ?? 0
        objBE.disco_nombre          = json.dictionary["nombre"]?.stringValue ?? ""
        objBE.disco_autor           = json.dictionary["autor"]?.stringValue ?? ""
        objBE.disco_publicacion     = json.dictionary["publicacion"]?.intValue ?? 0
        objBE.disco_genero          = json.dictionary["genero"]?.stringValue ?? ""
        objBE.disco_urlImagen       = json.dictionary["urlImagen"]?.stringValue ?? ""
        objBE.disco_precio          = json.dictionary["precio"]?.stringValue ?? ""
        objBE.disco_descripcion     = json.dictionary["descripcion"]?.stringValue ?? ""
        objBE.disco_discografica    = json.dictionary["discografica"]?.stringValue ?? ""
        
        return objBE
    }
}
