//
//  CustomCollectionViewController.swift
//  communityLife
//
//  Created by Stephen Alger on 16/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class NextEventsViewController: UIViewController,UICollectionViewDelegate {
    
    @IBOutlet weak var upcomingEvent: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var upcomingViewTitle: UILabel!
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var horizontalLine: UIView!

    
    var eventItems = Event.fetchEvents()
//    var categoryItems = Category.fetchEvents()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        styleUpcomingEventView()
        addShadow(LabelToShadow: upcomingViewTitle)
        addShadow(LabelToShadow: todayDateLabel)
        addShadow(LabelToShadow: viewTitle)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        todayDateLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        upcomingViewTitle.textColor = UIColor.white
        viewTitle.textColor = UIColor.white
        horizontalLine.backgroundColor = UIColor.white
        
        
        //let gifURL = UIImage.gif(url: "https://thumbs.gfycat.com/AromaticAgedAfricanwildcat-size_restricted.gif")
        
        //uploadToFirebase() //-- called once to populate firebase with sample data
    }
    
    //function to upload object array event[] to firebase - implemented to populate firebase with sample data - not to be included in launch product
    private func uploadToFirebase() {
        
        let ref = Database.database().reference()

        for event in eventItems {
            
            //assign random UID for image
            let imageName = NSUUID().uuidString
            
            //get Firebase storage reference location
            let storageRef = Storage.storage().reference().child("event_images").child("\(imageName).png")
            
            //prepare data upload from UIImage to data
            if let uploadData = event.eventImage.pngData() {
                
                //perform data put to firebase
                storageRef.putData(uploadData, metadata: nil, completion: {
                    (_, err) in

                    if let error = err {
                        print("\n***Put Failed - \(error)****\n")
                        return
                    }
                    
                    //process of getting URL location
                    storageRef.downloadURL(completion: {
                        (url, err) in
                        
                        if let error = err {
                            print("\n***URL Failed \(error)****\n")
                            return
                        }

                        guard let url = url else { return }
                        
                        //structure new entry into firebase db
                        let valueString = ["eventDate": "\(event.eventDate)", "locationShort": "\(event.locationShort)", "locationLong": "\(event.locationLong)", "time": "\(event.time)", "descriptionString": "\(event.descriptionString)", "eventImage": "\(url.absoluteString)", "attendingBool": "\(event.attendingBool)", "wheelBool": "\(event.wheelBool)", "toiletFacBool": "\(event.toiletFacBool)", "parkBool": "\(event.parkBool)", "topicID": "\(event.topicID)","topicName": "\(event.topicName)", "needsTickets": "\(event.needsTickets)","startColor": "\(event.startColor)", "endColor": "\(event.endColor)"]

                        //perform database addition with random id for child
                        ref.childByAutoId().setValue(valueString)
                    })//end downloadURL

                })//end putData
            }//end if
            
            
        }
    }

    
    @IBAction func toCatPage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toCatPage", sender: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        super.prepare(for: segue, sender: sender)
        
        //Creating a switch statement which deals with the two kinds of segues which will be encountered when using the same scene for two separate purposes... In the first case we wish to add new food items, in the second we want to edit food items. To handle these similar activities we will have to make slight adjustments to the scene based on the activity we wish to carry out
        switch(segue.identifier ?? "")
        {
            
            
        //Show item details
        case "ShowDetailNextEvent":
            //constant takes the users aimed destination
            guard let EventVC = segue.destination as? EventVC else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            //save the sending table cell so we can display the corresponding food item details
            guard let selectedItemCell = sender as? NextEventCollectionViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            //save the index path of the given cell
            guard let indexPath = collectionView.indexPath(for: selectedItemCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            //take in object selected
            let selectedItem = eventItems[indexPath.row]
            EventVC.ToDisplayEventItem = selectedItem
        case "toCatPage":
            //constant takes the users aimed destination
            guard segue.destination is CategoryInfoViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
        //default case - will never get here...hopefully!
        default:
            fatalError("Invalid Segue Identifier Calling: \(String(describing: segue.identifier))")
        }
    }
    
    private func styleUpcomingEventView()
    {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = upcomingEvent.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //gradientLayer.colors = [UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0).cgColor as Any, UIColor(red:0.20, green:0.20, blue:0.59, alpha:1.0).cgColor as Any]
        gradientLayer.colors = [UIColor(red:0.20, green:0.20, blue:0.59, alpha:1.0).cgColor as Any, UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0).cgColor as Any]
        

        
        upcomingEvent.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func addShadow(LabelToShadow: UILabel) {
        
        LabelToShadow.layer.shadowColor = UIColor.black.cgColor
        LabelToShadow.layer.shadowRadius = 3.0
        LabelToShadow.layer.shadowOpacity = 0.5
        LabelToShadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        LabelToShadow.layer.masksToBounds = false

    }
    
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
        
        if let topLayer = cell.layer.sublayers?.first, topLayer is CAGradientLayer
        {
            topLayer.removeFromSuperlayer()
            
        }
        
        cell.clipsToBounds = false
        cell.layer.cornerRadius = 12.0

        cell.layer.shadowRadius = 1.5
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        cell.EventLabel.text = eventItems[indexPath.item].descriptionString
        cell.LocationLabel.text = eventItems[indexPath.item].locationLong
        cell.DateLabel.text = "\(eventItems[indexPath.item].time), \(eventItems[indexPath.item].eventDate)"
        
        var gradientLayer = CAGradientLayer()

        if let existingLayer = (cell.layer.sublayers?.compactMap { $0 as? CAGradientLayer })?.first {
            gradientLayer = existingLayer
        }

        gradientLayer.frame = cell.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [eventItems[indexPath.item].startColor.cgColor as Any, eventItems[indexPath.item].endColor.cgColor as Any]

        gradientLayer.cornerRadius = 12.0

        cell.layer.insertSublayer(gradientLayer, at: 0)
        
        addShadow(LabelToShadow: cell.DateLabel)
        addShadow(LabelToShadow: cell.EventLabel)
        addShadow(LabelToShadow: cell.LocationLabel)

        return cell
    }
    
}

extension NextEventsViewController : UIScrollViewDelegate
{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

