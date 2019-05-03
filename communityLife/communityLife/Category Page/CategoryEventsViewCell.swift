//
//  CategoryEventsViewCell.swift
//  communityLife
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit

class CategoryEventsViewCell: UICollectionViewCell {
    
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
    
    
}

