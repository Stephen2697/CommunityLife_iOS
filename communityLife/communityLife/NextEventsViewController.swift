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
        
        cell.EventLabel.text = eventItems[indexPath.item].descriptionString
        cell.LocationLabel.text = eventItems[indexPath.item].locationLong
        cell.DateLabel.text = "\(eventItems[indexPath.item].time), \(eventItems[indexPath.item].eventDate)"
        cell.contentView.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 12.0
        cell.layer.shadowRadius = 1.5
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.borderWidth = 2
        
        cell.clipsToBounds = false
        cell.layer.insertSublayer(gradient(frame: cell.bounds, startColor: eventItems[indexPath.item].startColor, endColor: eventItems[indexPath.item].endColor ), at:0)
       
//        cell.layer.backgroundColor = UIColor(named: "lightRed")?.cgColor
        
        return cell
    }
    

    func gradient(frame:CGRect, startColor: UIColor, endColor: UIColor) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        print(":: \(startColor)")
        //layer.colors = [UIColor(named: "lightBlue")?.cgColor as Any, UIColor(named: "lightPurple")?.cgColor as Any]
        layer.colors = [startColor.cgColor as Any, endColor.cgColor as Any]
        layer.cornerRadius = 12.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        return layer
    }
    
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

