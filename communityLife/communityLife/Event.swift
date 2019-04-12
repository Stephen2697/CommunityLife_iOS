//
//  Event.swift
//  communityLife
//
//  Created by Stephen Alger on 12/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit
import os.log

class Event: NSObject
{
    
    
    //MARK: Food Variables
    //locationShort,locationLong, time, goingbool, descriptionString, photo, gif, topicID, wheelBool, parkBool, toiletFacBool
    var eventDate: String
    var locationShort: String
    var locationLong: String
    var time: String
    var descriptionString: String
    var eventImage: UIImage
    var attendingBool: Bool
    var wheelBool: Bool
    var toiletFacBool: Bool
    var parkBool: Bool
    var topicID: Int
    
    
    
    //MARK: Initialisation
    init?(eventDate:String, locationShort: String, locationLong: String, time: String, descriptionString: String, eventImage:UIImage? ,attendingBool: Bool, wheelBool: Bool, toiletFacBool: Bool, parkBool: Bool, topicID: Int )
    {
        

        self.eventDate = eventDate //get time
        self.eventImage = eventImage!
        self.locationShort = locationShort
        self.locationLong = locationLong
        self.time = time
        self.descriptionString = descriptionString
        self.attendingBool = attendingBool
        self.wheelBool = wheelBool
        self.toiletFacBool = toiletFacBool
        self.parkBool = parkBool
        self.topicID = topicID
        
        
        
    }//end initialisation
    
    
} //end class specifier



