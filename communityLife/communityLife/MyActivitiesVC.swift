//
//  FirstViewController.swift
//  communityLife
//
//  Created by Stephen Alger on 08/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit

class MyActivitiesVC: UIViewController {
    
    var eventItems = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.prefersLargeTitles = true
        loadSampleEvents()
       
        
    }


    private func loadSampleEvents()
    {
        
        //load in event images
        let photo1 = UIImage(named: "IrelandFootball")
        let photo2 = UIImage(named: "UCD")
        let photo3 = UIImage(named: "SpecialOlympics")
        let photo4 = UIImage(named: "LeinsterRugby")
        let photo5 = UIImage(named: "IrelandRugby")
        let photo6 = UIImage(named: "MunsterRugby")
        let photo7 = UIImage(named: "RollingStone")
        let photo8 = UIImage(named: "EltonJ")
        let photo9 = UIImage(named: "TheEagles")
        
        //create sample dates
        let newDateOne = "01/06/2019"
        let newDateTwo = "07/06/2019"
        let newDateThree = "024/06/2019"
        
        guard let eventOne = Event(eventDate: newDateOne, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo1, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventOne")
        }
        guard let eventTwo = Event(eventDate: newDateTwo, locationShort: "UCD Campus", locationLong: "UCD Campus, Dublin", time: "1.30pm", descriptionString: "UCD vs Shamrock Rovers", eventImage: photo2, attendingBool: false, wheelBool: true, toiletFacBool: false, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventTwo")
        }
        guard let eventThree = Event(eventDate: newDateThree, locationShort: "RDS Donnybrook", locationLong: "RDS Donnybrook, Dublin", time: "2.30pm", descriptionString: "Leinster vs Edinburgh", eventImage: photo3, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventThree")
        }
        guard let eventFour = Event(eventDate: newDateOne, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo4, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventFour")
        }
        guard let eventFive = Event(eventDate: newDateTwo, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo5, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventFive")
        }
        guard let eventSix = Event(eventDate: newDateThree, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo6, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventSix")
        }
        guard let eventSeven = Event(eventDate: newDateOne, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo7, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventSeven")
        }
        guard let eventEight = Event(eventDate: newDateTwo, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo8, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventEight")
        }
        guard let eventNine = Event(eventDate: newDateThree, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo9, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2 ) else {
            fatalError("Unable to instantiate eventNine")
        }
        
        
        
        
        
        eventItems = [eventOne, eventTwo, eventThree, eventFour, eventFive, eventSix, eventSeven, eventEight, eventNine]
        
    } //end loadsample()
    
}

