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
    
    //MARK: Category Variables
    //topicID, topicImageVisual, topicGifVisual, topicName
    
    var topicName: String
    var topicDescription: String
    var topicIcon: UIImage
    var topicGifURL: String
    var isFavourite: Bool
   
    
    //MARK: Initialisation
    init?(topicDescription: String, topicName: String, topicIcon: UIImage, topicGifURL: String, isFavourite: Bool)
    {
        
        
        self.topicDescription = topicDescription //get time
        self.topicName = topicName
        self.topicIcon = topicIcon
        self.topicGifURL = topicGifURL
        self.isFavourite = isFavourite
    
        
    }//end initialisation
    
    
    static func fetchCategory() -> Category
    {
        return Category(topicDescription: "Football or Soccer, is a team sport played with a circular ball between two teams of eleven players. It is played by 250 million players worldwide!", topicName: "Soccer", topicIcon: UIImage(named: "footballCat")!, topicGifURL: "https://media.giphy.com/media/Lqsij1GjWKHLy/giphy.gif", isFavourite: false)!
        
    }
    
    
    static func fetchCategories() -> [Category]
    {
        return [
            
            Category(topicDescription: "Football or Soccer, is a team sport played with a circular ball between two teams of eleven players. It is played by 250 million players worldwide!", topicName: "Soccer", topicIcon: UIImage(named: "footballCat")!, topicGifURL: "https://media.giphy.com/media/Lqsij1GjWKHLy/giphy.gif", isFavourite: false)!,
            
            Category(topicDescription: "Rugby is a popular sport around the world, played by male and female players of all ages. Rugby is a game between two teams of fifteen players using an oval-shaped ball on a rectangular field with H-shaped goalposts at each end.", topicName: "Rugby", topicIcon: UIImage(named: "rugbyCat")!, topicGifURL: "https://media.giphy.com/media/j1gDGxFWrAaRbzbMx5/200w_d.gif", isFavourite: false)!,
            
            Category(topicDescription: "Music is a type of art, we listen and sing music for enjoyment. People can play different types of music with different instruments like Guitar and Drums", topicName: "Music", topicIcon: UIImage(named: "guitarCat")!, topicGifURL: "https://media.giphy.com/media/xTiTnnnWvRXTeXx3wc/giphy.gif", isFavourite: false)!

        ]
    }
    
    
    
} //end class specifier



