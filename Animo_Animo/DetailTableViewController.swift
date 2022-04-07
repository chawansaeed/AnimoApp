//
//  DetailTableViewController.swift
//  Animo_Animo
//
//  Created by Chawan Saeed on 1/10/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var animoD: AnimoInformatoin!
    var animoTableViewC: AnimoTableViewController!
    var animoDetail: [AnimoDetails] = [
    
        AnimoDetails(name: "About", details: ""),
        AnimoDetails(name: "Disease", details: ""),
        AnimoDetails(name: "Habits", details: ""),
        AnimoDetails(name: "Types", details: ""),
        AnimoDetails(name: "How dangerous is it?", details: "")
    ]
    
    @IBOutlet var animalFullImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalFullImage.image = UIImage(named: animoD.image)
        tableView.estimatedRowHeight = 60.0
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animoDetail.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailTableViewCell
        
       cell.detailLabel.text = animoDetail[indexPath.row].names
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showSuperDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
            let destinationVC = segue.destinationViewController as! AnimoSuperDetail
                
          destinationVC.animoSuperDetails = animoDetail[indexPath.row]
          destinationVC.title = ""
            //animoDetail[indexPath.row].names
            }
        }
    }
}
