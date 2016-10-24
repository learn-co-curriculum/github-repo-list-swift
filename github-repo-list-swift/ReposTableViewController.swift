//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    var store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        
        store.getRepositoriesFromAPI {
            
            OperationQueue.main.addOperation({
                
                self.tableView.reloadData()
            })
        }
        
                
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      return  1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return store.repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
        
        let repo = store.repositories[indexPath.row]
        
        cell.textLabel?.text = repo.fullName
        
        return cell
    }

    // MARK: - Table view data source
 

}
