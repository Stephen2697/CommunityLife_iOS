//
//  CustomCollectionViewController.swift
//  communityLife
//
//  Created by Stephen Alger on 16/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit

class NextEventsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    //var eventItems = [Event]()
    var eventItems = Event.fetchEvents()
    let cellScaling : CGFloat = 0.6
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //loadSampleEvents()
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        collectionView?.dataSource = self
        
    }

    
//    private func loadSampleEvents()
//    {
//
//        //load in event images
//        let photo1 = UIImage(named: "IrelandFootball")
//        let photo8 = UIImage(named: "EltonJ")
//        let photo9 = UIImage(named: "TheEagles")
//
//        //create sample dates
//        let newDateOne = "01/06/2019"
//        let newDateThree = "24/06/2019"
//
//        guard let eventOne = Event(eventDate: newDateOne, locationShort: "Aviva Stadium", locationLong: "Aviva Stadium, Dublin", time: "8.30pm", descriptionString: "Ireland vs Gibraltar", eventImage: photo1, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 1, topicName: "Soccer ⚽️", needsTickets: true  ) else {
//            fatalError("Unable to instantiate eventOne")
//        }
//
//
//        guard let eventNine = Event(eventDate: newDateThree, locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "6.30pm", descriptionString: "The Eagles Concert", eventImage: photo9, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music 🎸", needsTickets: true  ) else {
//            fatalError("Unable to instantiate eventNine")
//        }
//
//        guard let eventSix = Event(eventDate: "20/07/2019", locationShort: "3Arena", locationLong: "3Arena, Dublin", time: "7.30pm", descriptionString: "Elton John Concert", eventImage: photo8, attendingBool: true, wheelBool: true, toiletFacBool: true, parkBool: true, topicID: 3,topicName: "Music 🎸", needsTickets: true ) else {
//            fatalError("Unable to instantiate eventNine")
//        }
//
//        eventItems = [eventOne, eventSix, eventNine]
//
//    } //end loadsample()
    
    
}


extension NextEventsViewController : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! NextEventCollectionViewCell
        
        cell.event = eventItems[indexPath.item]
        
        return cell
    }
}
