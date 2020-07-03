//
//  ProfileViewController.swift
//  Sesion13-01
//
//  Created by Kenyi Rodriguez on 7/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBAction func closeSession(_ sender: Any) {
        
        UserSessionBL.closeSession()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let session = UserSessionBL.getUserSession() {
            print("User: \(session.session_user ?? "Sin usuario")")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
