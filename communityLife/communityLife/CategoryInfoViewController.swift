//
//  CategoryInfoViewController.swift
//  communityLife
//
//  Created by Stephen Alger on 22/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.

import UIKit


class CategoryInfoViewController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var GifImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    

    var eventItems = Event.fetchEvents()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        let gifURL4 = UIImage.gif(name: "source")
        //let gifURL4 = UIImage.gif(url: "https://media.giphy.com/media/j1gDGxFWrAaRbzbMx5/200w_d.gif)

        GifImage.image = gifURL4
        
        backButton.layer.cornerRadius = 22.5
        backButton.clipsToBounds = false
        backButton.layer.shadowRadius = 5
        backButton.layer.shadowOpacity = 1
        backButton.layer.shadowOffset = CGSize(width: -1, height: 1)
        backButton.titleLabel?.shadowOffset = CGSize(width: -1, height: 1)
        
        
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! NextEventCollectionViewCell
        
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

