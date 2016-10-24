//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories: [GithubRepository] = []
    
    func getRepositoriesFromAPI(_ completion: @escaping () -> ()) {
        
        GithubAPIClient.getRepositories { (reposArray) in
            
            print("######")
            print(reposArray)
      
            self.repositories.removeAll()
            
            for dictionary in reposArray {
                let repository = GithubRepository(dictionary: dictionary)
                self.repositories.append(repository)
                
            }
            
            if self.repositories.count > 0 {
                completion()
            }
        }
    }
}
