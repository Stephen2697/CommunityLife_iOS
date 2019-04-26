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
    
    //Function on class to return array of mock event objects 
    static func fetchEvents() -> [Event]
    {
        return [
    

            
        Event(eventDate: "01/06/2019", locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: UIImage(named: "IrelandFootball"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 1, topicName: "Soccer", needsTickets: true,startColor: UIColor(named: "lightBlue")!, endColor: UIColor(named: "purple")! )!,
        
        Event(eventDate: "02/06/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "8.00pm", descriptionString: "Rolling Stones Concert", eventImage: UIImage(named: "RollingStone"), attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music", needsTickets: true,startColor: UIColor(named: "pink")!, endColor: UIColor(named: "purple")! )!,
        
        Event(eventDate: "03/06/2019", locationShort: "Thomond Park", locationLong: "Thomond Park, Limerick", time: "5.30pm", descriptionString: "Munster vs Ospreys", eventImage: UIImage(named: "MunsterRugby"), attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2, topicName: "Rugby",needsTickets: true,startColor: UIColor(named: "pink")!, endColor: UIColor(named: "red")! )!,
        
        Event(eventDate: "04/06/2019", locationShort: "UCD Campus", locationLong: "UCD Campus, Dublin", time: "1.30pm", descriptionString: "UCD vs Shamrock Rovers", eventImage: UIImage(named: "UCD"), attendingBool: false, wheelBool: true, toiletFacBool: false, parkBool: true, topicID: 1,topicName: "Soccer", needsTickets: true,startColor: UIColor(named: "yellow")!, endColor: UIColor(named: "red")! )!,
        
        Event(eventDate: "05/06/2019", locationShort: "UCD Campus", locationLong: "UCD Campus, Dublin", time: "1.00pm", descriptionString: "Dundrum Special Olympics Blitz", eventImage: UIImage(named: "specialOly"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 1,topicName: "Sports", needsTickets: false,startColor: UIColor(named: "yellow")!, endColor: UIColor(named: "orange")! )!,
        
        Event(eventDate: "06/06/2019", locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "4.00pm", descriptionString: "Ireland vs New Zealand", eventImage: UIImage(named: "IrelandRugby"), attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2,topicName: "Rugby", needsTickets: true,startColor: UIColor(named: "yellow")!, endColor: UIColor(named: "green")! )!,
        
        Event(eventDate: "07/06/2019", locationShort: "RDS Donnybrook", locationLong: "RDS Donnybrook, Dublin", time: "2.30pm", descriptionString: "Leinster vs Edinburgh", eventImage: UIImage(named: "LeinsterRugby"), attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2, topicName: "Rugby", needsTickets: true,startColor: UIColor(named: "lightBlue")!, endColor: UIColor(named: "purple")! )!,
        
        
        Event(eventDate: "08/06/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "6.30pm", descriptionString: "The Eagles Concert", eventImage: UIImage(named: "TheEagles"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music", needsTickets: true,startColor: UIColor(named: "pink")!, endColor: UIColor(named: "purple")! )!,
        
        Event(eventDate: "09/06/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "7.30pm", descriptionString: "Elton John Concert", eventImage: UIImage(named: "EltonJ"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music", needsTickets: true,startColor: UIColor(named: "pink")!, endColor: UIColor(named: "red")! )!
            
        ]
    }
    
} //end class specifier



