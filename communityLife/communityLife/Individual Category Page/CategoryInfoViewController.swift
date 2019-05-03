//
//  CategoryInfoViewController.swift
//  communityLife
//
//  Created by Stephen Alger on 22/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.

import UIKit
import Firebase
import FirebaseDatabase

class CategoryInfoViewController: UIViewController, UICollectionViewDelegate, UINavigationControllerDelegate {
    

    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var GifImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var upcomingCatLabel: UILabel!
    @IBOutlet weak var defineCatTitleLabel: UILabel!
    @IBOutlet weak var defineCatTextView: UITextView!
    

    var categoryItem = Category.fetchCategory()
    
    //development in progress here..
    var categoryItems = Category.fetchCategories()
    var eventItems = Event.fetchEvents()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        //hardcoded for demonstration
        let gifURL = UIImage.gif(name: "soccer")
        
        //download from internet - slow needs work
        //let gifURL = UIImage.gif(url: categoryItem.topicGifURL)
        GifImage.image = gifURL
        
        catLabel.text  = categoryItem.topicName
        upcomingCatLabel.text = "Upcoming \(categoryItem.topicName) events"
        defineCatTitleLabel.text = "What is \(categoryItem.topicName)?"
        defineCatTextView.text = categoryItem.topicDescription
        
        backButton.layer.cornerRadius = 22.5
        backButton.clipsToBounds = false
        backButton.layer.shadowRadius = 5
        backButton.layer.shadowOpacity = 1
        backButton.layer.shadowOffset = CGSize(width: -1, height: 1)
        backButton.titleLabel?.shadowOffset = CGSize(width: -1, height: 1)
        
        //fill firebase once
        //uploadToFirebase()
        
        //restrict events shown only to category type
        getOnlyEventType()
        
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
    
    @IBAction func backButton(_ sender: Any) {
        let grabRefToNavigationController = navigationController
        grabRefToNavigationController?.popViewController(animated: false)
    }
    
    private func getOnlyEventType() {
        let categoryKey = categoryItem.topicName
        var index = 0
        for event in eventItems {
            if event.topicName != categoryKey
            {
                
                eventItems.remove(at: index)
            }
            else
            {
                index += 1
            }
            
        }
    }
    
    //function to upload object array categoryItems[] to firebase - implemented to populate firebase with sample data - not to be included in launch product
    private func uploadToFirebase() {

        let ref = Database.database().reference().child("Categories")

        for category in categoryItems {

            //assign random UID for category icon
            let imageName = NSUUID().uuidString

            //get Firebase storage reference location
            let storageRef = Storage.storage().reference().child("category_images").child("\(imageName).png")

            //prepare data upload from UIImage to data
            if let uploadData = category.topicIcon.pngData() {

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
                        let valueString = ["topicName": "\(category.topicName)", "topicDescription": "\(category.topicDescription)", "topicGifURL": "\(category.topicGifURL)",  "topicIcon": "\(url.absoluteString)"]

                        //perform database addition with random id for child
                        ref.childByAutoId().setValue(valueString)
                    })//end downloadURL

                })//end putData
            }//end if


        }
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
            
        //default case - will never get here...hopefully!
        default:
            fatalError("Invalid Segue Identifier Calling: \(String(describing: segue.identifier))")
        }
    }
    
    
    func addShadow(LabelToShadow: UILabel) {
        
        LabelToShadow.layer.shadowColor = UIColor.black.cgColor
        LabelToShadow.layer.shadowRadius = 3.0
        LabelToShadow.layer.shadowOpacity = 0.5
        LabelToShadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        LabelToShadow.layer.masksToBounds = false
        
    }
    
}


extension CategoryInfoViewController : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventItems.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! CategoryEventsViewCell
        
        if let topLayer = cell.layer.sublayers?.first, topLayer is CAGradientLayer
        {
            topLayer.removeFromSuperlayer()
            
        }
        
        cell.clipsToBounds = false
        cell.layer.cornerRadius = 12.0
        //        cell.layer.borderColor = UIColor.white.cgColor
        //        cell.layer.borderWidth = 2
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
        //        gradientLayer.borderColor = UIColor.white.cgColor
        //        gradientLayer.borderWidth = 2
        
        cell.layer.insertSublayer(gradientLayer, at: 0)
        
        addShadow(LabelToShadow: cell.DateLabel)
        addShadow(LabelToShadow: cell.EventLabel)
        addShadow(LabelToShadow: cell.LocationLabel)
        
        return cell
    }
    
}

extension CategoryInfoViewController : UIScrollViewDelegate
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

