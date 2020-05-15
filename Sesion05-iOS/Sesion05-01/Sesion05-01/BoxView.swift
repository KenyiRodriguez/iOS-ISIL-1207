//
//  BoxView.swift
//  Sesion05-01
//
//  Created by Kenyi Rodriguez on 5/14/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol BoxViewDelagete {
    func boxView(_ boxView: BoxView, didTapSingleTapGesture tapGesture: UITapGestureRecognizer)
}


class BoxView: UIView {

    var delegate: BoxViewDelagete?
    
    override func draw(_ rect: CGRect) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureInVIew(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func tapGestureInVIew(_ tapGesture: UITapGestureRecognizer) {
        self.delegate?.boxView(self, didTapSingleTapGesture: tapGesture)
    }
    
    func setRandomColor() {
        
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
 
        let newColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        self.backgroundColor = newColor
    }
    
    func setRandomCenter() {
        
        let width = self.frame.width
        let superViewWidth = self.superview?.frame.width ?? 0
        let middleWidth = width / 2
        let posx = CGFloat.random(in: middleWidth...(superViewWidth - middleWidth))
        
        let height = self.frame.height
        let superViewHeight = self.superview?.frame.height ?? 0
        let middleHeight = height / 2
        let posy = CGFloat.random(in: middleHeight...(superViewHeight - middleHeight))
        
        let newCenter = CGPoint(x: posx, y: posy)
        self.center = newCenter
    }
    
    func setNewAngleRotate() {
        self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    func resetTransform() {
        self.transform = .identity
    }
    
    func animateChangeState() {
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
                   
            self.setRandomCenter()
            self.setRandomColor()
            self.setNewAngleRotate()
            
        }) { (_) in
            self.resetTransform()
        }
    }
}
