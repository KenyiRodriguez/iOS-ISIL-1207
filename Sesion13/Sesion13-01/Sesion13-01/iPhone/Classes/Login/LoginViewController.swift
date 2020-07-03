//
//  LoginViewController.swift
//  Sesion13-01
//
//  Created by Kenyi Rodriguez on 7/2/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser          : CSMTextField!
    @IBOutlet weak var txtPassword      : CSMTextField!
    @IBOutlet weak var btnLogin         : CSMButton!
    @IBOutlet weak var actvLogin        : UIActivityIndicatorView!
    @IBOutlet weak var viewContentField : CSMShadowView!
    @IBOutlet weak var cnsViewContent_y : NSLayoutConstraint!
    
    var initialCsnViewContent_y_constant : CGFloat = 0.0
    
    @IBAction func clickBtnLogin(_ sender: Any?) {
        
        self.tapToCloseKeyboard(nil)
        self.actvLogin.startAnimating()
        self.btnLogin.isEnabled = false
        self.btnLogin.alpha = 0.5
        
        self.perform(#selector(self.doLogin), with: nil, afterDelay: 2)
        
    }
    
    @objc func doLogin() {
        
        LoginBL.login(user: self.txtUser.text, password: self.txtPassword.text, success: {
            
            self.actvLogin.stopAnimating()
            self.btnLogin.isEnabled = true
            self.btnLogin.alpha = 1
            self.performSegue(withIdentifier: "ProfileViewController", sender: nil)
            
        }) { (errorMessage) in
            
            self.actvLogin.stopAnimating()
            self.btnLogin.isEnabled = true
            self.btnLogin.alpha = 1
            self.showAlert(withTitle: "Error", withMessage: errorMessage, withAcceptButton: "Aceptar", withCompletion: nil)
        }
    }
    
    @IBAction func tapToCloseKeyboard(_ sender: Any?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        let keyboardSize = keyboardFrame?.size ?? .zero
        let keyboardheight = keyboardSize.height
        
        let availableSpace = self.view.frame.height - keyboardheight - 20
        let finalPos_y_viewContent = self.viewContentField.frame.origin.y + self.viewContentField.frame.height
        
        if finalPos_y_viewContent > availableSpace {
            let delta = finalPos_y_viewContent - availableSpace
            
            UIView.animate(withDuration: 0.35) {
                self.cnsViewContent_y.constant = self.initialCsnViewContent_y_constant - delta
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        UIView.animate(withDuration: 0.35) {
            self.cnsViewContent_y.constant = self.initialCsnViewContent_y_constant
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialCsnViewContent_y_constant = self.cnsViewContent_y.constant
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.txtUser {
            self.txtPassword.becomeFirstResponder()
            
        }else if textField == self.txtPassword {
            self.clickBtnLogin(self.btnLogin)
        }
        
        return true
    }
}
