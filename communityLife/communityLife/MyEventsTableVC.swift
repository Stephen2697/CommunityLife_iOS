//
//  MyEventsTableVC.swift
//  communityLife
//
//  Created by Stephen Alger on 12/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit
import os.log

class MyEventsTableVC: UITableViewController {
    
    //create array of objects of class type: foodItem
    var eventItems = [Event]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadSampleEvents()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.separatorStyle = .none
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        //alert the table view controller to only display one section.
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return a single row for every food object in the 'eventItems' array.
        return eventItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EventItemTableViewCell"
        
        //We perform a downcasting on the returned object from the UITableViewCell class to our MyEventsCellVC by using 'as?'. We then use the 'guard let' expression to safely unwrap the optional just returned.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyEventsCellVC
            else
        {
            fatalError("The dequeued cell is not an instance of MyEventsCellVC.")
        }

        let eventItem = eventItems[indexPath.row]
        
        cell.Name.text = eventItem.descriptionString
        cell.Date.text = eventItem.eventDate
        cell.Time.text = eventItem.time
        cell.Location.text = eventItem.locationLong
        cell.EventImage.image = eventItem.eventImage

        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor =  UIColor(named: "blackBorder")?.cgColor
        return cell
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

