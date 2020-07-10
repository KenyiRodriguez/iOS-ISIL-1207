//
//  AlumnoViewModel.swift
//  EjemploMVVM
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AlumnoViewModel {
    
    public var informacionGeneral: NSAttributedString? {
        
        guard let safeAlumno = self.objAlumno else { return nil }
        
        let attributoDni = NSAttributedString.createWith(text: safeAlumno.dni, font: UIFont.boldSystemFont(ofSize: 21), color: .red)
        
        let attNombre = NSAttributedString.createWith(text: safeAlumno.nombre, font: UIFont.systemFont(ofSize: 17), color: .blue)
        let attributoNombre = NSMutableAttributedString(attributedString: attNombre)
        attributoNombre.addMiddleline(true)
        
        let attributoApellido = NSAttributedString.createWith(text: safeAlumno.apellido, font: UIFont.systemFont(ofSize: 21), color: .green)
        
        let atributosFinales = NSMutableAttributedString()
        atributosFinales.append(attributoDni)
        atributosFinales.append(NSAttributedString(string: " - "))
        atributosFinales.append(attributoNombre)
        atributosFinales.append(NSAttributedString(string: " "))
        atributosFinales.append(attributoApellido)
        
        return atributosFinales
    }
    
    private var objAlumno: AlumnoBE?
    
    public func setAlumno(_ objAlumno: AlumnoBE) {
        self.objAlumno = objAlumno
    }
}
