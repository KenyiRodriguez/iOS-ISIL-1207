//
//  UserSessionBL.swift
//  Sesion13-01
//
//  Created by Kenyi Rodriguez on 7/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class UserSessionBL {
    
    static let accountSession = "UserSessionBE"
    static let serviceSession = "session"
    
    class func saveSession(_ session: UserSessionBE) -> Bool {
        
        self.closeSession()
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: session, requiringSecureCoding: true)
            UserSessionBE.shared = session
            CSMKeyChain.sharedInstance.saveDataInKeychain(data, withAccount: accountSession, withService: serviceSession)
            return true
        }catch {
            print("No se pudo guardar la sesión")
            return false
        }
    }
    
    class func getUserSession() -> UserSessionBE? {
        
        guard let session = UserSessionBE.shared else {
            
            if let dataUser = CSMKeyChain.sharedInstance.dataFromKeychainWithAccount(accountSession, withService: serviceSession) {
                
                do {
                    let objSession = (try NSKeyedUnarchiver.unarchivedObject(ofClass: UserSessionBE.self, from: dataUser)) as UserSessionBE?
                    return objSession
                    
                }catch {
                    return nil
                }
            
            }else{
                return nil
            }
        }
        
        return session
    }
    
    class func closeSession() {
        CSMKeyChain.sharedInstance.deleteKeychain()
    }
}


/*
 
 User Defaults (RECONTRA INSEGURO)
 plist (INSEGURO)
 json (INSEGURO)
 sQlite -> CoreData (Medianamente seguro)
 KeyChain (NI DIOSITO LO ABRE CON DOBLE ENCRIPTACIÓN)
 
 */
