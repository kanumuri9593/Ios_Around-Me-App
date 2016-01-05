//
//  ViewController.swift
//  AroundMe
//
//  Created by Yeswanth varma Kanumuri on 1/3/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource {

    var posts = [Post]()
    
    @IBOutlet weak var tabelView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabelView.delegate = self
        tabelView.dataSource = self
 
        DataService.instance.LoadPosts()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "postLoaded", object: nil)
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let post = DataService.instance.loadPosts[indexPath.row]
        if let cell = tabelView.dequeueReusableCellWithIdentifier("postCell") as? postCellTableViewCell {
        
        
        cell.configCell(post)
            return cell
        } else {
        
        let cell = postCellTableViewCell()
            cell.configCell(post)
            return cell
        
        
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadPosts.count
    }
    
    func onPostsLoaded (notif :AnyObject){
    
    
    
    tabelView.reloadData()
    
    }
    
    
    
    
}

