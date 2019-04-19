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

        //navigationController?.navigationBar.prefersLargeTitles = true
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
        
        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.9])
        

        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 4.0
        whiteRoundedView.layer.borderWidth = 1.5
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
    
    private func getOnlyAttendingEvents()
    {
        
    }
    
    
    
    
}

