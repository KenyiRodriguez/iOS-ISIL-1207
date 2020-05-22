//
//  ViewController.swift
//  Sesion06-02
//
//  Created by Kenyi Rodriguez on 5/21/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arrayAlumnos = [AlumnoBE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrayAlumnos.append(AlumnoBE(nombre: "Angel Kenyi", apellido: "Rodriguez Vergara", dni: "87654321"))
        self.arrayAlumnos.append(AlumnoBE(nombre: "David Alexander", apellido: "Villafane Carcamo", dni: "65432187"))
        self.arrayAlumnos.append(AlumnoBE(nombre: "Fiorella Paola", apellido: "Rey Baella", dni: "43218765"))
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
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

