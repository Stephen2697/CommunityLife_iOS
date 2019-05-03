//
//  MyActivityBackgroundView.swift
//  communityLife
//
//  Created by Stephen Alger on 19/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit

class MyActivityBackgroundView: UIView {

    @IBOutlet weak var mainView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit()
    {
        Bundle.main.loadNibNamed("MyActivityBackgroundView", owner: self, options:nil)
        addSubview(self)
        
        
        self.layer.cornerRadius = 4.0
        
        var gradientLayer = CAGradientLayer()
        
        if let existingLayer = (self.layer.sublayers?.compactMap { $0 as? CAGradientLayer })?.first {
            gradientLayer = existingLayer
        }
    
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [UIColor(named: "lightRed")?.cgColor as Any, UIColor(named: "red")?.cgColor as Any]
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }


}
