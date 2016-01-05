//
//  dataService.swift
//  AroundMe
//
//  Created by Yeswanth varma Kanumuri on 1/4/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import Foundation
import UIKit


class DataService {
    
    static let instance = DataService()
    
    private var _loadPosts = [Post]()
    
    
    let key_posts = "posts"
    
    var loadPosts :[Post] {
    
    return _loadPosts
    
    }
    
    func SavePosts() {
        
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadPosts)
        
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: key_posts)
        NSUserDefaults.standardUserDefaults().synchronize()
    
    }
    
    func LoadPosts () {
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(key_posts) as? NSData {
        
            if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
            
               _loadPosts = postArray
                
            }
        
        }
    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postLoaded", object: nil))
    
    }
    func saveIMgandCreatPath (image :UIImage) ->String {
    
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
        
        
    }
    func imgForPath (path :String) ->UIImage? {
    
    let fullPath = documentPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    
    
    }
    
    func AddNewPost (post :Post) {
    
    _loadPosts.append(post)
        SavePosts()
        LoadPosts()
        
    
    
    
    
    }
    
    func documentPathForFileName(name :String) -> String {
    
        let paths =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
        
    
    
    }
    
    
    
}
