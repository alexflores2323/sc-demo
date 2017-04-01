//
//  usersVC.swift
//  insta
//
//  Created by Logan Caracci on 3/26/17.
//  Copyright © 2017 Logan Caracci. All rights reserved.
//

import UIKit
import Parse

class usersVC: UITableViewController, UISearchBarDelegate {
    
    

    
    // declare search bar
    var searchBar = UISearchBar()
    
    // arrays to hold shit from server
    
    var usernameArray = [String]()
    var avaArray = [PFFile]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // implement search
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.sizeToFit()
        searchBar.tintColor = UIColor.groupTableViewBackground
        searchBar.frame.size.width = self.view.frame.size.width - 30
        
        let searchItem = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = searchItem
        
        // call function
        loadUsers()
        
    }
    
    // load users function
    func loadUsers() {
        
        let userQuery = PFQuery(className: "_User")
        userQuery.addDescendingOrder("createdAt")
        userQuery.limit = 20
        userQuery.findObjectsInBackground (block: { (objects, error) in
            if error == nil {
                
                // clean up
                self.usernameArray.removeAll(keepingCapacity: false)
                self.avaArray.removeAll(keepingCapacity: false)
                
                // go thru each object and do this !!!!!!!!!!!!!
                for object in objects! {
                    self.usernameArray.append(object.value(forKey: "username") as! String)
                    self.avaArray.append(object.value(forKey: "ava") as! PFFile)
                    
                }
                
                // dont forget to reload ;)
                self.tableView.reloadData()
                
            } else {
                print(error!.localizedDescription)
            }
        })
    }

    // search updated
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // find by username
        let usernameQuery = PFQuery(className: "_User")
        usernameQuery.whereKey("username", matchesRegex: "(?i)" + searchBar.text!)
        usernameQuery.findObjectsInBackground (block: { (objects, error) -> Void in
            if error == nil {
                
                // if no objects are found according to entered text in usernaem colomn, find by fullname
                if objects!.isEmpty {
                    
                    let fullnameQuery = PFUser.query()
                    fullnameQuery?.whereKey("fullname", matchesRegex: "(?i)" + self.searchBar.text!)
                    fullnameQuery?.findObjectsInBackground(block: { (objects, error) -> Void in
                        if error == nil {
                            
                            // clean up
                            self.usernameArray.removeAll(keepingCapacity: false)
                            self.avaArray.removeAll(keepingCapacity: false)
                            
                            // go thru each object and do this
                            for object in objects! {
                                self.usernameArray.append(object.object(forKey: "username") as! String)
                                self.avaArray.append(object.object(forKey: "ava") as! PFFile)
                            }
                            
                            // reload
                            self.tableView.reloadData()
                            
                        }
                    })
                }
                
                // clean up
                self.usernameArray.removeAll(keepingCapacity: false)
                self.avaArray.removeAll(keepingCapacity: false)
                
                // found related objects
                for object in objects! {
                    self.usernameArray.append(object.object(forKey: "username") as! String)
                    self.avaArray.append(object.object(forKey: "ava") as! PFFile)
                }
                
                // reload
                self.tableView.reloadData()
                
            }
        })
        
        return true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   
}
