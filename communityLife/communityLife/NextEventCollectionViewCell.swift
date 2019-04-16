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
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var BlurView: UIView!
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 12.0
        layer.shadowRadius = 1.5
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 2
        
        self.clipsToBounds = false
        self.layer.insertSublayer(gradient(frame: self.bounds), at:0)
        
        addShadow(LabelToShadow: EventLabel)
        addShadow(LabelToShadow: LocationLabel)
        addShadow(LabelToShadow: DateLabel)
        
        
    }
    
    func addShadow(LabelToShadow: UILabel) {
        LabelToShadow.layer.shadowColor = UIColor.black.cgColor
        LabelToShadow.layer.shadowRadius = 3.0
        LabelToShadow.layer.shadowOpacity = 1.0
        LabelToShadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        LabelToShadow.layer.masksToBounds = false
        
    }
    func gradient(frame:CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        //print(event?.eventDate)
        //layer.colors = [UIColor(named: "lightBlue")?.cgColor as Any, UIColor(named: "lightPurple")?.cgColor as Any]
        //layer.colors = [event?.startColor.cgColor as Any, event?.endColor.cgColor as Any]
        layer.cornerRadius = 12.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        return layer
    }
    
    
    
}
