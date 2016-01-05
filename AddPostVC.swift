//
//  AddPostVC.swift
//  AroundMe
//
//  Created by Yeswanth varma Kanumuri on 1/3/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var enterTitle: UITextField!
    @IBOutlet weak var EnterDescription: UITextField!
    
    
    var imagePicker : UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        postImg.layer.cornerRadius = postImg.frame.size.width/2
        postImg.clipsToBounds = true

       imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddPicButnPressed(sender: UIButton) {
        
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    @IBAction func CancleButnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }

    @IBAction func MakePostButnPressed(sender: AnyObject) {
        
        if let title = enterTitle.text , let desc = EnterDescription.text , let img = postImg.image {
        
            
            
            let imgPath = DataService.instance.saveIMgandCreatPath(img)
       let post = Post(path: imgPath, title: title, postDesc: desc)
            DataService.instance.AddNewPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
        
        
    }
    
    
    
    
}
