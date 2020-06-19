//
//  DiscoWS.swift
//  Sesion11-02
//
//  Created by Kenyi Rodriguez on 6/18/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscoWS {
    
    class func obtenerDiscos(_ resultado: @escaping Discos) {
        
        let urlServicio = "http://kenyirodriguez.com/discos.json"
        
        CSMWebServiceManager.shared.request.getRequest(urlString: urlServicio, parameters: nil) { (response) in
            
            let arrayDiscosWS =  response.JSON?.dictionary["productos"]?.dictionary["discos"]?.array ?? []
            
            var arrayDiscosApp = [DiscoBE]()
            
            for objDiscoWS in arrayDiscosWS {
                let objDiscoApp = DiscoBE.parse(objDiscoWS)
                arrayDiscosApp.append(objDiscoApp)
            }
            
            resultado(arrayDiscosApp)
        }
    }
}
