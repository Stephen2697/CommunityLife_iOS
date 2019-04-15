//
//  EventVC.swift
//  communityLife
//
//  Created by Stephen Alger on 12/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit

class EventVC: UIViewController, UINavigationControllerDelegate {
    
    //Mark: configure alerts - instantiate
    var alert = UIAlertController()

    //Mark: UI Elements declaration
    @IBOutlet weak var EventImage: UIImageView!
    @IBOutlet weak var EventLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var WCAccessibleIcon: UIImageView!
    @IBOutlet weak var PKAccessibleIcon: UIImageView!
    @IBOutlet weak var ticketLabel: UILabel!
    @IBOutlet weak var AccessWCFacilityIcon: UIImageView!
    @IBOutlet weak var DateTimeLabel: UILabel!
    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    
    
    var ToDisplayEventItem: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = ToDisplayEventItem?.topicName
        EventImage.image = ToDisplayEventItem?.eventImage
        EventLabel.text = ToDisplayEventItem?.descriptionString
        CategoryLabel.text = ToDisplayEventItem?.topicName
        LocationLabel.text = ToDisplayEventItem?.locationLong
        DateTimeLabel.text = "\(ToDisplayEventItem?.time ?? "error"), \(ToDisplayEventItem?.eventDate ?? "error")"
        WCAccessibleIcon.image = UIImage(named: "Accessible")
        AccessWCFacilityIcon.image = UIImage(named: "Toilet")
        PKAccessibleIcon.image = UIImage(named: "Parking")
        
        if ToDisplayEventItem?.needsTickets == true
        {
            ticketLabel.text = "This Event Requires Tickets 🎟"
            buttonLabel.setTitle("Get Tickets", for: .normal)
            ticketLabel.textColor = UIColor(named: "red")
        
        }
        else
        {
            ticketLabel.text = "No Tickets Required"
            buttonLabel.setTitle("Add to Calendar", for: .normal)
            ticketLabel.textColor = UIColor(named: "black")
        }
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false

    }
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        let grabRefToNavigationController = navigationController
        grabRefToNavigationController?.popViewController(animated: true)
    }
    

    
    @IBAction func AttendBTN(_ sender: Any) {
        
        if ToDisplayEventItem?.needsTickets == true
        {
            alert = UIAlertController(title: "Tickets Required", message: "To be allowed into this event, you will need tickets", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                self.performSegue(withIdentifier: "BackToMyEvents", sender: nil)
            }
            
            alert.addAction(action1)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        else
        {
        
            alert = UIAlertController(title: "Event Saved", message: "This event has been saved to the 'My Events' section", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                self.performSegue(withIdentifier: "BackToMyEvents", sender: nil)
            }
            
            alert.addAction(action1)
            self.present(alert, animated: true, completion: nil)
            
            //add to favourites
            //feedback that im attending on event page
            //notify creator?
        }
    }
    
}
