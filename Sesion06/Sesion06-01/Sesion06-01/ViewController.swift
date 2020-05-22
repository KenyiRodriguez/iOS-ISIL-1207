//
//  ViewController.swift
//  Sesion06-01
//
//  Created by Kenyi Rodriguez on 5/21/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arrayColors = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        (0..<8).forEach { (_) in
            let randomColor = self.createRandomColor()
            self.arrayColors.append(randomColor)
        }
    }
    
    func createRandomColor() -> UIColor {
        
        let r = CGFloat.random(in: 0...255)/255.0
        let g = CGFloat.random(in: 0...255)/255.0
        let b = CGFloat.random(in: 0...255)/255.0
        
        let color = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        return color
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CeldaDemo"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.backgroundColor = self.arrayColors[indexPath.row]
        
        return cell
    }
}

