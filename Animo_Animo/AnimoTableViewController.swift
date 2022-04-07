//
//  AnimoTableViewController.swift
//  Animo_Animo
//
//  Created by Chawan Saeed on 1/8/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class AnimoTableViewController: UITableViewController, UISearchResultsUpdating {

    var informations: [AnimoInformatoin] = [
        AnimoInformatoin(name: "African Elephant", image: "african elephant", detail: "this is african elephant"),
        AnimoInformatoin(name: "Albatros", image: "albatros", detail: "hi"),
        AnimoInformatoin(name: "Bears", image: "bears", detail: ""),
        AnimoInformatoin(name: "Cat", image: "cat", detail: ""),
        AnimoInformatoin(name: "Cockatiel", image: "cockatiel", detail: "i love rice"),
        AnimoInformatoin(name: "Cow", image: "cow", detail: ""),
        AnimoInformatoin(name: "Deer", image: "deer", detail: ""),
        AnimoInformatoin(name: "Dog", image: "dog", detail: ""),
        AnimoInformatoin(name: "Giant Panda", image: "giant panda", detail: ""),
        AnimoInformatoin(name: "Kangaroo", image: "kangaroo", detail: ""),
        AnimoInformatoin(name: "Koala", image: "koala", detail: ""),
        AnimoInformatoin(name: "Leopard", image: "leopard", detail: ""),
        AnimoInformatoin(name: "Llama", image: "llama", detail: ""),
        AnimoInformatoin(name: "Mouse", image: "mouse", detail: ""),
        AnimoInformatoin(name: "Parrot", image: "parrot", detail: ""),
        AnimoInformatoin(name: "Penguins", image: "penguins", detail: ""),
        AnimoInformatoin(name: "Polar Bears", image: "polar bears", detail: ""),
        AnimoInformatoin(name: "Rabbit", image: "rabbit", detail: ""),
        AnimoInformatoin(name: "Sheep", image: "sheep", detail: ""),
        AnimoInformatoin(name: "Sloth", image: "sloth", detail: "")
    ]
    
    var searchController:UISearchController!
    var searchResults: [AnimoInformatoin] = []
    var animalSuperDetail: AnimoSuperDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80.0
        
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search animals..."
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.active {
            return searchResults.count
        } else {
            return informations.count
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AnimoTableViewCell
        
    // Determine if we get the restaurant from search result or the original array
        
        let information = (searchController.active) ? searchResults[indexPath.row] : informations[indexPath.row]
    
        cell.animoName.text = informations[indexPath.row].name
        cell.animoImageView?.image = UIImage(named: information.image)
        cell.animoImageView.clipsToBounds = true
        cell.animoImageView.layer.cornerRadius = 30.0
        
            return cell
    }
    
    func filterContent(searchText: String) {
        searchResults = informations.filter({(information) -> Bool in
        let name = information.name
        let isMatch = name.localizedCaseInsensitiveContainsString(searchText)
            return isMatch
        })
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            filterContent(searchText)
            tableView.reloadData()
        }
    }
    
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
            let destinatoinVC = segue.destinationViewController as! DetailTableViewController
                
            destinatoinVC.animoD = (searchController.active) ? searchResults[indexPath.row] : informations[indexPath.row]
                
            destinatoinVC.title = informations[indexPath.row].name
                
            }
        }
    }
}