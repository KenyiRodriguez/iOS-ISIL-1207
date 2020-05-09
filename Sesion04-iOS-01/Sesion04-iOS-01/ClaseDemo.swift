//
//  ClaseDemo.swift
//  Sesion04-iOS-01
//
//  Created by Kenyi Rodriguez on 5/7/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol Operacion {
    func operarNumero(_ n1: Double, conNumero2 n2: Double) -> Double
}

protocol Mostrar {
    func imprimirTipoOperacion()
}

class OperacionSuma: Operacion, Mostrar{
 
    func operarNumero(_ n1: Double, conNumero2 n2: Double) -> Double {
        return n1 + n2
    }
    
    func imprimirTipoOperacion() {
        print("Esto es una suma")
    }
}

class OperacionResta: Operacion, Mostrar{
    
    func operarNumero(_ n1: Double, conNumero2 n2: Double) -> Double {
        return n1 - n2
    }
    
    func imprimirTipoOperacion() {
        print("Esto es una resta")
    }
}

class OperacionDiv: Operacion{
    
    func operarNumero(_ n1: Double, conNumero2 n2: Double) -> Double {
        return n1 / n2
    }
}
