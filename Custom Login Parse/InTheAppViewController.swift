//
//  InTheAppViewController.swift
//  Custom Login Parse
//
//  Created by Annemarie Ketola on 7/15/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse

class InTheAppViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var intheappLabel: UILabel!
    @IBOutlet weak var bikeTableView: UITableView!
    
    var bicycleObjects: NSMutableArray! = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetch all the bikes
        fetchAllObjects()
        println("All the Bicycles:\(bicycleObjects)")
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("The Bicycle you picked:")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bicycleObjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        var object: PFObject = self.bicycleObjects.objectAtIndex(indexPath.row) as! PFObject
        println("Object: \(object)")
        
        cell.modelLabel.text = object["modelName"] as? String
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchAllObjects() {
        PFObject.unpinAllObjectsInBackgroundWithBlock(nil)
        var query: PFQuery = PFQuery(className: "Bicycle")
        
        query.whereKey("brandName", equalTo: "Santa Cruz")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if (error == nil) {
                PFObject.pinAllInBackground(objects, block: nil)
//                self.fetchAllObjectsFromLocalDataStore()  // we aren't storing any in our device
            } else {
                println(error?.userInfo)
            }
        }
        
        
        
        
        
        
        
        
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    
}
