//
//  AboutTableViewController.swift
//  Animo_Animo
//
//  Created by Chawan Saeed on 1/12/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {

    var sectionTitles = ["Leave Feedback", "Follow Us"]
    var sectionContent = [["Rate us on App Store", "Tell us your feedback"],["Instagram", "Facebook"]]
    var links = ["https://www.instagram.com/chawan_saeed/", "https://www.facebook.com/chawan.saeed.925"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionContent[section].count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
    // Configure the cell...
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]
        
        return cell
    }
   
override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    switch indexPath.section {
        // Leave us feedback section
    case 0:
        if indexPath.row == 0 {
            if let url = NSURL(string: "http://www.apple.com/itunes/charts/paid-apps/") {
                
            UIApplication.sharedApplication().openURL(url)
             
            }
        } else if indexPath.row == 1 {
            performSegueWithIdentifier("sendEmail", sender: self)
        }
        
    // Follow us section
    case 1:
        if let url = NSURL(string: links[indexPath.row]) {
            let safariController = SFSafariViewController(URL: url)
            presentViewController(safariController, animated: true, completion: nil)
        }
    default: break
      }
    
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
}