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
//        layer.borderColor = UIColor.clear.cgColor
//        layer.borderWidth = 2
        layer.backgroundColor = UIColor(named: "lightBlue")?.cgColor
        self.clipsToBounds = false
        

    }
    
}
