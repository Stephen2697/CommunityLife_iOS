//
//  NextEventView.swift
//  communityLife
//
//  Created by Stephen Alger on 12/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit

class NextEventView: UIView {
    
 
    @IBOutlet var CV: UIView!
    @IBOutlet weak var EventTitle: UILabel!
    @IBOutlet weak var EventTime: UILabel!
    @IBOutlet weak var LocationText: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    let eventOne = Event(eventDate: "01/06/2019", locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: UIImage(named: "IrelandFootball"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 )
    
    
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
        Bundle.main.loadNibNamed("NextEventView", owner: self, options:nil)
        addSubview(CV)
        
        EventTitle.text = eventOne?.descriptionString
        EventTime.text = eventOne?.time
        LocationText.text = eventOne?.locationLong
        EventTime.text = eventOne?.time
        ImageView.image = eventOne?.eventImage
        CV.layer.cornerRadius = 15
        CV.layer.borderWidth = 0.5
        CV.layer.borderColor =  UIColor(named: "blackBorder")?.cgColor
        

        CV.frame = self.bounds
        CV.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        

        
    }

}
