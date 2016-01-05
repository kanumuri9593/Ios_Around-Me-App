//
//  File.swift
//  AroundMe
//
//  Created by Yeswanth varma Kanumuri on 1/3/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import Foundation


class Post : NSObject , NSCoding {
    private var _imgpath : String!
    private var _title : String!
    private var _postDesc : String!
    
    var imgpath : String {
    return _imgpath
    
    }
    var title : String {
        return _title
        
    }
    var postDesc : String {
        return _postDesc
        
    }

    
    
    init( path : String , title :String , postDesc : String){
    
    self._imgpath = path
        self._title = title
        self._postDesc = postDesc
    
    }

    override init(){}
    
    required convenience init?(coder aDecoder : NSCoder){
    
    self.init()
        self._imgpath = aDecoder.decodeObjectForKey("imgPath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("description") as? String
    
    
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_imgpath, forKey: "imgPath")
        aCoder.encodeObject(_title, forKey: "title")
        aCoder.encodeObject(_postDesc, forKey: "description")
        
    }
    
    
}



