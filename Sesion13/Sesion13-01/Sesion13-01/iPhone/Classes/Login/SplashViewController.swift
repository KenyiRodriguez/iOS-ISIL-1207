//
//  SplashViewController.swift
//  Sesion13-01
//
//  Created by Kenyi Rodriguez on 7/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let _ = UserSessionBL.getUserSession() {
            self.perform(#selector(self.goToProfile), with: nil, afterDelay: 0.5)
        }else {
            self.perform(#selector(self.goToLogin), with: nil, afterDelay: 0.5)
        }
    }
    
    @objc func goToLogin() {
        self.performSegue(withIdentifier: "LoginViewController", sender:  nil)
    }
    
    @objc func goToProfile() {
        self.performSegue(withIdentifier: "ProfileViewController", sender:  nil)
    }
}
