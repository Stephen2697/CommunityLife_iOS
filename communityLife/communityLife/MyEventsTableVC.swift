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
//        navigationItem.title = "My Events 📆"
        loadSampleEvents()
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        //self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        super.prepare(for: segue, sender: sender)
        
        //Creating a switch statement which deals with the two kinds of segues which will be encountered when using the same scene for two separate purposes... In the first case we wish to add new food items, in the second we want to edit food items. To handle these similar activities we will have to make slight adjustments to the scene based on the activity we wish to carry out
        switch(segue.identifier ?? "")
        {
            
       
        //Show item details
        case "ShowDetail":
            //constant takes the users aimed destination
            guard let EventVC = segue.destination as? EventVC else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            //save the sending table cell so we can display the corresponding food item details
            guard let selectedItemCell = sender as? MyEventsCellVC else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            //save the index path of the given cell
            guard let indexPath = tableView.indexPath(for: selectedItemCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            //take in object selected
            let selectedItem = eventItems[indexPath.row]
            EventVC.ToDisplayEventItem = selectedItem
            
        //default case - will never get here...hopefully!
        default:
            fatalError("Invalid Segue Identifier Calling: \(String(describing: segue.identifier))")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        //alert the table view controller to only display one section.
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return a single row for every food object in the 'eventItems' array.
        return eventItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EventItemTableViewCell"
        
        //We perform a downcasting on the returned object from the UITableViewCell class to our MyEventsCellVC by using 'as?'. We then use the 'guard let' expression to safely unwrap the optional just returned.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyEventsCellVC
            else
        {
            fatalError("The dequeued cell is not an instance of MyEventsCellVC.")
        }
        

        cell.contentView.backgroundColor = UIColor.clear
         let whiteRoundedView : UIView = UIView(frame: CGRect(x: 5, y: 15, width: self.view.frame.size.width - 10, height: 285))
        
        //let gradientLayer = CAGradientLayer()
        //gradientLayer.colors = [UIColor(named: "lightRed")?.cgColor as Any, UIColor(named: "lightPurple")?.cgColor as Any]
        //gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        //gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        //gradientLayer.frame = whiteRoundedView.bounds
        //        whiteRoundedView.layer.addSublayer(gradientLayer)

        
        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.9])
        

        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 4.0
        whiteRoundedView.layer.borderWidth = 1.5
        //whiteRoundedView.layer.borderColor = UIColor(named: "lightRed")?.cgColor
        whiteRoundedView.layer.borderColor = UIColor.lightGray.cgColor
        
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.1
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubviewToBack(whiteRoundedView)
        
        let eventItem = eventItems[indexPath.row]
        
        cell.Name.text = eventItem.descriptionString
        cell.Date.text = eventItem.eventDate
        cell.Time.text = eventItem.time
        cell.Location.text = eventItem.locationLong
        cell.EventImage.image = eventItem.eventImage

        return cell
    }
    
    
    private func loadSampleEvents()
    {
        
        //load in event images
        let photo1 = UIImage(named: "IrelandFootball")
        let photo2 = UIImage(named: "UCD")
        let photo3 = UIImage(named: "specialOly")
        let photo4 = UIImage(named: "LeinsterRugby")
        let photo5 = UIImage(named: "IrelandRugby")
        let photo6 = UIImage(named: "MunsterRugby")
        let photo7 = UIImage(named: "RollingStone")
        let photo8 = UIImage(named: "EltonJ")
        let photo9 = UIImage(named: "TheEagles")
        
        
        
        //create sample dates
        let newDateOne = "01/06/2019"
        let newDateTwo = "07/06/2019"
        let newDateThree = "24/06/2019"
        
        guard let eventOne = Event(eventDate: newDateOne, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo1, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 1, topicName: "Soccer", needsTickets: true,startColor: UIColor.black, endColor: UIColor.black  ) else {
            fatalError("Unable to instantiate eventOne")
        }
        
        guard let eventSeven = Event(eventDate: newDateOne, locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "8.00pm", descriptionString: "Rolling Stones Concert", eventImage: photo7, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music", needsTickets: true,startColor: UIColor.black, endColor: UIColor.black  ) else {
            fatalError("Unable to instantiate eventSeven")
        }
        
        guard let eventFour = Event(eventDate: newDateOne, locationShort: "Thomond Park", locationLong: "Thomond Park, Limerick", time: "5.30pm", descriptionString: "Munster vs Ospreys", eventImage: photo6, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2, topicName: "Rugby",needsTickets: true,startColor: UIColor.black, endColor: UIColor.black ) else {
            fatalError("Unable to instantiate eventFour")
        }
        
        guard let eventTwo = Event(eventDate: newDateTwo, locationShort: "UCD Campus", locationLong: "UCD Campus, Dublin", time: "1.30pm", descriptionString: "UCD vs Shamrock Rovers", eventImage: photo2, attendingBool: false, wheelBool: true, toiletFacBool: false, parkBool: true, topicID: 1,topicName: "Soccer", needsTickets: true,startColor: UIColor.black, endColor: UIColor.black  ) else {
            fatalError("Unable to instantiate eventTwo")
        }
        
        guard let eventFive = Event(eventDate: newDateTwo, locationShort: "UCD Campus", locationLong: "UCD Campus, Dublin", time: "1.00pm", descriptionString: "Dundrum Special Olympics Blitz", eventImage: photo3, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 1,topicName: "Sports", needsTickets: false,startColor: UIColor.black, endColor: UIColor.black ) else {
            fatalError("Unable to instantiate eventFive")
        }
        
        guard let eventEight = Event(eventDate: newDateTwo, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "4.00pm", descriptionString: "Ireland vs New Zealand", eventImage: photo5, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2,topicName: "Rugby", needsTickets: true,startColor: UIColor.black, endColor: UIColor.black  ) else {
            fatalError("Unable to instantiate eventEight")
        }
        
        guard let eventThree = Event(eventDate: newDateThree, locationShort: "RDS Donnybrook", locationLong: "RDS Donnybrook, Dublin", time: "2.30pm", descriptionString: "Leinster vs Edinburgh", eventImage: photo4, attendingBool: false, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 2, topicName: "Rugby", needsTickets: true,startColor: UIColor.black, endColor: UIColor.black ) else {
            fatalError("Unable to instantiate eventThree")
        }
        
        
        guard let eventNine = Event(eventDate: newDateThree, locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "6.30pm", descriptionString: "The Eagles Concert", eventImage: photo9, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music", needsTickets: true,startColor: UIColor.black, endColor: UIColor.black  ) else {
            fatalError("Unable to instantiate eventNine")
        }
        
        guard let eventSix = Event(eventDate: "20/07/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "7.30pm", descriptionString: "Elton John Concert", eventImage: photo8, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music", needsTickets: true,startColor: UIColor.black, endColor: UIColor.black ) else {
            fatalError("Unable to instantiate eventNine")
        }
        
        eventItems = [eventOne, eventTwo, eventThree, eventFour, eventFive, eventSix, eventSeven, eventEight, eventNine]
        
    } //end loadsample()
    
    
    
    
}

