//
//  LoginBL.swift
//  Sesion13-01
//
//  Created by Kenyi Rodriguez on 7/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias ErrorMessage  = (_ errorMessage: String) -> Void
typealias Success       = () -> Void

class LoginBL {
    
    class func login(user: String?, password: String?, success: @escaping Success, errorMessage: @escaping ErrorMessage) {
        
        guard let safeUser = user, safeUser.count != 0 else {
            errorMessage("Ingrese un usuario correcto")
            return
        }
        
        guard let safePassword = password, safePassword.count != 0 else {
            errorMessage("Ingrese un password correcto")
            return
        }
        
        let objSession = UserSessionBE()
        objSession.session_user = safeUser
        objSession.session_password = safePassword

        if UserSessionBL.saveSession(objSession) {
            success()
        }else {
            errorMessage("Lo sentimos, ocurrio un error con la sesión")
        }
        
    }
}
