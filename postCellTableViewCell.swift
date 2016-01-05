//
//  postCellTableViewCell.swift
//  AroundMe
//
//  Created by Yeswanth varma Kanumuri on 1/3/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import UIKit

class postCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImg :UIImageView!
    @IBOutlet weak var titleLabel :UILabel!
    @IBOutlet weak var descLabel :UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
             
        
        postImg.layer.cornerRadius = postImg.frame.size.width/2
        postImg.clipsToBounds = true
        
        
    }
    
    
    
    func configCell (post : Post){
    
    titleLabel.text = post.title
        descLabel.text = post.postDesc
        postImg.image = DataService.instance.imgForPath(post.imgpath)
        
    
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
