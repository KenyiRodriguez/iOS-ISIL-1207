//
//  ViewController.swift
//  Sesion12-01
//
//  Created by Kenyi Rodriguez on 6/25/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps

class LugarBE {
    
    var nombre = ""
    var direccion = ""
    
    init(nombre: String, direccion: String) {
        self.nombre = nombre
        self.direccion = direccion
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    func moverCamaraParaCoordenada(_ coordenada: CLLocationCoordinate2D) {
        
        let camara = GMSCameraPosition(target: coordenada, zoom: 15)
        self.mapView.animate(to: camara)
    }
    
    func agregarMarkerParaCoordenada(_ coordenada: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordenada)
        marker.userData = LugarBE(nombre: "Ningun Lugar", direccion: "Los olvidados de dios mz Z lt. 666")
        marker.map = self.mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.settings.myLocationButton = true
        self.mapView.isMyLocationEnabled = true
    }
}

extension ViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        self.agregarMarkerParaCoordenada(coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        if let lugar = marker.userData as? LugarBE {
            print("Nombre: \(lugar.nombre)\nDireccion: \(lugar.direccion)")
            marker.map = nil
        }
        
        return true
    }
}

