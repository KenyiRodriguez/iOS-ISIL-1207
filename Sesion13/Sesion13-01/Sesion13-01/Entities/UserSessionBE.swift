//
//  UserSessionBE.swift
//  Sesion13-01
//
//  Created by Kenyi Rodriguez on 7/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class UserSessionBE: NSObject, NSSecureCoding {
    
    static var supportsSecureCoding: Bool = true
    
    var session_user: String?
    var session_password: String?
    
    static var shared: UserSessionBE?
    
    override init() {
        super.init()
    }
    
    //Decode
    required init?(coder: NSCoder) {
        
        self.session_user = coder.decodeObject(forKey: "session_user") as? String ?? ""
        self.session_password = coder.decodeObject(forKey: "session_password") as? String ?? ""
    }
    
    //Encode -> Sólo se puede a String, Double, Int, Bool, Dicctionary(de nativos), Array(de nativos)
    func encode(with coder: NSCoder) {
        
        coder.encode(self.session_user, forKey: "session_user")
        coder.encode(self.session_password, forKey: "session_password")
    }
}
