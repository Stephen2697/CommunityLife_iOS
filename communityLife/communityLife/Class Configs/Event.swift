//
//  Event.swift
//  communityLife
//
//  Created by Stephen Alger on 12/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.    §Œ§
//

import UIKit
import os.log

//class Event: NSObject, NSCoding
class Event: NSObject
{
    //MARK: Event Variables
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
    var topicName: String
    var needsTickets: Bool
    var startColor: UIColor
    var endColor: UIColor
    
    //layer.colors = [UIColor(named: "lightBlue")?.cgColor as Any, UIColor(named: "lightPurple")?.cgColor as Any]
    //could use more event info
    //event gps?
    
    
    //MARK: Initialisation
    init?(eventDate:String, locationShort: String, locationLong: String, time: String, descriptionString: String, eventImage:UIImage? ,attendingBool: Bool, wheelBool: Bool, toiletFacBool: Bool, parkBool: Bool, topicName: String, needsTickets: Bool, startColor: UIColor, endColor: UIColor)
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
        self.topicName = topicName
        self.needsTickets = needsTickets
        self.startColor = startColor
        self.endColor = endColor
        
        
    }//end initialisation

    //Function on class to return array of mock event objects 
    static func fetchEvents() -> [Event]
    {
        return [
    
        Event(eventDate: "01/06/2019", locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: UIImage(named: "IrelandFootball"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicName: "Soccer", needsTickets: true,startColor: UIColor(named: "lightBlue")!, endColor: UIColor(named: "purple")! )!,
        
        Event(eventDate: "02/06/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "8.00pm", descriptionString: "Rolling Stones Concert", eventImage: UIImage(named: "RollingStone"), attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true,topicName: "Music", needsTickets: true,startColor: UIColor(named: "pink")!, endColor: UIColor(named: "purple")! )!,
        
        Event(eventDate: "03/06/2019", locationShort: "Thomond Park", locationLong: "Thomond Park, Limerick", time: "5.30pm", descriptionString: "Munster vs Ospreys", eventImage: UIImage(named: "MunsterRugby"), attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicName: "Rugby",needsTickets: true,startColor: UIColor(named: "pink")!, endColor: UIColor(named: "red")! )!,
        
        Event(eventDate: "04/06/2019", locationShort: "UCD Campus", locationLong: "UCD Campus, Dublin", time: "1.30pm", descriptionString: "UCD vs Shamrock Rovers", eventImage: UIImage(named: "UCD"), attendingBool: false, wheelBool: true, toiletFacBool: false, parkBool: true,topicName: "Soccer", needsTickets: true,startColor: UIColor(named: "yellow")!, endColor: UIColor(named: "red")! )!,
        
        Event(eventDate: "05/06/2019", locationShort: "UCD Campus", locationLong: "UCD Campus, Dublin", time: "1.00pm", descriptionString: "Dundrum Special Olympics Blitz", eventImage: UIImage(named: "specialOly"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true,topicName: "Sports", needsTickets: false,startColor: UIColor(named: "yellow")!, endColor: UIColor(named: "orange")! )!,
        
        Event(eventDate: "06/06/2019", locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "4.00pm", descriptionString: "Ireland vs New Zealand", eventImage: UIImage(named: "IrelandRugby"), attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true,topicName: "Rugby", needsTickets: true,startColor: UIColor(named: "yellow")!, endColor: UIColor(named: "green")! )!,
        
        Event(eventDate: "07/06/2019", locationShort: "RDS Donnybrook", locationLong: "RDS Donnybrook, Dublin", time: "2.30pm", descriptionString: "Leinster vs Edinburgh", eventImage: UIImage(named: "LeinsterRugby"), attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicName: "Rugby", needsTickets: true,startColor: UIColor(named: "lightBlue")!, endColor: UIColor(named: "purple")! )!,
        
        
        Event(eventDate: "08/06/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "6.30pm", descriptionString: "The Eagles Concert", eventImage: UIImage(named: "TheEagles"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true,topicName: "Music", needsTickets: true,startColor: UIColor(named: "pink")!, endColor: UIColor(named: "purple")! )!,
        
        Event(eventDate: "09/06/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "7.30pm", descriptionString: "Elton John Concert", eventImage: UIImage(named: "EltonJ"), attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true,topicName: "Music", needsTickets: true,startColor: UIColor(named: "pink")!, endColor: UIColor(named: "red")! )!
            
        ]
    }
    
    //DEBUG- EXPERIMENTAL CODE IN OPERATION - WORKING ON PERSISTENCE
    //    //MARK: Encoding Property Names in struct
    //    struct PropertyKey {
    //
    //        static let eventDate = "eventDate"
    //        static let locationShort = "locationShort"
    //        static let locationLong = "locationLong"
    //
    //        static let time = "time"
    //        static let descriptionString = "descriptionString"
    //        static let eventImage = "eventImage"
    //
    //        static let attendingBool = "attendingBool"
    //        static let wheelBool = "wheelBool"
    //        static let toiletFacBool = "toiletFacBool"
    //
    //        static let parkBool = "parkBool"
    //        static let topicID = "topicID"
    //        static let topicName = "topicName"
    //
    //        static let needsTickets = "needsTickets"
    //        static let startColor = "startColor"
    //        static let endColor = "endColor"
    //    }
    
    //MARK: Archive Path
    //static as these constants belong to the class not instances of the class
    //The DocumentsDirectory constant looks up the URL for your app’s documents directory where the saved data is located. It returns an array of URLs - the first parameter returns the first URL in the array.
    //    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    //Now we append eventItems to this URL to create an access point to this apps data
    //    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("eventItems")
    
    //    func encode(with aCoder: NSCoder) {
    //        aCoder.encode(eventDate, forKey: PropertyKey.eventDate)
    //        aCoder.encode(locationShort, forKey: PropertyKey.locationShort)
    //        aCoder.encode(locationLong, forKey: PropertyKey.locationLong)
    //
    //        aCoder.encode(time, forKey: PropertyKey.time)
    //        aCoder.encode(descriptionString, forKey: PropertyKey.descriptionString)
    //        aCoder.encode(eventImage, forKey: PropertyKey.eventImage)
    //
    //        aCoder.encode(attendingBool, forKey: PropertyKey.attendingBool)
    //        aCoder.encode(wheelBool, forKey: PropertyKey.wheelBool)
    //        aCoder.encode(toiletFacBool, forKey: PropertyKey.toiletFacBool)
    //
    //
    //        aCoder.encode(parkBool, forKey: PropertyKey.parkBool)
    //        aCoder.encode(topicName, forKey: PropertyKey.topicName)
    //
    //        aCoder.encode(needsTickets, forKey: PropertyKey.needsTickets)
    //        aCoder.encode(startColor, forKey: PropertyKey.startColor)
    //        aCoder.encode(endColor, forKey: PropertyKey.endColor)
    //
    //    }
    
    /*required modifier dictates this initializer must be implemented on every subclass.
     convenience modifier states that this is a secondary initializer.*/
    //    required convenience init?(coder aDecoder: NSCoder)
    //    {
    //        //test decoding on the fooditem name, if this fails the whole decode process will fail
    //        //also unwraps the optional returned and downcasts to string
    //        guard let descriptionString = aDecoder.decodeObject(forKey: PropertyKey.descriptionString) as? String else
    //        {
    //            os_log("Decode Failed", log: OSLog.default, type: .debug)
    //            return nil
    //        }
    //        //downcast returned value by decodeObject() to type UIImage, which is a conditional anyway so there is no issue if nil is returned.
    //        let eventImage = aDecoder.decodeObject(forKey: PropertyKey.eventImage) as? UIImage
    //        let eventDate = aDecoder.decodeObject(forKey: PropertyKey.eventDate) as? String
    //        let locationShort = aDecoder.decodeObject(forKey: PropertyKey.locationShort) as? String
    //        let locationLong = aDecoder.decodeObject(forKey: PropertyKey.locationLong) as? String
    //        let time = aDecoder.decodeObject(forKey: PropertyKey.time) as? String
    //        let topicName = aDecoder.decodeObject(forKey: PropertyKey.topicName) as? String
    //
    //        let attendingBool = aDecoder.decodeObject(forKey: PropertyKey.attendingBool) as? Bool
    //        let wheelBool = aDecoder.decodeObject(forKey: PropertyKey.wheelBool) as? Bool
    //        let toiletFacBool = aDecoder.decodeObject(forKey: PropertyKey.toiletFacBool) as? Bool
    //        let parkBool = aDecoder.decodeObject(forKey: PropertyKey.parkBool) as? Bool
    //        let needsTickets = aDecoder.decodeObject(forKey: PropertyKey.needsTickets) as? Bool
    //
    //        let startColor = aDecoder.decodeObject(forKey: PropertyKey.startColor) as? UIColor
    //        let endColor = aDecoder.decodeObject(forKey: PropertyKey.endColor) as? UIColor
    //
    //        //Initiliase the decoded data into the object
    //        self.init(eventDate:eventDate!, locationShort: locationShort!, locationLong: locationLong!, time: time!, descriptionString: descriptionString, eventImage:eventImage! ,attendingBool: attendingBool!, wheelBool: wheelBool!, toiletFacBool: toiletFacBool!, parkBool: parkBool!, topicName: topicName!, needsTickets: needsTickets!, startColor: startColor!, endColor: endColor!)
    //
    //    }
} //end class specifier



