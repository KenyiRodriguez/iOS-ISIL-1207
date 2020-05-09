//
//  ViewController.swift
//  Sesion04-iOS-01
//
//  Created by Kenyi Rodriguez on 5/7/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollViewContent        : UIScrollView!
    @IBOutlet weak var bottomScrollConstraint   : NSLayoutConstraint!
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centerYHeight = self.scrollViewContent.frame.height / 2
        let centerYContent = self.scrollViewContent.contentSize.height / 2
        
        let centerXWidth = self.scrollViewContent.frame.width / 2
        let centerXContent = self.scrollViewContent.contentSize.width / 2
        
        let finalPoint = CGPoint(x: centerXContent - centerXWidth, y: centerYContent - centerYHeight)
        self.scrollViewContent.setContentOffset(finalPoint, animated: true)
    }
    
    @objc func keyboardWillAppear(_ notification: Notification) {

        let frameKeyboard = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.0

        UIView.animate(withDuration: animationDuration) {
            self.bottomScrollConstraint.constant = frameKeyboard.size.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillDisappear(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.0
        
        UIView.animate(withDuration: animationDuration) {
            self.bottomScrollConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector : #selector(self.keyboardWillAppear(_:)),
                                               name     : UIResponder.keyboardWillShowNotification,
                                               object   : nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector : #selector(self.keyboardWillDisappear(_:)),
                                               name     : UIResponder.keyboardWillHideNotification,
                                               object   : nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}

/*
 aparece:
    willAppear
    didAppear
 
 desaparece:
    willDisappear
    didDisappear
 */
