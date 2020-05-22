//
//  UIAlumnoTableViewCell.swift
//  Sesion06-02
//
//  Created by Kenyi Rodriguez on 5/21/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AlumnoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNombreCompleto: UILabel!
    @IBOutlet weak var lblDni: UILabel!
    
    var objAlumno: AlumnoBE!{
        didSet{
            self.updateData()
        }
    }
    
    func updateData() {
        
        self.lblNombreCompleto.text = "\(self.objAlumno.alumno_apellido) \(self.objAlumno.alumno_nombre)"
        self.lblDni.text = self.objAlumno.alumno_dni
    }
}
