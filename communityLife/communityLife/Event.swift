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
    //could use more event info
    //event gps?
    var eventImage: UIImage
    var attendingBool: Bool
    var wheelBool: Bool
    var toiletFacBool: Bool
    var parkBool: Bool
    var topicID: Int
    var topicName: String
    var needsTickets: Bool
    var startColor: UIColor
    var endColor: UIColor
    //layer.colors = [UIColor(named: "lightBlue")?.cgColor as Any, UIColor(named: "lightPurple")?.cgColor as Any]
    
    
    
    //MARK: Initialisation
    init?(eventDate:String, locationShort: String, locationLong: String, time: String, descriptionString: String, eventImage:UIImage? ,attendingBool: Bool, wheelBool: Bool, toiletFacBool: Bool, parkBool: Bool, topicID: Int,topicName: String, needsTickets: Bool, startColor: UIColor, endColor: UIColor)
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
        self.topicName = topicName
        self.needsTickets = needsTickets
        self.startColor = startColor
        self.endColor = endColor
        
        
    }//end initialisation
    
    static func fetchEvents() -> [Event]
    {
        return [Event(eventDate: "20/04/2019", locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: UIImage(named: "IrelandFootball")!, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 1, topicName: "Soccer ⚽️", needsTickets: true , startColor: UIColor(named: "lightBlue")!, endColor: UIColor(named: "purple")! )!,
                
            Event(eventDate: "21/04/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "6.30pm", descriptionString: "The Eagles Concert", eventImage: UIImage(named: "TheEagles")!, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music 🎸", needsTickets: true , startColor: UIColor(named: "purple")!, endColor: UIColor(named: "pink")! )!,
            
            Event(eventDate: "23/04/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "7.30pm", descriptionString: "Elton John Concert", eventImage: UIImage(named: "EltonJ")!, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music 🎸", needsTickets: true, startColor: UIColor(named: "pink")!, endColor: UIColor(named: "red")! )!,
            
            Event(eventDate: "20/04/2019", locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: UIImage(named: "IrelandFootball")!, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 1, topicName: "Soccer ⚽️", needsTickets: true , startColor: UIColor(named: "red")!, endColor: UIColor(named: "yellow")! )!,
            
            Event(eventDate: "21/04/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "6.30pm", descriptionString: "The Eagles Concert", eventImage: UIImage(named: "TheEagles")!, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music 🎸", needsTickets: true , startColor: UIColor(named: "orange")!, endColor: UIColor(named: "yellow")! )!,
            
            Event(eventDate: "23/04/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "7.30pm", descriptionString: "Elton John Concert", eventImage: UIImage(named: "EltonJ")!, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music 🎸", needsTickets: true, startColor: UIColor(named: "yellow")!, endColor: UIColor(named: "green")! )!
            
            
        ]
    }
    
} //end class specifier



