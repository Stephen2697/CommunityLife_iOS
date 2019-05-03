//
//  NextEventCollectionViewCell.swift
//  communityLife
//
//  Created by Stephen Alger on 16/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit

class NextEventCollectionViewCell: UICollectionViewCell {
    
    //UI Outlets
    @IBOutlet weak var EventLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!

    var event : Event? {
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI() {
        if let event = event {
            //ImageView.image = event.eventImage
            EventLabel.text = event.descriptionString
            LocationLabel.text = event.locationLong
            DateLabel.text = event.eventDate
//            TimeLabel.text = event.time
            
            
            
        }
        else
        {
            //ImageView.image = nil
            EventLabel.text = "nothing"
            LocationLabel.text = "nothing"
            DateLabel.text = "nothing"
//            TimeLabel.text = "nothing"
        }
    }
    
    func addShadow(LabelToShadow: UILabel) {
        
        LabelToShadow.layer.shadowColor = UIColor.black.cgColor
        LabelToShadow.layer.shadowRadius = 3.0
        LabelToShadow.layer.shadowOpacity = 1.0
        LabelToShadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        LabelToShadow.layer.masksToBounds = false

    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//         print("\n\nhi: \(self.layer.sublayers?.count ?? 0)\n\n-------------------------------")
//        
////        if let topLayer = self.layer.sublayers?.first
////        {
////            topLayer.removeFromSuperlayer()
////
////        }
//        
//        self.layer.cornerRadius = 12.0
//        layer.shadowRadius = 1.5
//        layer.shadowOpacity = 0.1
//        layer.shadowOffset = CGSize(width: -1, height: 1)
//        layer.borderColor = UIColor.clear.cgColor
//        layer.borderWidth = 2
//        
//        self.clipsToBounds = false
//
//        
//        let newLayer = gradient(frame: self.bounds)
//        
//        self.layer.insertSublayer(newLayer, at:0)
//        
//        addShadow(LabelToShadow: EventLabel)
//        addShadow(LabelToShadow: LocationLabel)
//        addShadow(LabelToShadow: DateLabel)
//        
//    }
//    
//
//    
//    func gradient(frame:CGRect) -> CALayer {
//        let layer = CALayer()
//        layer.frame = frame
//        layer.cornerRadius = 12.0
//        layer.borderColor = UIColor.white.cgColor
//        layer.borderWidth = 2
//        return layer
//    }
//    
//    
    
}
