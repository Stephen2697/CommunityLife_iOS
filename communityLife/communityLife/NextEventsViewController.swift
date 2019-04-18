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
    var index:Int = 0
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
//        let screenSize = UIScreen.main.bounds.size
//        let cellWidth = floor(screenSize.width * cellScaling)
//        let cellHeight = floor(screenSize.height * cellScaling)
//        
//        let insetX = (view.bounds.width - cellWidth) / 2.0
//        let insetY = (view.bounds.height - cellHeight) / 2.0
//        
//        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
//        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
//        for i in 0..<eventItems.count
//        {
//            print("[\(i)]----------------------\n")
//            print("start::\(eventItems[i].startColor)")
//            print("end:: \(eventItems[i].endColor)")
//            print("----------------------\n")
//            print("----------------------\n\n")
//        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
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
        
        cell.clipsToBounds = false
        cell.layer.cornerRadius = 12.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 2
        
        cell.EventLabel.text = eventItems[indexPath.item].descriptionString
        cell.LocationLabel.text = eventItems[indexPath.item].locationLong
        cell.DateLabel.text = "\(eventItems[indexPath.item].time), \(eventItems[indexPath.item].eventDate)"
        
        
        //testing gradient here
        //cell.layer.insertSublayer(gradient(frame: cell.bounds, startColor: eventItems[indexPath.item].startColor, endColor: eventItems[indexPath.item].endColor ), at:0)
        
        var gradientLayer = CAGradientLayer()
        
        if let existingLayer = (cell.layer.sublayers?.compactMap { $0 as? CAGradientLayer })?.first {
            gradientLayer = existingLayer
            index += 1
            //print("***\n\(index) - top layer exists\n***")
        }
        
        gradientLayer.frame = cell.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [eventItems[indexPath.item].startColor.cgColor as Any, eventItems[indexPath.item].endColor.cgColor as Any]
        //gradientLayer.colors = [eventItems[indexPath.item].startColor as Any, eventItems[indexPath.item].endColor as Any]
        
        gradientLayer.cornerRadius = 12.0
        gradientLayer.borderColor = UIColor.white.cgColor
        gradientLayer.borderWidth = 2
        cell.layer.insertSublayer(gradientLayer, at:0)
        
        
        if let sublayers = cell.layer.sublayers
        {
            for sublayer in sublayers
            {
                    print("***\n\(sublayer)***\n")
                
            }
        }

        
        return cell
    }
    

    
//    func gradient(frame:CGRect, startColor: UIColor, endColor: UIColor) -> CAGradientLayer {
//        var gradientLayer = CAGradientLayer()
//
//        if let existingLayer = (layer.sublayers?.compactMap { $0 as? CAGradientLayer })?.first {
//            gradientLayer = existingLayer
//            print("***top layer exists\n**")
//        }
//
//        layer.frame = frame
//        layer.startPoint = CGPoint(x: 0, y: 0)
//        layer.endPoint = CGPoint(x: 1, y: 1)
//
//        layer.colors = [startColor.cgColor as Any, endColor.cgColor as Any]
//        layer.cornerRadius = 12.0
//        layer.borderColor = UIColor.white.cgColor
//        layer.borderWidth = 2
//        return layer
//    }
    
}

extension NextEventsViewController : UIScrollViewDelegate, UICollectionViewDelegate
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

