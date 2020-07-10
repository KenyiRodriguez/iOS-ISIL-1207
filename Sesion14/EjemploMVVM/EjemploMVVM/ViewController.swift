//
//  ViewController.swift
//  EjemploMVVM
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblAlumnos: UITableView!
    
    lazy var arrayAlumnos: [AlumnoBE] = {
        var array = [AlumnoBE]()
        
        array.append(AlumnoBE(nombre: "Kenyi Kenyi Kenyi Kenyi Kenyi Kenyi Kenyi Kenyi Kenyi Kenyi Kenyi", apellido: "Rodriguez", dni: "87654321"))
        array.append(AlumnoBE(nombre: "Claudio", apellido: "Villa", dni: "87654321"))
        array.append(AlumnoBE(nombre: "Edson", apellido: "Rivera", dni: "87654321"))
        array.append(AlumnoBE(nombre: "Fiorella", apellido: "Rey", dni: "87654321"))
        array.append(AlumnoBE(nombre: "Stallin", apellido: "Huallullo", dni: "87654321"))
        
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblAlumnos.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayAlumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AlumnoTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AlumnoTableViewCell
        cell.objAlumno = self.arrayAlumnos[indexPath.row]
        return cell
    }
}




//class ViewController: UIViewController {
//
//    @IBOutlet weak var lblInformacion: UILabel!
//
//    lazy var viewModel: AlumnoViewModel = {
//        let objAlumno = AlumnoBE(nombre: "Kenyi", apellido: "Rodriguez", dni: "98765432")
//        let viewModel = AlumnoViewModel(objAlumno: objAlumno)
//        return viewModel
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.lblInformacion.attributedText = self.viewModel.informacionGeneral
//    }
//}

