//
//  LauncherPageVC.swift
//  communityLife
//
//  Created by Stephen Alger on 11/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import Foundation

import UIKit

class LauncherPageVC: UIViewController {
    
    @IBOutlet weak var enterBTNOutlet: UIButton!
    
    @IBAction func enterBTN(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        enterBTNOutlet.layer.cornerRadius = 10
        enterBTNOutlet.layer.borderWidth = 0.5
        enterBTNOutlet.layer.borderColor = UIColor(named: "blackBorder")?.cgColor

    }
    
  
}
