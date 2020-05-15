//
//  SegundoViewController.swift
//  Sesion05-01
//
//  Created by Kenyi Rodriguez on 5/14/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class SegundoViewController: UIViewController {

    @IBOutlet weak var viewContent: UIView!
    
    @IBAction func clickBtnNewViewBox(_ sender: UIButton) {
        
        let newBox = BoxView()
        newBox.delegate = self
        newBox.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        self.viewContent.addSubview(newBox)
        
        newBox.setRandomColor()
        newBox.setRandomCenter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SegundoViewController:  BoxViewDelagete {
    
    func boxView(_ boxView: BoxView, didTapSingleTapGesture tapGesture: UITapGestureRecognizer) {
        
        boxView.removeFromSuperview()
    }
}

