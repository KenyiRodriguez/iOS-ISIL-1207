//
//  AddGameViewController.swift
//  Solucion_pc03
//
//  Created by Kenyi Rodriguez on 7/9/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {

    @IBOutlet weak var txtName          : UITextField!
    @IBOutlet weak var txtType          : UITextField!
    @IBOutlet weak var txtReleaseYear   : UITextField!
    @IBOutlet weak var txtUrlImage      : UITextField!
    @IBOutlet weak var txvDescription   : UITextView!
    
    @IBOutlet weak var cnsBottomScroll  : NSLayoutConstraint!
    
    @IBAction func clickBtnSaveGame(_ sender: Any) {
        
        let name            = self.txtName.text
        let type            = self.txtType.text
        let releaseYear     = self.txtReleaseYear.text
        let urlImage        = self.txtUrlImage.text
        let gameDescription = self.txvDescription.text
        
        GameBL.create(name: name,
                      type: type,
                      releaseYear: releaseYear,
                      gameDescription: gameDescription,
                      urlImage: urlImage,
                      success: { (objGame) in
                        
                        self.navigationController?.popViewController(animated: true)
            
        }) { (errorMessage) in
            self.showAlert(withTitle: "Error", withMessage: errorMessage, withAcceptButton: "Aceptar", withCompletion: nil)
        }
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let keyboardSize = keyboardFrame.size
        
        UIView.animate(withDuration: 0.3) {
            self.cnsBottomScroll.constant = keyboardSize.height
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        UIView.animate(withDuration: 0.3) {
            self.cnsBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txvDescription.layer.cornerRadius = 8
        self.txvDescription.layer.borderWidth = 1
        self.txvDescription.layer.borderColor = UIColor.systemGray3.cgColor
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
