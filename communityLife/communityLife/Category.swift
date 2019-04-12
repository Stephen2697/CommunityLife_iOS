//
//  Category.swift
//  communityLife
//
//  Created by Stephen Alger on 12/04/2019.
//  Copyright © 2019 Stephen Alger. All rights reserved.
//

import UIKit
import os.log

class Category: NSObject
{
    
    
    //MARK: Food Variables
    //topicID, topicImageVisual, topicGifVisual, topicName
    var topicID: String
    var topicName: String
    var topicImageVisual: UIImage
   
    
    //MARK: Initialisation
    init?(topicID: String, topicName: String, topicImageVisual: UIImage?)
    {
        
        
        self.topicID = topicID //get time
        self.topicName = topicName
        self.topicImageVisual = topicImageVisual!
    
        
    }//end initialisation
    
    
} //end class specifier



