//
//  AlumnoTableViewCell.swift
//  EjemploMVVM
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AlumnoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblInformacionGeneral: UILabel!
    
    var viewModel: AlumnoViewModel = AlumnoViewModel()
    
    var objAlumno: AlumnoBE! {
        didSet{
            self.updateData()
        }
    }
    
    private func updateData() {
        
        self.viewModel.setAlumno(self.objAlumno)
        self.lblInformacionGeneral.attributedText = self.viewModel.informacionGeneral
    }
    
}
