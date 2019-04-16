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
            ImageView.image = event.eventImage
            EventLabel.text = event.descriptionString
            DateLabel.text = event.eventDate
            TimeLabel.text = event.time
        }
        else
        {
            ImageView.image = nil
            EventLabel.text = nil
            DateLabel.text = nil
            TimeLabel.text = nil
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 5, height: 10)
        self.clipsToBounds = false
    }
    
}
