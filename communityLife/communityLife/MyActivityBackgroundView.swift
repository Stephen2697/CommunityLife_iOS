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
    
    //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! NextEventCollectionViewCell
    
    //if let topLayer = cell.layer.sublayers?.first, topLayer is CAGradientLayer
//    {
//    topLayer.removeFromSuperlayer()
//
//    }
//
//    cell.clipsToBounds = false
//    cell.layer.cornerRadius = 12.0
//    cell.layer.borderColor = UIColor.white.cgColor
//    cell.layer.borderWidth = 2
//
//    cell.EventLabel.text = eventItems[indexPath.item].descriptionString
//    cell.LocationLabel.text = eventItems[indexPath.item].locationLong
//    cell.DateLabel.text = "\(eventItems[indexPath.item].time), \(eventItems[indexPath.item].eventDate)"
//
//    var gradientLayer = CAGradientLayer()
//
//    if let existingLayer = (cell.layer.sublayers?.compactMap { $0 as? CAGradientLayer })?.first {
//        gradientLayer = existingLayer
//    }
//
//    gradientLayer.frame = cell.bounds
//    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
//    gradientLayer.colors = [eventItems[indexPath.item].startColor.cgColor as Any, eventItems[indexPath.item].endColor.cgColor as Any]
//
//    gradientLayer.cornerRadius = 12.0
//    gradientLayer.borderColor = UIColor.white.cgColor
//    gradientLayer.borderWidth = 2
//
//    cell.layer.insertSublayer(gradientLayer, at: 0)
    

}
