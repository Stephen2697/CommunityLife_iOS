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
    
    var topicName: String
    var topicDescription: String
    var topicImageURL: String
   
    
    //MARK: Initialisation
    init?(topicDescription: String, topicName: String, topicImageURL: String)
    {
        
        
        self.topicDescription = topicDescription //get time
        self.topicName = topicName
        self.topicImageURL = topicImageURL
    
        
    }//end initialisation
    
    static func fetchEvents() -> [Category]
    {
        return [
            
            
            
            Category(topicDescription: "Rugby is a sport.....", topicName: "Rugby", topicImageURL: "https://makeagif.com/i/AP39Mi")!
            
        
            
        ]
    }
    
    
    
} //end class specifier



